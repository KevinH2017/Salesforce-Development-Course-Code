// Apex variables can be used in SOQL using colon (:), these are called bind variables
// Examples:
// Set<Id> accountIds = new Set<Id>();
// [SELECT Id, Name, Rating FROM Account Where Id In :accountIds];

// String leadName = 'xyz Corp';
// [SELECT Id, Name, Company FROM Lead WHERE Name = :leadName];

// Bind variables can be used as:
// - The filter literals in WHERE clauses
// - The value of the IN or NOT IN operator in WHERE clauses, allowing filtering
// on a dynamic set of values. Note that this is a particular use with a list of
// IDs, or Strings, though it works with lists of any types
// - The numeric value in LIMIT clauses
// - The numeric value in OFFSET clauses

// Added 5 accounts to accountNames list object
List<String> accountNames = new List<String>();
accountNames.add('New Line Cinema');
accountNames.add('Sample SObject Account');
accountNames.add('My Account');
accountNames.add('Burlington Textiles Corp of America');

// Retrieves their Id, Name, and Rating from accountNames list
List<Account> accounts = [SELECT Id, Name, Rating FROM Account 
                          WHERE Name IN :accountNames];

System.debug('Account Size: ' + accounts.size());
System.debug('Accounts: ' + accounts);