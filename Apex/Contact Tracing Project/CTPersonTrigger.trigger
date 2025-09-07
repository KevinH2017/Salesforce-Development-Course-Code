trigger CTPersonTrigger on Person (
    before insert, after insert, 
    before update, after update, 
    before delete, after delete, after undelete) {

    switch on Trigger.operationType {
        
        when BEFORE_INSERT {
            // Updates health status to green
            // Generate unique token for each person
            CTPersonTriggerHandler.beforeInsert(Trigger.new);
        }

        when BEFORE_UPDATE {
            // Checks if health status changes
            // Updates Status_Update_Date__c to current datetime
            ContactTiggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }

        when BEFORE_DELETE {

        }

        when AFTER_INSERT {

        }

        when AFTER_UPDATE {
            /* Updates the Red Score and Status of all locations they visited in the last 10 days
            If Health Status updates to Red:
                Mark all people 'Cohabitants' Orange - Except Red and Orange ones
                Mark all primary contacts Orange - Except Red and Orange ones
                Mark all people 'Neighbors' Yellow - Except Red, Orange, and Yellow ones
                Mark all secondary contacts Yellow - Except Red and Orange ones
            Update the Red Score and Status of all the locations they visited in the last 10 days */
            ContactTiggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }

        when AFTER_DELETE {

        }

        when AFTER_UNDELETE {

        }
    }
}