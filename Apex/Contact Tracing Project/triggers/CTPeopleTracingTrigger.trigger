trigger CTPeopleTracingTrigger on People_Tracing__c (before insert) {

    switch on Trigger.operationType {
        when BEFORE_INSERT {
            // Check for duplicate records before inserting new records
            // If duplicate record found, add error to record
            CTPeopleTracingTriggerHandler.beforeInsert(Trigger.new);
        }
    }
}