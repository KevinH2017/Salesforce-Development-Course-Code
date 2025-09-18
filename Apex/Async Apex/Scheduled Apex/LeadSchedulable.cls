public class LeadSchedulable implements Schedulable {
	
    public void execute(SchedulableContext sc) {
        List<Lead> existingRecords = [SELECT Id, LeadSource FROM Lead];

        for (Lead records : existingRecords) {
            records.LeadSource = 'Web';
        }
        update existingRecords;
    }
}