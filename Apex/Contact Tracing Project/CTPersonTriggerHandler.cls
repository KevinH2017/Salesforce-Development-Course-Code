public with sharing class CTPersonTriggerHandler {

    public static void beforeInsert(List<Person> newRecords) {
        for (Person p : newRecords) {
            // Sets default health status to 'Green' if not provided
            if (p.Health_Status__c == null) {
                p.Health_Status__c = 'Green';
            }
            // Generates unique token based on mobile number
            p.Unique_Token__c = CTPersonController.getToken(p.Mobile__c);
        }
    }

    public static void beforeUpdate(List<Person> newRecords, Map<Id, Person> oldRecords) {
        for (Person p : newRecords) {
            // If health status is changed, update Status_Update_Date__c to current datetime
            if (p.Health_Status__c != oldRecords.get(p.Id).Health_Status__c) {
                p.Status_Update_Date__c = Date.today();
            }
        }
    }

    public static void afterUpdate(List<Location> newRecords) {
        // Gets all locations visited by the person in the last 10 days
        List<Location> locations = [
            SELECT Location__c 
            FROM Location_Trace__c 
            WHERE Visitor__c IN :newRecords
                AND Visit_Date__c = LAST_N_DAYS:10];

        // Holds unique locations person visited
        Set<Id> uniqueLocations = new Set<Id>();
        for (Location location : locations) {
            uniqueLocations.add(p.location);
        }

        for (Location location : uniqueLocations) {
            location.Red_Score__c += 1;
        }

        for (Person p : newRecords) {
            // If person's health status updates to Red, 
            // update Cohabitants, Primary Contacts, Neighbors, and Secondary Contacts to appropriate statuses
            if (p.Health_Status__c.contains('Red')) {
                if (!p.Cohabitants.contains('Red') || !p.Cohabitants.contains('Orange')) {
                    p.Cohabitants = 'Orange';
                } else if (!p.Primary_Contacts.contains('Red') || !p.Primary_Contacts.contains('Orange')) {
                    p.Primary_Contacts = 'Orange';
                } else if (!p.Neighbors.contains('Red') || !p.Neighbors.contains('Yellow') || !p.Neighbors.contains('Yellow')) {
                    p.Neighbors = 'Yellow';
                } else if (!p.Secondary_Contacts.contains('Red') || !p.Secondary_Contacts.contains('Orange')) {
                    p.Secondary_Contacts = 'Yellow';
                }

            }
        }
    }
}