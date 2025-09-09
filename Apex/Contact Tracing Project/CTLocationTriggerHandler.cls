public with sharing class CTLocationTriggerHandler {

    public static void beforeInsert(List<Location__c> newRecords) {
        // Checks if location status is 'Green' before inserting the record
        for (Location__c l : newRecords) {
            l.Status__c == 'Green';
        }
    }

    public static void afterInsert(List<Location__c> newRecords) {
        for (Location__c l : newRecords) {

        }
    }

    public static void beforeUpdate(List<Location__c> newRecords, Map<Id, Person> oldRecords) {
       for (Location__c l : newRecords) {
            // If location health status is changed, update Status_Update_Date__c to current datetime
            if (l.Status__c != oldRecords.get(l.Id).Status__c) {
                l.Status_Update_Date__c = Date.today();
            }
        }
    }

    public static void afterUpdate(List<Location__c> newRecords, Map<Id, Person> oldRecords) {
        Set<Id> statusChange = new Set<Id>();
        for (Location__c l : newRecords) {
            // If location health status is changed to 'Red', update Status_Update_Date__c to current datetime
            if (l.Health_Status__c != oldRecords.get(l.Id).Health_Status__c != 'Red') {
                statusChange.add(l.Id);
            }

            // Gets the location IDs of the locations that have been updated from the last 10 days and stores the person Ids
            Set<Id> personIds = new Set<Id>();
            List<Location_Tracing__c> locationTraces = CTLocationTracingController.getLocationsByLocationIds(statusChange);
            for (Location_Tracing__c trace : locationTraces) {
                personIds.add(trace.Person__c);
            }

            // Updates the health status of the people who visited the location
            // that has been updated from the last 10 days to 'Yellow'
            List<Person__c> peopleToUpdate = new List<Person__c>();
            for (Id pid : personIds) {
                peopleToUpdate.add(new Person__c(Id=pid, Health_Status__c='Yellow'));
            }

            // Only update if there are people to update
            if (peopleToUpdate.size() > 0) {
                update peopleToUpdate;
            }
        }
    }
}