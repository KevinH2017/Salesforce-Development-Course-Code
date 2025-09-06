public with sharing class AccountContactService {
    // Method to update Active Contact count on Account
    public static void updateActiveContactCount(Set<Id> uniqueAccountIds) {
        // SOQL to get AccountId and their count of Ids
        List<AggregateResult> results = [
                SELECT AccountId, COUNT(Id) totalId
                FROM Contact
                WHERE Active__c = true
                    AND AccountId IN :uniqueAccountIds
                GROUP BY AccountId
            ];

        // List to hold Account records to update and avoid DML limits
        List<Account> accountsToUpdate = new List<Account>();

        for (AggregateResult ar : results) {
            // Get AccountId and number of active contacts
            String accountId = (String)ar.get('AccountId');
            Integer count = (Integer)ar.get('totalId');

            // Create Account record with updated count and adds it to the list
            accountsToUpdate.add(new Account(Id=accountId, Active_Contacts__c=count));
        }
        // Update the accounts in a single DML statement
        update accountsToUpdate;
    }
}