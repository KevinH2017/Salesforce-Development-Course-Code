public with sharing class CTPersonTriggerHandler {
    
    /**
     * Before insert, update health status to Green then generate unique token for that person
     * @param newRecords
     */
    public static void beforeInsert(List<Person__c> newRecords){
        for(Person__c person: newRecords){
            person.Health_Status__c = 'Green';
            person.Token__c = CTPersonController.getToken(person.Mobile__c);
        }
    }
    
    /**
     * Before update, update status date if status changed
     * @param newRecords
     * @param oldRecordsMap
     */
    public static void beforeUpdate(List<Person__c> newRecords, Map<Id, Person__c> oldRecordsMap) {
        for (Person__c person : newRecords) {
            // Checks if the status changed in this transaction
            // then update Status_Update_Date__c
            if (person.Health_Status__c != oldRecordsMap.get(person.id).Health_Status__c) {
                person.Status_Update_Date__c = Date.today();
            }
        }
    }

    /**
     * After update, if status is Red and was not Red before update, 
     * update all people who visited this location to Yellow health status
     * @param newRecords
     * @param oldRecordsMap
     */
    public static void afterUpdate(List<Person__c> newRecords, Map<Id, Person__c> oldRecordsMap) {
        Set<Id> statusChange = new Set<Id>();
        Set<Id> redStatus = new Set<Id>();
        // Iterate through the list of people and add the person ids to the set of status change
        for (Person__c person : newRecords) {
            if (person.Health_Status__c != oldRecordsMap.get(person.id).Health_Status__c) {
                statusChange.add(person.Id);
            }
            // If the status is Red and was not Red before update, add the person id to the set of red status
            if (person.Health_Status__c == 'Red' && oldRecordsMap.get(person.id).Health_Status__c != 'Red') {
                redStatus.add(person.Id);
            }
        }

        Set<Id> alreadyProcessed = new Set<Id>();
        alreadyProcessed.addAll(redStatus);

        Set<Id> orangeStatus = new Set<Id>();
        Set<Id> yellowStatus = new Set<Id>();

        List<Person__c> personToUpdate = new List<Person__c>();

        // Adds cohabitants
        orangeStatus.addAll(CTPersonController.getCohabitants(redStatus, alreadyProcessed));
        // Adds primary contancts
        Set<Id> primaryContacts = CTPersonController.getPrimaryContacts(redStatus, alreadyProcessed);
        orangeStatus.addAll(primaryContacts);
        // Adds neighbours
        yellowStatus.addAll(CTPersonController.getNeighbours(redStatus, alreadyProcessed));
        // Adds secondary contancts
        yellowStatus.addAll(CTPersonController.getSecondaryContacts(primaryContacts, alreadyProcessed));

        // Update the health status of the people
        for (Id pid : orangeStatus) {
            personToUpdate.add(new Person__c(Id=pid, Health_Status__c = 'Orange'));
        }

        for (Id pid : yellowStatus) {
            personToUpdate.add(new Person__c(Id=pid, Health_Status__c = 'Yellow'));
        }

        if (personToUpdate.size() > 0) {
            update personToUpdate;
        }

        // Update the red score of the locations
        List<Location_Tracing__c> locationTraces = CTLocationTracingController.getLocationsByPersonIds(statusChange);
        if (locationTraces != null && locationTraces.size() > 0) {
            Set<Id> locationIds = new Set<Id>();
            for (Location_Tracing__c trace : locationTraces) {
                locationIds.add(trace.Location__c);
            }
            CTLocationController.updateRedScore(locationIds);
        }
    }
}
