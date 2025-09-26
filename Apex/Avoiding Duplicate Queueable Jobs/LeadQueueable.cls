public class LeadQueueable implements Queueable {

    public void execute(QueueableContext context) {
        System.debug('Executing at: ' + Datetime.now());
        List<Lead> existingRecords = [SELECT Id, LeadSource FROM Lead];
        // Async code to update LeadSource
        for (Lead lead : existingRecords) {
            lead.LeadSource = 'Web';
        }
        update existingRecords;
    }
}