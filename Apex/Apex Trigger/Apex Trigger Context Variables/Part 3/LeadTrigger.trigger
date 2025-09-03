/* Apex Trigger Context Variables - Part 3

new - List of new versions of records. Available in [before insert, after insert, before update, after update, after undelete] triggers
        Trigger.new is same as List<SObject>

newMap - Map of Id and new versions of records. Available in [after insert, before update, after update, after undelete] triggers
        Trigger.newMap is same as Map<Id, SObject>

old - List of old versions of records. Available in [before update, after update, before delete, after delete] triggers
        Trigger.old is same as List<SObject>

oldMap - Map of Id and old versions of records. Available in [before update, after update, before delete, after delete] triggers
        Trigger.oldMap is same as Map<Id, SObject>
*/

trigger LeadTrigger on Lead (before insert, before update, after update) {
    for (Lead leadRecord : Trigger.new) {
        // Will change Lead Source BEFORE the record is saved and if the Lead Source is blank
        if (Trigger.isBefore && String.isBlank(leadRecord.LeadSource)) {
            leadRecord.LeadSource = 'Other';
        }
        // Check if the Lead Status is changed to 'Closed - Converted' or 'Closed - Not Converted'
        // from 'Closed - Converted' during update operation, and using oldMap, check if the old value is 'Open - Not Contacted'
        if ((leadRecord.Status == 'Closed - Converted' 
            || leadRecord.Status == 'Closed - Not Converted') 
            && Trigger.oldMap.get(leadRecord.Id).Status == 'Open - Not Contacted') {
                // Will display the error in the status field
                leadRecord.Status.addError('You cannot directly close an open lead record');
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
