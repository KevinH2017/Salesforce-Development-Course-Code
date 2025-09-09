public with sharing class CTPersonTracingTriggerHandler {

    public static void beforeInsert(List<Person_Tracing__c> newRecords) {
        List<Person_Tracing__c> dupes = CTPeopleTracingController.checkDuplicate(newRecords);
        // Check for duplicate records
        // If duplicates found, add error
        for (Person_Tracing__c trace : dupes) {
            trace.addError('Error: Duplicate record found! Person 1: ' 
            + trace.Person_1__c + ' Person 2: ' + trace.Person_2__c);
        }
    }
}