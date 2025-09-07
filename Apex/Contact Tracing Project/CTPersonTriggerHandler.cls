/**
 * CTPersonTriggerHandler
 * Main trigger handler class for CT project
 * @description This trigger handler is used to update the health status of a person
 * @author Kevin
 */
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

    public static void afterUpdate(List<Person> newRecords, Map<Id, Person> oldRecords) {
        Set<Id> statusChange = new Set<Id>();
        Set<Id> redStatus = new Set<Id>();
        for (Person p : newRecords) {
            // If health status is changed, update Status_Update_Date__c to current datetime
            if (p.Health_Status__c != oldRecords.get(p.Id).Health_Status__c) {
                statusChange.add(p.Id);
            }
            // Checks if health status is changed to 'Red'
            if (p.Health_Status__c == 'Red' && oldRecords.get(p.Id).Health_Status__c) {
                redStatus.add(p.Id);
            }
        }
        // Keeps track of already processed records, to avoid duplicates
        Set<Id> alreadyProcessed = new Set<Id>();
        alreadyProcessed.addAll(redStatus);

        Set<Id> orangeStatus = new Set<Id>();
        Set<Id> yellowStatus = new Set<Id>();

        // List of people to update Health_Status__c
        List<Person> personToUpdate = new List<Person>();

        // Add cohabitants
        orangeStatus.addAll(CTPersonController.getCohabitants(redStatus, alreadyProcessed));
        // Add primary contacts
        Set<Id> primaryContacts = CTPersonController.getPrimaryContacts(redStatus, alreadyProcessed);
        orangeStatus.addAll(primaryContacts);
        // Add neighbors
        yellowStatus.addAll(CTPersonController.getNeighbors(redStatus, alreadyProcessed));
        // Add secondary contacts
        yellowStatus.addAll(CTPersonController.getSecondaryContacts(primaryContacts, alreadyProcessed));

        // Adds people to update list 
        for (Id pid : orangeStatus) {
            personToUpdate.add(new Person(Id=pid, Health_Status__c='Orange'));
        }
        for (Id pid : yellowStatus) {
            personToUpdate.add(new Person(Id=pid, Health_Status__c='Yellow'));
        }

        // Updates health status of people if there are any
        if (personToUpdate.size() > 0){
            update personToUpdate;
        }

        // Gets locations visited by people with red status
        List<Location_Tracing__c> locationTraces = CTLocationTracingController.getLocationsByPersonIds(statusChange);
        if (locationTraces != null && locationTraces.size() > 0) {
            Set<Id> locationIds = new Set<Id>();
            for (Location_Tracing__c location : locationTraces) {
                locationIds.add(location.Id);
            }
            CTLocationController.updateRedScore(locationIds);
        }
    }
}