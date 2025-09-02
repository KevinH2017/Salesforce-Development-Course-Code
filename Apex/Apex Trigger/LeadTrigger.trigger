// Apex Trigger
// File extension is .trigger

// Database trigger is a special set of operations that run when specific actions occur within a databse
// Triggers are defined to run when changes are made to a table's data

// Apex trigger is apex code that is run when specific actions occur within a Salesforce object
// Apex triggers are defined to run when changes are made to an object's records

// Runs BEFORE the record is inserted and updated
trigger LeadTrigger on Lead (before insert, before update) {
    System.debug('Lead trigger called');
}

/* Apex supports triggers before and after the following events:
    Before:
   - Insert
   - Update
   - Delete
   
   After:
   - Merge
   - Upsert
   - Undelete
*/