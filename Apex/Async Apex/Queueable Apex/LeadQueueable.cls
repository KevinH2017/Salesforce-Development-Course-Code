public class LeadQueueable implements Queueable {
	
    public void execute(QueueableContext context) {
        // Async code        
        List<Lead> existingRecords = [SELECT Id, LeadSource FROM Lead];

        for (Lead records : existingRecords) {
            records.LeadSource = 'Web';
        }
        update existingRecords;
    }
}