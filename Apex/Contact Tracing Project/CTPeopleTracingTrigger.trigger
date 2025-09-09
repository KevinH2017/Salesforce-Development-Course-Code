trigger CTPeopleTracingTrigger on Person_Tracing__c (before insert, after insert) {
    
    switch on Trigger.operationType {

        when BEFORE_INSERT {
            // Check for duplicate records
            // If duplicates found, add error
            CTPersonTracingHandler.beforeInsert(Trigger.new);
        }
    }
}