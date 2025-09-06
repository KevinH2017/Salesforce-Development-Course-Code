trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {

    switch on Trigger.operationType {
        when AFTER_INSERT {
            // Apex class method call to handle AFTER_INSERT logic
            ContactTriggerHandler.afterInsertHandler(Trigger.new);
        }

        when AFTER_UPDATE {
            // Apex class method call to handle AFTER_UPDATE logic
            ContactTriggerHandler.afterUpdateHandler(Trigger.new, Trigger.oldMap);
        }

        when AFTER_DELETE {
            // Apex class method call to handle AFTER_DELETE logic
            ContactTriggerHandler.afterDeleteHandler(Trigger.old);
        }
        
        when AFTER_UNDELETE {
            // Apex class method call to handle AFTER_UNDELETE logic
            ContactTriggerHandler.afterUndeleteHandler(Trigger.new);
        }
    }
}
