// Aggregate Functions in Apex

AggregateResult[] groupedResults = [SELECT AVG(Amount), MAX(Amount) FROM Opportunity];

// Gets average amount from expression 0
Double avgAmount = Double.valueOf(groupedResults[0].get('expr0'));

// Gets max amount from expression 1
Double maxAmount = Double.valueOf(groupedResults[0].get('expr1'));

// Using Aliases:
// Aliases makes it easier to read the code instead of just 'expr0', 'expr1', etc.
AggregateResult[] groupedResults = [SELECT AVG(Amount) avgAmount, MAX(Amount) maxAmount FROM Opportunity];

// Gets average amount from avgAmount alias
Double avgAmount = Double.valueOf(groupedResults[0].get('avgAmount'));

// Gets max amount from maxAmount alias
Double maxAmount = Double.valueOf(groupedResults[0].get('maxAmount'));


// Without Aliases / Using Expressions:
AggregateResult[] groupedResult = [SELECT StageName, MAX(Amount), MIN(Amount), AVG(Amount) 
                                    FROM Opportunity 
                                    GROUP BY StageName];

for(AggregateResult result: groupedResult){
    System.debug('StageName: '+ result.get('StageName') + 
                    ' Max Amount: '+ result.get('expr0') + 
                    ' Min Amount: ' + result.get('expr1') + 
                    ' Avg Amount: ' + result.get('expr2'));
}

// Using Aliases:
AggregateResult[] groupedResult = [SELECT StageName, MAX(Amount) maxAmount, MIN(Amount) minAmount, AVG(Amount) avgAmount 
                                    FROM Opportunity 
                                    GROUP BY StageName];

for(AggregateResult result: groupedResult){
    System.debug('StageName: '+ result.get('StageName') + 
                    ' Max Amount: '+ result.get('maxAmount') + 
                    ' Min Amount: ' + result.get('minAmount') + 
                    ' Avg Amount: ' + result.get('avgAmount'));
}
