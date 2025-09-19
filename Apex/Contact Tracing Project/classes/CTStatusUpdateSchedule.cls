public with sharing class CTStatusUpdateSchedule implements Schedulable{

    // Schedule the batch job to run every day at 3am
    public static final String CRON = '0 0 3 * * ?';
    
    /**
     * Clean up batch job using CTUpdatePersonStatusBatch class
     * @param SchedulableContext SC
     */
    public void execute(SchedulableContext SC) {
        CTUpdatePersonStatusBatch personBatch = new CTUpdatePersonStatusBatch();
        Database.executeBatch(personBatch, 2000);
    }
}