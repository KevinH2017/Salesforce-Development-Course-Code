// Create list of all Opportunities with their Ids
List<Opportunity> opps = [SELECT Id FROM Opportunity];

// List of Opportunity Ids
List<Id> oppIds = new List<Id>();

// Adds Opportunity Ids to the list
for (Opportunity opp : opps) {
    oppIds.add(opp.Id);
}

// Calls the OpportunityController to update Profiles
OpportunityController.updateProfile(oppIds);