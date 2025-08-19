// Creates new Account object and inserts it into salesforce
Account acc = new Account(Name='DML Test', Phone='1122334455');
// Inserts new Rating field to account, must use the correct field name
acc.Rating = 'Hot';
try {
    insert acc;
} catch (DmlException e) {
    // EXCEPTION HERE
}

// List of account objects
List<Account> accounts = new List<Account>();
Account acc1 = new Account(Name='DML Test 1');
Account acc2 = new Account(Name='DML Test 2');
Account acc3 = new Account(Name='DML Test 3');
Account acc4 = new Account(Name='DML Test 4');
Account acc5 = new Account(Name='DML Test 5');
accounts.add(acc1);
accounts.add(acc2);
accounts.add(acc3);
accounts.add(acc4);
accounts.add(acc5);
// Inserts the list of accounts
try {
    insert accounts;
} catch (DmlException e) {
    // EXCEPTION HERE   
}

// Another way to insert records into the database
// Database.insert(accounts);             // By default, false is used
// Database.insert(accounts, true);    // Partial success NOT allowed
// Database.insert(accounts, false);   // Partial success IS allowed


// In logs, Number of DML statements is total insert/update/delete/undelete statements in a single transaction
// Number of DML rows is the records being processed by the DML statement