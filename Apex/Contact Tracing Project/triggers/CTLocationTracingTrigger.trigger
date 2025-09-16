trigger CTLocationTracingTrigger on Location_Tracing__c (before insert) {

    switch on Trigger.operationType {
        when BEFORE_INSERT {
            // Check for duplicate records before inserting new records
            // If duplicate record found, add error to record
            CTLocationTracingTriggerHandler.beforeInsert(Trigger.new);
        }
    }
}