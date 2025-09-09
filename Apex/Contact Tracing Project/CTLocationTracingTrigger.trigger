trigger CTLocationTracingTrigger on Location_Tracing__c (before insert, after insert) {
    
    switch on Trigger.operationType {

        when BEFORE_INSERT {
            // Check for duplicate records
            // If duplicates found, add error
            CTLocationTracingHandler.beforeInsert(Trigger.new);
        }
    }
}