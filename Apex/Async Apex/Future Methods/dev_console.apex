Map<Id, Lead> leadRecords = new Map<Id, Lead> ([SELECT Id FROM Lead]);

// Calls async future method to update records
LeadAsynchronous.updateLeadRecords(leadRecords.keySet());

// Calls async future method to create and insert record
LeadAsynchronous.createLeadRecords();
