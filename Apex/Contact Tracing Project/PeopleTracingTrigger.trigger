trigger CTPeopleTracingTrigger on Person (before insert, after insert) {
    
    switch on Trigger.operationType {

        when BEFORE_INSERT {
            // Check for duplicate records
            // If duplicates found, add error
            // If no duplicates found, add record
            CTPersonTracingHandler.beforeInsert(Trigger.new);
        }

        when AFTER_INSERT {
            // Check for duplicate records
            // If duplicates found, add error
            // If no duplicates found, add record
            CTPersonTracingHandler.afterInsert(Trigger.new);
        }
    }
}