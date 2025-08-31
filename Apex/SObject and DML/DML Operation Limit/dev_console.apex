// Retrieves all Ids from Opportunity
List<Opportunity> oppRecs = [SELECT Id FROM Opportunity];

// Creates list oppIds
List<Id> oppIds = new List<Id>();

// Loops through all Opportunity records and adds their Ids to oppIds list
for (Opportunity opp : oppRecs) {
    oppIds.add(opp.Id);
    oppIds.add(opp.Id);
    oppIds.add(opp.Id);
    oppIds.add(opp.Id);
    oppIds.add(opp.Id);
}

// Updates Opportunity records
OpportunityController.updateProfile(oppIds);

// Inserts 200 Opportunity records
// Will cause "System.LimitException: Too many DML statements: 151", if attempted to add to insert list in the above loop
List<Opportunity> opps = new List<Opportunity>();
for (integer i=0; i<200; i++) {
	opps.add(new Opportunity(Name='Test Opp'+i, CloseDate=Date.today(), StageName='Qualification'));
}
insert opps;

// Bulkification 101:
// Never write DML statements inside a loop