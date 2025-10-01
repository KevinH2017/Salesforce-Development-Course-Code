public with sharing class AccountTriggerHandler {

    public static boolean afterUpdateAlreadyxecuted = false;

    // List to hold accounts to be updated
    List<Account> accountsToUpdate = new List<Account>();

    public static void afterUpdateHandler(List<Account> accs) {
        for (Account acc : accs) {
            Account newAcc = new Account(Id = acc.Id);
            // Changes datetime to current datetime
            newAcc.Last_After_Update_Execution_Time__c = Datetime.now();
            // Adds account to list
            accountsToUpdate.add(newAcc);
        }
        // Updates accounts in list
        if (accountsToUpdate.size() > 0) {
            update accountsToUpdate;
        }
    }
}