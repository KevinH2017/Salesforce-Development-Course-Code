// Multiple Triggers 
// You can have multiple triggers on an SObject
// The order of execution is not guaranteed
// All these triggers share the same set of governor limits

trigger LeadTrigger on Lead (before insert, before update) {
    for (Lead leadRecord : Trigger.new) {
        // Will change Lead Source only if the Lead Source is blank
        if (String.isBlank(leadRecord.LeadSource)) {
            leadRecord.LeadSource = 'Other';
        }
        if (String.isBlank(leadRecord.Industry)) {
            leadRecord.addError('Industry field cannot be blank');
        }
    }
    System.debug('Lead trigger 1 executed');
}

