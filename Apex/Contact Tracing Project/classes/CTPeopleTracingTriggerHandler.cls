public with sharing class CTPeopleTracingTriggerHandler {
    
    /**
     * Check for duplicate records before inserting new records, if duplicate record found, add error to record
     * @param newRecords
     */
    public static void beforeInsert(List<People_Tracing__c> newRecords) {
        List<People_Tracing__c> duplicates = CTPeopleTracingController.checkDuplicates(newRecords);

        // Loop over duplicate records and add error to record if duplicate is found
        for(People_Tracing__c trace : duplicates){
            trace.addError('Duplicate record found. Person 1: ' + trace.Person_1__c + ' Person 2: ' + trace.Person_2__c);
        }
    }
}
