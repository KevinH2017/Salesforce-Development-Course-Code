public class LeadBatch implements Database.Batchable<SObject> {
    // Start method executes only once
    // Returns batch scope or records
    // Can return up to 50 million records    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        // Queries the data with SOQL
        String query = 'SELECT Id, Name FROM Account';        
        return Database.getQueryLocator(query);
    }

    // Execute method executes for each batch / chunk of records
    // Must have void return type
    // Each execution will get a new set of governor limits
    // Scope value must be greater than 0 and can be max 2000, default value is 200
    // Not guaranteed to be executed in order
    public void execute(Database.BatchableContext BC, List<Lead> scope) {
        // Perform operations on the records
        for (Lead leadRecord : scope) {
            leadRecord.LeadSource = 'Web';
        }
        update scope;
    }

    // Finish method executes only once
    // Called after ALL batches are processed
    // Can be used for post processing
    public void finish(Database.BatchableContext BC) {
        // Perform operations after the batch is complete
        System.debug('Batch Apex is complete');
        // Such as sending an email or calling another batch class
    }
}