// The SOQL query is INSIDE the for loop.
// This allows for more dynamic and context-specific queries.

// SOQL For Loop Example:
for(AggregateResult result: [SELECT StageName, MAX(Amount) maxAmount, MIN(Amount) minAmount, AVG(Amount) avgAmount 
                            FROM Opportunity 
                            GROUP BY StageName]) {
    System.debug('StageName: '+ result.get('StageName') + 
                    ' Max Amount: '+ result.get('maxAmount') + 
                    ' Min Amount: ' + result.get('minAmount') + 
                    ' Avg Amount: ' + result.get('avgAmount'));
}
