// Data Manipulation Language (DML) is used to insert, update, merge, delete, and restore data in Salesforce

// Insert adds one or more sObjects, such as an individual account or contact to your organization's data
// It is similar to the INSERT statement in SQL
// Example:
Account newAcct = new Account(name = 'Acme');       // Creates new Account object
try {
   insert newAcct;                                  // Inserts the new account
} catch (DmlException e) {
    // EXCEPTION HERE
}

// Update modifies existing sObjects in your organization's data
// It is similar to the UPDATE statement in SQL
// Example:
Account a = new Account(Name='Acme2');      // Old entry
insert(a);

Account myAcct = [SELECT Id, Name, BillingCity FROM Account WHERE Id = :a.Id];
myAcct.BillingCity = 'San Francisco';       // New entry

try {
    update myAcct;          // Updates the account name
} catch (DmlException e) {
    // EXCEPTION HERE
}

// Upsert creates new records or updates sObject records within a single statement
// It uses a specified field to determine the presence of existing objects or the ID field if no field is specified
// Example:
// Upsert chooses either to Insert or Update the key
List<Account> acctList = new List<Account>();
// New accounts to be added
acctList.add(new Account(Name='Acme3', BillingCity='Los Angeles'));
acctList.add(new Account(Name='Acme4', BillingCity='San Diego'));

try {
    upsert acctList;        // Upserts the accounts into the list
} catch (DmlException e) {
   // EXCEPTION HERE
}
// Upsert determines which to use by checking:
// - If the key isn't matched, a new object record is created
// - If the key isn't matched once, the existing object record is updated
// - If the key is matched multiple times, an error is generated and the object record isn't inserted OR updated

// Delete removes one or more existing sObject records from the organization's data
// It is similar to the delete() statement in SQL
// Example:
// Deletes all accounts that have the name 'DotCom'
Account[] doomedAccts = [SELECT Id, Name FROM Account WHERE Name = 'DotCom']; 
try {
    delete doomedAccts;
} catch (DmlException e) {
    // EXCEPTION HERE
}

// Undelete restores one or more deleted sObject records from your organization's recycle bin
// It is similar to the UNDELETE statement in SQL
// Example:
// Restores all accounts that have the name 'Universal Containers'
// ALL ROWS keyword queries all rows for both top level and aggregate relationships, including deleted records and archived activities
Account[] savedAccts = [SELECT Id, Name FROM Account WHERE Name = 'Universal Containers' ALL ROWS]; 
try {
    undelete savedAccts;
} catch (DmlException e) {
    // EXCEPTION HERE
}

// Merge combines up to three records of the same sObject type into one of the records, deleting the others, and re-parenting any related records
// Example:
// The first parameter is the master record into which the other records are to be merged into
// The second parameter represents the one or two other records that should be merged and then deleted
// You can pass these records into the merge statement as a single sObject record or ID, or as a list of two sObject records or IDs
List<Account> ls = new List<Account>{new Account(name='Acme Inc.'),new Account(name='Acme')};
insert ls;
Account masterAcct = [SELECT Id, Name FROM Account WHERE Name = 'Acme Inc.' LIMIT 1];
Account mergeAcct = [SELECT Id, Name FROM Account WHERE Name = 'Acme' LIMIT 1];
try {
    merge masterAcct mergeAcct;
} catch (DmlException e) {
    // EXCEPTION HERE
}