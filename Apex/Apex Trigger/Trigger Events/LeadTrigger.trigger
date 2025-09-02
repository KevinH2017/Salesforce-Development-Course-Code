/**Trigger events can be defined:
 * before insert
 * after insert
 * before update
 * after update
 * before delete
 * after delete
 * after undelete
 */

 // When a Lead is inserted or updated, changes Lead Source to 'Other'
trigger LeadTrigger on Lead (before insert, before update) {
    for (Lead leadRecord : Trigger.new) {
        // Will change Lead Source only if the Lead Source is blank
        if (String.isBlank(leadRecord.LeadSource)) {
            leadRecord.LeadSource = 'Other';
        }
    }
}