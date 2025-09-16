public with sharing class CTLocationTriggerHandler {
    
    /**
     * Before inserting location record, set status to Green
     * @param newRecords
     */
    public static void beforeInsert(List<Location__c> newRecords) {
        for (Location__c location : newRecords) {
            location.Status__c = 'Green';
        }
    }

    /**
     * Before updating location record, update status date if status changed
     * @param newRecords
     * @param oldRecordMap
     */
    public static void beforeUpdate(List<Location__c> newRecords, Map<Id, Location__c> oldRecordMap) {
        for (Location__c location : newRecords) {
            if (location.Status__c != oldRecordMap.get(location.Id).Status__c) {
                location.Status_Update_Date__c = Date.today();
            }
        }
    }

    /**
     * After updating location record, if status is Red and was not Red before update, 
     * update all people who visited this location to Yellow health status
     * @param newRecords
     * @param oldRecordMap
     */
    public static void afterUpdate(List<Location__c> newRecords, Map<Id, Location__c> oldRecordMap) {
        Set<Id> statusChange = new Set<Id>();
        for (Location__c location : newRecords){
            if (location.Status__c == 'Red' && oldRecordMap.get(location.Id).Status__c != 'Red') {
                statusChange.add(location.Id);
            }
        }

        List<Location_Tracing__c> locationTraces = CTLocationTracingController.getLocationsByLocationIds(statusChange);
        Set<Id> personIds = new Set<Id>();
        for (Location_Tracing__c trace : locationTraces) {
            personIds.add(trace.Person__c);
        }

        List<Person__c> peopleToUpdate = new List<Person__c>();
        for (Id pid : personIds) {
            peopleToUpdate.add(new Person__c(Id=pid, Health_Status__c='Yellow'));
        }

        if (peopleToUpdate.size() > 0) {
            update peopleToUpdate;
        }
    }
}
