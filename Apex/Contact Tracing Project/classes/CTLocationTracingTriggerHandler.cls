public with sharing class CTLocationTracingTriggerHandler {
    
    /**
     * Check for duplicate records before inserting new records
     * @param newRecords
     */
    public static void beforeInsert(List<Location_Tracing__c> newRecords) {
        List<Location_Tracing__c> duplicates = CTLocationTracingController.checkDuplicates(newRecords);

        for (Location_Tracing__c trace : duplicates) {
            trace.addError('Duplicate record found. Location Id:' + trace.Location__c + ' Person Id:' + trace.Person__c);
        }
    }
}
