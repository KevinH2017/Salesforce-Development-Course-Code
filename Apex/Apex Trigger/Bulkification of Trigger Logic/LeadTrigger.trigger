/** Bulkifying Trigger Logic
 * 
 * All triggers are bulkified by default and up to 200 records can enter the trigger at once
 * EX: 10000 records will be processed in 50 batches or 50 trigger executions of 200 records
 * 
 * All triggers on an SObject shares the same set of governor limits
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
            // List to hold tasks, helps in bulkification
            List<Task> taskList = new List<Task>();
            for(Lead leadRecord : Trigger.new){
                // Create a task and adds it to list
                Task leadTask = new Task(Subject='Follow up on Lead Status', WhoId=leadRecord.Id);
                taskList.add(leadTask);
            }
            // Insert the list of tasks at once, helps avoid governor limits, EX: 'Too many DML statements: 151'
            insert taskList;
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
