public class LeadTriggerHandler {

    public static boolean alreadyExecuted = false;

    public static void beforeInsertHandler(List<Lead> newRecords) {
        for (Lead leadRecord : newRecords) {
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

    public static void afterInsertHandler(List<Lead> newRecords) {
        // List to hold tasks, helps in bulkification
        List<Task> taskList = new List<Task>();
        for(Lead leadRecord : newRecords){
            // Create a task and adds it to list
            Task leadTask = new Task(Subject='Follow up on Lead Status', WhoId=leadRecord.Id);
            taskList.add(leadTask);
        }
        // Insert the list of tasks at once, helps avoid governor limits, EX: 'Too many DML statements: 151'
        insert taskList;
        
        // Checks if the trigger has already executed to avoid recursion
        if (LeadTriggerHandler.alreadyExecuted == false) {
            LeadTriggerHandler.alreadyExecuted = true;
            Lead anotherLead = new Lead(LastName='Test Lead Single', Status='Open - Not Contacted', Company='Test Company', Industry='Other');
            insert anotherLead;
        }
    }

    public static void beforeUpdateHandler(List<Lead> newRecords, Map<Id, Lead> oldRecordsMap) {
        for (Lead leadRecord : newRecords) {
            // Will change Lead Source BEFORE the record is saved and if the Lead Source is blank
            if (String.isBlank(leadRecord.LeadSource)) {
                leadRecord.LeadSource = 'Other';
            }
            // Check if the Lead Status is changed to 'Closed - Converted' or 'Closed - Not Converted'
            // from 'Closed - Converted' during update operation, 
            // and using oldMap, check if the old value is 'Open - Not Contacted'
            if ((leadRecord.Status == 'Closed - Converted' 
                || leadRecord.Status == 'Closed - Not Converted') 
                && oldRecordsMap.get(leadRecord.Id).Status == 'Open - Not Contacted') {
                    // Will display the error in the status field
                leadRecord.Status.addError('You cannot directly close an open lead record');
            }
        }
    }
}