public with sharing class CTLocationTracingDataCleanupBatch implements Database.Batchable<SObject>{
    
    /**
     * Return query for all location traces older than 30 days
     * @param Database.BatchableContext BC
     * @return Database.QueryLocator
     */
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id FROM Location_Tracing__c WHERE Visit_Date__c < LAST_N_DAYS : 30');
    }

    /**
     * Deletes the scope of location traces older than 30 days
     * @param scope
     * @param Database.BatchableContext BC
     */
    public void execute(Database.BatchableContext BC, List<Location_Tracing__c> scope) {
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