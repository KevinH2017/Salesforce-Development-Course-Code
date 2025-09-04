// Improving trigger code using context variables

trigger LeadTrigger on Lead (before insert, before update, after update) {
    
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
