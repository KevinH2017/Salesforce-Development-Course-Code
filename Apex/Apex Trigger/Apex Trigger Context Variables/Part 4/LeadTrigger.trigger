/* Trigger Context Variables - Part 4

isExecuting - Return true if current context for the Apex code is a trigger

size - The total number of records in a trigger invocation, both old and new

operationType - Returns an enum corresponding to the current operation.
                Possible values are: 
                [BEFORE_INSERT, AFTER_INSERT, BEFORE_UPDATE, AFTER_UPDATE, BEFORE_DELETE, AFTER_DELETE, AFTER_UNDELETE]
*/

trigger LeadTrigger on Lead (before insert, before update, after update) {
    for (Lead leadRecord : Trigger.new) {
        System.debug('Trigger size: ' + Trigger.size);
        System.debug('Is trigger executing: ' + Trigger.isExecuting);
        System.debug('Trigger operation type: ' + Trigger.operationType);

        // Will change Lead Source BEFORE the record is saved and if the Lead Source is blank
        if (Trigger.isBefore && String.isBlank(leadRecord.LeadSource)) {
            leadRecord.LeadSource = 'Other';
        }

        // Check if the Lead Status is changed to 'Closed - Converted' or 'Closed - Not Converted'
        // from 'Closed - Converted' during update operation, 
        // and using oldMap, check if the old value is 'Open - Not Contacted'
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
    }
}