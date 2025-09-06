public class ContactTriggerHandler {
    
    public static void afterInsertHandler(List<Contact> newContact) {
        // Set to hold unique Account Ids
        Set<Id> uniqueAccountIds = new Set<Id>();

        // Creates new Contact records and adds to list
        for (Contact con : newContact) {
            // Check if AccountId is not blank
            if (String.isNotBlank(con.AccountId)) {
                uniqueAccountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveContactCount(uniqueAccountIds);
    }
    public static void afterUpdateHandler(List<Contact> newContacts, Map<Id, Contact> oldContactsMap) {
        // Set to hold unique Account Ids
        Set<Id> uniqueAccountIds = new Set<Id>();

        // Creates new Contact records and adds to list
        for (Contact con : newContacts) {
            // Check if AccountId is not blank and if checkbox value has changed
            if (String.isNotBlank(con.AccountId) 
                && con.Active__c != oldContactsMap.get(con.Id).Active__c) {
                uniqueAccountIds.add(con.AccountId);
            } else if (oldContactsMap.get(con.Id).AccountId != con.AccountId) {
                // Checks if AccountId has changed, then add both old and new AccountIds to the set
                uniqueAccountIds.add(oldContactsMap.get(con.Id).AccountId);
                uniqueAccountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveContactCount(uniqueAccountIds);
    }

    public static void afterDeleteHandler(List<Contact> oldContacts) {
        // Set to hold unique Account Ids
        Set<Id> uniqueAccountIds = new Set<Id>();

        // Creates new Contact records and adds to list
        for (Contact con : oldContacts) {
            // Check if AccountId is not blank
            if (String.isNotBlank(con.AccountId)) {
                uniqueAccountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveContactCount(uniqueAccountIds);
    }

    public static void afterUndeleteHandler(List<Contact> newContacts) {
        // Set to hold unique Account Ids
        Set<Id> uniqueAccountIds = new Set<Id>();

        // Creates new Contact records and adds to list
        for (Contact con : newContacts) {
            // Check if AccountId is not blank
            if (String.isNotBlank(con.AccountId)) {
                uniqueAccountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveContactCount(uniqueAccountIds);
    }
}