public class LeadAsynchronous {

    /**
     * Updates lead records LeadSource
     * @param existingRecordsIds
     */
    @future
    public static void updateLeadRecords(Set<Id> existingRecordsIds) {
        // Must use primitive data type Id instead of Lead in the parameter
        // Must call the query inside the future method to get Lead records
        List<Lead> existingRecords = [
            SELECT Id, LeadSource
            FROM Lead
            WHERE Id IN :existingRecordsIds
        ];

        for (Lead records : existingRecords) {
            records.LeadSource = 'Web';
        }
        update existingRecords;
    }

    // Create a new lead record
	@future    
    public static void createLeadRecords() {
        Lead anotherLead = new Lead(
            LastName='Test Lead Single', 
            Status='Open - Not Contacted', 
            Company='ASYNC TEST COMPANY', 
            Industry='Finance'
        );
        insert anotherLead;
    }
}