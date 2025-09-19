public with sharing class CTDataCleanupSchedule implements Schedulable {

    // Schedule the batch job to run every day at 2am
    public static final String CRON = '0 0 2 * * ?';
    
    /**
     * Clean up batch job
     * @param SchedulableContext SC
     */
    public void execute(SchedulableContext SC) {
        CTPeopleTracingDataCleanupBatch peopleBatch = new CTPeopleTracingDataCleanupBatch();
        Database.executeBatch(peopleBatch, 2000);

        CTLocationTracingDataCleanupBatch locationBatch = new CTLocationTracingDataCleanupBatch();
        Database.executeBatch(locationBatch, 2000);
    }
}