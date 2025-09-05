// Recursive Trigger Challenge
trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {
    
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            // Apex class method call to handle BEFORE_INSERT logic
            LeadTriggerHandler.beforeInsertHandler(Trigger.new);
        }

        when AFTER_INSERT {
            // Apex class method call to handle AFTER_INSERT logic
            LeadTriggerHandler.afterInsertHandler(Trigger.new);
        }

        when BEFORE_UPDATE {
            // Apex class method call to handle BEFORE_UPDATE logic
            LeadTriggerHandler.beforeUpdateHandler(Trigger.new, Trigger.oldMap);
        }
    }
}
