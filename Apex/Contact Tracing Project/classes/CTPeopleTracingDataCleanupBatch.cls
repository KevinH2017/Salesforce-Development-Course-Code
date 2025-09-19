public with sharing class CTPeopleTracingDataCleanupBatch implements Database.Batchable<SObject>{
    
    /**
     * Return query for all people traces older than 30 days
     * @param Database.BatchableContext BC
     * @return Database.QueryLocator
     */
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id FROM People_Tracing__c WHERE Contact_Date__c < LAST_N_DAYS : 30');
    }

    /**
     * Deletes the scope of people traces older than 30 days
     * @param scope
     * @param Database.BatchableContext BC
     */
    public void execute(Database.BatchableContext BC, List<People_Tracing__c> scope) {
        delete scope;
    }

    /**
     * End of batch job
     * @param Database.BatchableContext BC
     */
    public void finish(Database.BatchableContext BC) {
        System.debug('Batch job completed');
    }
}