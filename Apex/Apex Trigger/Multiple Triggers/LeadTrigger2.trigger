// Multiple Triggers 
// You can have multiple triggers on an SObject
// The order of execution is not guaranteed
// All these triggers share the same set of governor limits

trigger LeadTrigger2 on Lead (before insert, before update) {
    for (Lead leadRecord : Trigger.new) {
        // Will change Rating only if the Rating is blank
        if (String.isBlank(leadRecord.Rating)) {
            leadRecord.Rating = 'Warm';
        }
    }
    System.debug('Lead trigger 2 executed');
}