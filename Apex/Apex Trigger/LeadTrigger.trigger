// Apex Trigger
// File extension is .trigger

// Runs BEFORE the record is inserted and updated
trigger LeadTrigger on Lead (before insert, before update) {
    System.debug('Lead trigger called');
}
