// Retrieves all Ids from Opportunity
List<Opportunity> oppRecs = [SELECT Id FROM Opportunity];

// Creates list oppIds
List<Id> oppIds = new List<Id>();

// Loops through all Opportunity records and adds their Ids to oppIds list
for (Opportunity opp : oppRecs) {
    oppIds.add(opp.Id);

    // System.LimitException: Too many SOQL queries: 101
    oppIds.add(opp.Id);
    oppIds.add(opp.Id);
    oppIds.add(opp.Id);
    oppIds.add(opp.Id);
}

// Updates Opportunity records
OpportunityController.updateProfile(oppIds);
// Only uses 2 SOQL queries