public class OpportunityController {

    public static void updateProfile(List<Id> oppIDs) {
        // Queries opp record from Opportunity table
        List<Opportunity> opps = [SELECT Id, Amount, Profile__c FROM Opportunity WHERE Id IN :oppIDs];
            
        // Loops through all opportunities and updates Profile field
        for (Opportunity opp : opps) {    

            if (opp.Amount == null) {
                opp.Profile__c = '';
            } else if (opp.Amount < 10000) {
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