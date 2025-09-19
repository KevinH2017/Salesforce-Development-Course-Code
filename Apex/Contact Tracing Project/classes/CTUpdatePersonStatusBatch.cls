public with sharing class CTUpdatePersonStatusBatch implements Database.Batchable<SObject> {
    
    /**
     * Return query for Person's status update date if it was less than 14 days,
     * and the health status is Red, Orange, or Yellow
     * @param Database.BatchableContext BC
     * @return Database.QueryLocator
     */
    public Database.QueryLocator start(Database.BatchableContext BC) {
        // List of health statuses that are Red, Orange, or Yellow
        List<String> healthStatuses = new List<String>{'Red', 'Orange', 'Yellow'};
        // Today's date and 14 days ago
        Date today = Date.today();
        Date fourteenDaysAgo = today.addDays(-14);
        return Database.getQueryLocator('SELECT Id, Health_Status__c FROM Person__c WHERE Status_Update_date__c = :fourteenDaysAgo AND Health_Status__c IN :healthStatuses');
    }

    /**
     * Updates the person's health status to 'Green'
     * @param scope
     * @param Database.BatchableContext BC
     */
    public void execute(Database.BatchableContext BC, List<person__c> scope) {
        for (Person__c person : scope) {
            person.Health_Status__c = 'Green';
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