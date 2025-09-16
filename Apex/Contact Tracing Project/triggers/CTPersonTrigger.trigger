trigger CTPersonTrigger on Person__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    switch on Trigger.operationType {
        when BEFORE_INSERT {
            // Updates health status
            // Generates unique token
            CTPersonTriggerHandler.beforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE {
            // Updates status date if status changed
            CTPersonTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
        when AFTER_UPDATE {
            // Checks if status is Red and was not Red before update
            // Updates all people who visited this location to Yellow health status
            CTPersonTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}