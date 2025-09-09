// Test setup methods help you create common test data easily and efficiently
// Test setup methods are defined in a test class, takes no arguments, and return no value
// You can create one test setup method per apex class
// Test setup methods are annotated with @testSetup
/* Example:
@testSetup 
public static void prepareData() {
    // Create common test accounts
    List<Account> testAccts = new List<Account>();
    for (Integer i=0; i<2; i++) {
        testActs.add(new Account(Name='Test Account ' + i));
    }
    insert testAccts;
}
*/
@isTest
public with sharing class ContactTriggerHandlerTest {

    @testSetup 
    public static void makeData() {
        // Creates bulk data for test methods to use
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name='Test 1'));
        testAccounts.add(new Account(Name='Test 2'));

        insert testAccounts;

        List<Contact> testContacts = new List<Contact>();
        testContacts.add(new Contact(LastName='Test Contact 1', AccountId=testAccounts[0].Id, Active__c = true));
        testContacts.add(new Contact(LastName='Test Contact 2', AccountId=testAccounts[0].Id, Active__c = true));
        testContacts.add(new Contact(LastName='Test Contact 3', AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 4', AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 5', AccountId=testAccounts[1].Id));
        
        insert testContacts;
    }

    @isTest
    public static void afterInsertHandlerTest2() {
        // SOQL queries inside test methods do not access the database, they only use the test data created
        List<Account> accs = [SELECT Id, Active_Contacts__c FROM Account];
        System.assertEquals(2, accs.size());
        for (Account acc : accs) {
            if (acc.Name == 'Test 1') {
                System.assertEquals(2, accs[0].Active_Contacts__c);
            }
            if (acc.Name == 'Test 1') {
                // 0 values are considered null in Apex
                System.assertEquals(null, accs[0].Active_Contacts__c);
            }
        }

        List<Contact> allContacts = [SELECT Id FROM Contact];
        System.assertEquals(5, allContacts.size());
    }

    @isTest
    public static void afterInsertHandlerTestBulk() {
        Account testAccount1 = [SELECT Id FROM Account WHERE Name = 'Test 1'];
        List<Contact> testContacts = new List<Contact>();
        // Creates 1000 contacts fpr Account object 'Test 1'
        for (Integer i = 0; i < 1000; i++) {
            testContacts.add(new Contact(LastName = 'Test Contact ' + i, AccountId = testAccount1.Id, Active__c = true));
        }

        insert testContacts;

        List<Account> accs = [SELECT Id, Name, Active_Contacts__c FROM Account];
        System.assertEquals(2, accs.size());
        for (Account acc : accs) {
            // Checks if there are 1002 active contacts for the account
            if (acc.Name == 'Test 1') {
                System.assertEquals(1002, acc.Active_Contacts__c);
            }
            if (acc.Name == 'Test 2') {
                System.assertEquals(null, acc.Active_Contacts__c);
            }
        }

        List<Contact> allContacts = [SELECT Id FROM Contact];
        System.assertEquals(1005, allContacts.size());
    }

    @isTest
    public static void afterUpdateHandlerTest() {
        // Marks contact as active if their LastName is 'Test Contact 3' or 'Test Contact 4'        
        List<Contact> allContacts = [SELECT Id, LastName FROM Contact];
        for (Contact c : allContacts) {
            if (c.LastName == 'Test Contact 3' || con.LastName == 'Test Contact 4') {
                c.Active__c = true;
            }
        }

        // Allocate new set of governor limits
        Test.startTest();
        update allContacts;
        Test.stopTest();

        List<Account> accs = [SELECT Id, Name, Active_Contacts__c FROM Account];
        System.assertEquals(2, accs.size());
        for (Account acc : accs) {
            if (acc.Name == 'Test 1') {
                System.assertEquals(4, acc.Active_Contacts__c);
            }
            if (acc.Name == 'Test 2') {
                System.assertEquals(null, acc.Active_Contacts__c);
            }
        }
        System.assertEquals(5, allContacts.size());
    }

    @isTest
    public static void afterUpdateHandlerTest2() {
        Account testAccount2 = [SELECT Id FROM Account WHERE Name = 'Test 2'];
        List<Contact> allContacts = [SELECT Id, LastName FROM Contact];
        for (Contact c : allContacts) {
            // Changes account as active and Account ID changes to the second account
            if (c.LastName == 'Test Contact 3') {
                c.Active__c = true;
                c.AccountId = testAccounts2.Id;
            }
        }

        // Allocate new set of governor limits
        Test.startTest();
        update allContacts;
        Test.stopTest();

        List<Account> accs = [SELECT Id, Name, Active_Contacts__c FROM Account];
        System.assertEquals(2, accs.size());
        for (Account acc : accs) {
            if (acc.Name == 'Test 1') {
                System.assertEquals(null, acc.Active_Contacts__c);
            }
            if (acc.Name == 'Test 2') {
                System.assertEquals(1, acc.Active_Contacts__c);
            }
        }
        System.assertEquals(5, allContacts.size());
    }
}