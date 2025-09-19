public with sharing class CTLocationStatusUpdateBatch implements Database.Batchable<SObject> {
    
    /**
     * Return query for location's status update date if it was less than 14 days,
     * and the health status is Red, Orange, or Yellow
     * @param Database.BatchableContext BC
     * @return Database.QueryLocator
     */
    public Database.QueryLocator start(Database.BatchableContext BC) {
        // List of statuses that are Red, Orange, or Yellow
        List<String> healthStatuses = new List<String>{'Red', 'Orange', 'Yellow'};
        // Today's date and 14 days ago
        Date today = Date.today();
        Date fourteenDaysAgo = today.addDays(-14);
        return Database.getQueryLocator('SELECT Id, Status__c FROM Location__c WHERE Status_Update_date__c = :fourteenDaysAgo AND Status__c IN :healthStatuses');
    }

    /**
     * Updates the location's status to 'Green'
     * @param scope
     * @param Database.BatchableContext BC
     */
    public void execute(Database.BatchableContext BC, List<Location__c> scope) {
        for (Location__c location : scope) {
            location.Status__c = 'Green';
        }
        update scope;
    }

    /**
     * End of batch job
     * @param Database.BatchableContext BC
     */
    public void finish(Database.BatchableContext BC) {
        System.debug('Batch job completed');
    }
}