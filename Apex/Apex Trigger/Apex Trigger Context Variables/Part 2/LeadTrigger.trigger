/* Trigger Context Variables - Part 2

isBefore - Return true if this trigger was fired BEFORE the record is saved
isAfter - Return true if this trigger was fired AFTER the record is saved
*/

trigger LeadTrigger on Lead (before insert, before update, after update) {
    for (Lead leadRecord : Trigger.new) {
        // Will change Lead Source only if the Lead Source is blank
        // if (String.isBlank(leadRecord.LeadSource)) {

        // Will change Lead Source BEFORE the record is saved
        if (Trigger.isBefore) {
            leadRecord.LeadSource = 'Other';
        }

        // Error is thrown when Industry is blank during insert
        if (String.isBlank(leadRecord.Industry) && Trigger.isInsert) {
            leadRecord.addError('Industry field cannot be blank');
        }
        if (Trigger.isAfter) {
            System.debug('This is after update operation');
        }
        System.debug('Lead trigger executed');
    }
}
