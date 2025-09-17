/*
Batch Apex:

Batch Apex is used to build complex, long-running processes that run on thousands of records on the lightning platform

- It operates over small batches / chunks of records
- Can be scheduled
- Implement Database.Batchable interface

*/
public class BatchApex implements Database.Batchable<SObject> {

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
    public void execute(Database.BatchableContext BC, List<Account> scope) {
        // Perform operations on the records
        for (Account acc : scope) {
            acc.Name = 'Batch Apex';
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

