/* Trigger Context Variables - Part 1
Apex triggers defines implicit variables from System.Trigger class

isInsert - Return true if this trigger was fired to an INSERT operation
isUpdate - Return true if this trigger was fired to an UPDATE operation
isDelete - Return true if this trigger was fired to a DELETE operation
isUndelete - Return true if this trigger was fired to an UNDELETE operation
*/

trigger LeadTrigger on Lead (before insert, before update) {
    for (Lead leadRecord : Trigger.new) {
        // Will change Lead Source only if the Lead Source is blank
        if (String.isBlank(leadRecord.LeadSource)) {
            leadRecord.LeadSource = 'Other';
        }
        // Error is thrown when Industry is blank during insert
        if (String.isBlank(leadRecord.Industry) && Trigger.isInsert) {
            leadRecord.addError('Industry field cannot be blank');
        }
    }
    System.debug('Lead trigger 1 executed');
}
