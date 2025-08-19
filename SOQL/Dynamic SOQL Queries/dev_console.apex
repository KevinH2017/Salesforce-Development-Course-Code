// Dynamic SOQL Queries can be used at runtime in apex code dynamically
// They enable you to create more flexible applications

/* Example:
String dynQuery = 'SELECT Id, Name FROM Account';
// Gets all accounts with a specific type and filters their ratings AND amounts
if (accountType == 'Red') {
    dynQuery += ' WHERE Rating=\'Hot\' AND Amount > 100000';
}
// Uses the dynamic query to get accounts from the database that matches the above conditions
List <Account> accounts = Database.query(dynQuery);
*/

String accountClass = 'Class1';

String queryString = 'SELECT Id, Name, Phone, Rating FROM Account';

// Adds the query WHERE clause and AND clause to the queryString; must use a space before WHERE clause
if (accountClass == 'Class1') {
    queryString += ' WHERE Rating=\'Hot\' AND Type=\'Prospect\'';
} else if (accountClass == 'Class2') {
    queryString += ' WHERE Rating=\'Warm\' AND Type=\'Other\'';
} else {
    queryString += ' WHERE Rating=\'Hot\'';
}

// Dynamic Queries must use Database.query(dynQuery);
List<Account> accounts = Database.query(queryString);
System.debug('Accounts: ' + accounts);
System.debug('Accounts Size: ' + accounts.size());
