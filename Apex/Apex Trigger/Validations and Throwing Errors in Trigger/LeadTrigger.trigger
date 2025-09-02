/** Validations and Throwing Errors in Trigger
 * Triggers can be used to prevent DML operations from occurring by calling the addError() method on a record or field
 */

trigger LeadTrigger on Lead (before insert, before update) {
    for (Lead leadRecord : Trigger.new) {
        // Will change Lead Source only if the Lead Source is blank
        if (String.isBlank(leadRecord.LeadSource)) {
            leadRecord.LeadSource = 'Other';
        }

        // Throws error message if Industry field is blank
        if (String.isBlank(leadRecord.Industry)) {
            leadRecord.addError('Industry field cannot be blank');
        }
    }
}