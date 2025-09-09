// Test.startTest() marks the point in your test code when your test actually begins
// Each test method is allowed to call this method only once

// Test.stopTest() marks the point in your test code when your test ends
// Each test method is allowed to call this method only once
@isTest
public with sharing class ContactTriggerHandlerTest {

    @isTest
    public static void afterInsertHandlerTest() {
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name='Test 1'));
        testAccounts.add(new Account(Name='Test 2'));

        insert testAccounts;

        List<Contact> testContacts = new List<Contact>();
        testContacts.add(new Contact(LastName='Test Contact 1', AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 2', AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 3', AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 4', AccountId=testAccounts[0].Id));
        testContacts.add(new Contact(LastName='Test Contact 5', AccountId=testAccounts[1].Id));
        
        insert testContacts;

        // SOQL queries inside test methods do not access the database, they only use the test data created
        List<Account> accs = [SELECT Id, Active_Contacts__c FROM Account];
        System.assertEquals(2, accs.size());
        System.assertEquals(null, accs[0].Active_Contacts__c);
        System.assertEquals(null, accs[1].Active_Contacts__c);

        List<Contact> allContacts = [SELECT Id FROM Contact];
        System.assertEquals(5, allContacts.size());
    }

        @isTest
    public static void afterInsertHandlerTest2() {
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
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name = 'Test 1'));
        testAccounts.add(new Account(Name = 'Test 2'));

        insert testAccounts;

        List<Contact> testContacts = new List<Contact>();
        // Creates 1000 contacts fpr Account object 'Test 1'
        for (Integer i = 0; i < 1000; i++) {
            testContacts.add(new Contact(LastName = 'Test Contact ' + i, AccountId = testAccounts[0].Id, Active__c = true));
        }
        testContacts.add(new Contact(LastName = 'Test Contact Inactive 1', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact Inactive 2', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact Inactive 3', AccountId = testAccounts[1].Id));

        insert testContacts;

        List<Account> accs = [SELECT Id, Name, Active_Contacts__c FROM Account];
        System.assertEquals(2, accs.size());
        for (Account acc : accs) {
            // Checks if there are 1000 active contacts for the account
            if (acc.Name == 'Test 1') {
                System.assertEquals(1000, acc.Active_Contacts__c);
            }
            if (acc.Name == 'Test 2') {
                System.assertEquals(null, acc.Active_Contacts__c);
            }
        }

        List<Contact> allContacts = [SELECT Id FROM Contact];
        System.assertEquals(1003, allContacts.size());
    }

    @isTest
    public static void afterUpdateHandlerTest() {
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
        
        List<Contact> allContacts = [SELECT Id, LastName FROM Contact];
        // Marks contact as active if their LastName is 'Test Contact 1' or 'Test Contact 2'      
        for (Contact c : allContacts) {
            if (c.LastName == 'Test Contact 1' || con.LastName == 'Test Contact 2') {
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
                System.assertEquals(2, acc.Active_Contacts__c);
            }
            if (acc.Name == 'Test 2') {
                System.assertEquals(null, acc.Active_Contacts__c);
            }
        }
        System.assertEquals(5, allContacts.size());
    }

    @isTest
    public static void afterUpdateHandlerTest2() {
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
        
        List<Contact> allContacts = [SELECT Id, LastName FROM Contact];
        for (Contact c : allContacts) {
            // Changes account as active and Account ID changes to the second account
            if (c.LastName == 'Test Contact 1') {
                c.Active__c = true;
                c.AccountId = testAccounts[1].Id;
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