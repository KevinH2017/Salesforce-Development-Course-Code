// Triggers can set field values before they are saved / inserted to the database

// When a Lead is created or updated, changes Lead Source to 'Other'
// This will also overwrite the setting during creation
trigger LeadTrigger on Lead (before insert, before update) {
    for (Lead leadRecord : Trigger.new) {
        // Will change Lead Source only if the Lead Source is blank
        if (String.isBlank(leadRecord.LeadSource)) {
            leadRecord.LeadSource = 'Other';
        }
    }
}