// Test data is used to test your apex classes and triggers
// This data is transient and isn't committed to the database
// Requires @isTest to be the first line of the class and above functions
// Must be in the same folder of the class being tested
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
}