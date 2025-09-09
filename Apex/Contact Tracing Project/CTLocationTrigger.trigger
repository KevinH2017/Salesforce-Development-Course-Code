trigger CTLocationTrigger on Location__c (before insert, after insert, before update, after update) {
    switch on Trigger.operationType {
        
        when BEFORE_INSERT {
            // Make sure the location status is 'Green' before inserting the record
            CTLocationTriggerHandler.beforeInsert(Trigger.new);
        }

        when AFTER_INSERT {

        }

        when BEFORE_UPDATE {
            // If location status changes, update Status Update Date to current datetime
            CTLocationTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }

        when AFTER_UPDATE {
            // If location health status is changed to 'Red', 
            // mark all people who visited the location in the last 10 days 'Yellow'
            // Except the 'Red' and 'Orange' ones
            CTLocationTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}