public with sharing class CTLocationTracingTriggerHandler {

    public static void beforeInsert(List<Location_Tracing__c> newRecords) {
        List<Location_Tracing__c> dupes = CTLocationTracingController.checkDuplicate(newRecords);
        // Check for duplicate records
        // If duplicates found, add error
        for (Location_Tracing__c trace : dupes) {
            trace.addError('Error: Duplicate record found! Location Id: ' 
            + trace.Location__c + ' Person Id: ' + trace.Person__c);
        }
    }
}