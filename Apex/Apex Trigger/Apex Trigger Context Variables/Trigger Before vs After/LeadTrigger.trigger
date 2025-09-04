/** Before vs After Triggers
 * 
 * Before:
 * - Before triggers are used to update or validate records before they're saved to the database
 * - Avoid making changes to other records before triggers
 * 
 * After:
 * - Records that fire the after trigger are read only
 * - Make changes (create/update/delete) to other records in after triggers
 * 
 * Trigger on SObject -> Do you need to make changes in other records?
 *                          - Yes -> After Trigger
 *                          - No -> Before Trigger
 */

trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {
    
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            for (Lead leadRecord : Trigger.new) {
                // Will change Lead Source BEFORE the record is saved and if the Lead Source is blank
                if (String.isBlank(leadRecord.LeadSource)) {
                    leadRecord.LeadSource = 'Other';
                }
                // Error is thrown when Industry is blank during insert
                if (String.isBlank(leadRecord.Industry)) {
                    leadRecord.addError('Industry field cannot be blank');
                }
            }
        }

        when AFTER_INSERT {
            for(Lead leadRecord : Trigger.new){
                // Create a task
                Task leadTask = new Task(Subject='Follow up on Lead Status', WhoId=leadRecord.Id);
                insert leadTask;
            }
        }

        when BEFORE_UPDATE {
            for (Lead leadRecord : Trigger.new) {
                // Will change Lead Source BEFORE the record is saved and if the Lead Source is blank
                if (String.isBlank(leadRecord.LeadSource)) {
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
            }
        }
    }
}
