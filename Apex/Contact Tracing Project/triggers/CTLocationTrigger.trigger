trigger CTLocationTrigger on Location__c (before insert, after insert, before update, after update) {

    switch on Trigger.operationType {
        when BEFORE_INSERT {
            // Before insert, set health status to Green
            CTLocationTriggerHandler.beforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE {
            // Before update, update status date if status changed
            CTLocationTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
        when AFTER_UPDATE {
            // After update, update red score for locations
            CTLocationTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}