public class OpportunityController {

    public static void updateProfile(List<Id> oppIDs) {
        // Loops through all opportunities and updates Profile field
        for (Id oppID : oppIDs) {
            
            // Queries opp record from Opportunity table
            Opportunity opp = [SELECT Id, Amount, Profile__c FROM Opportunity WHERE Id=:oppID];
            
            if (opp.Amount < 10000) {
                opp.Profile__c = 'Low';
            } else if (opp.Amount > 50000) {
                opp.Profile__c = 'High';
            } else if (opp.Amount > 10000 && opp.Amount <= 50000) {
                opp.Profile__c = 'Medium';
            }
            // Updates Opportunity
            update opp;
        }
    }
}