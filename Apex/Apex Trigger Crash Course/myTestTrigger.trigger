// Code to do run on SObject, with what events to run the trigger code (before and after)
trigger myTestTrigger on Lead (before insert, after insert, before update, after update) {

    // Trigger context variable for each event
    switch on Trigger.operationType {
        when BEFORE_INSERT, BEFORE_UPDATE {
            // Executes BEFORE the operation
            System.debug('Lead trigger invoked before operation');
            // Trigger.new returns a list
            // Trigger.new[0] returns the first record in the list
            List<Lead> leads = Trigger.new;
            Lead leadRecord = leads[0];
            leadRecord.Company += ' Inc';

            // Throws error if there is no LeadSource
            if (leadRecord.LeadSource == null) {
                leadRecord.addError('Lead Source is required');
            }
        }

        when AFTER_INSERT, AFTER_UPDATE {
            // Executes AFTER the operation
            System.debug('Lead trigger invoked after operation');
            List<lead> leads = Trigger.new;
            Lead leadRecord = leads[0];
            // If record is Hot, create new Task
            if (leadRecord.Rating == 'Hot') {
                Task followup = new Task();
                followup.whoId = leadRecord.Id;
                followup.Subject = 'Follow up on new hot Lead';
                followup.Priority = 'High';
                insert followup;
            }
        }
    }
}