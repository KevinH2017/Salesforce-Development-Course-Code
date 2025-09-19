public with sharing class CTDataCleanupSchedule implements Schedulable {

    // Schedule the batch job to run every day at 2am
    public static final String CRON = '0 0 2 * * ?';
    
    /**
     * Clean up batch job
     * @param SchedulableContext SC
     */
    public void execute(SchedulableContext SC) {
        CTPeopleTracingDataCleanupBatch batch = new CTPeopleTracingDataCleanupBatch();
        Database.executeBatch(batch, 2000);
    }
}