// Using SOQL in Apex to get records from Standard and Custom objects
// SOQL must be in []
// Example:
List<Account> accounts = [SELECT Name, Phone FROM Account];

// Use dot (.) operator to retrieve field values; account.Name, account.Phone
// Use for-loop to iterate over the accounts to retrieve field values
for (Account account : accounts) {
    System.debug('Account Name: ' + account.Name + ', Account Phone: ' + account.Phone);
}

// Map creates a unique Id to store each Account object
// Creates a new Map object from the SOQL command
Map<Id, Account> accountsMap = New Map<Id, Account>([SELECT Name, Phone FROM Account]);

// use .values() when accessing the Map values as a List, use .keySet() to get the keys as a Set
for (Account account : accountsMap.values()) {
    System.debug('Account ID: ' + account.Id + ', Account Name: ' + account.Name + ', Account Phone: ' + account.Phone);
}

// To get a Map<Id, sObject> from a SOQL query you must write your SOQL in a new Map instance:
// Example:
// Map<Id, sObject> mapObject = New Map<Id, sObject>([SOQL_QUERY_HERE]);