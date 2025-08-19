// Retrieves all accounts to delete
List<Account> accounts = [
    SELECT Id, Name FROM Account WHERE Name LIKE 'Test Account%'
];
// Deletes using DML statement
delete accounts;
// Deletes using Database method
// Database.delete(accounts);

// Deleted items are put into the recycle bin and can be retrieved with undelete
// Requires isDeleted=true and ALL ROWS keywords
List<Account> deletedAccounts = [
    SELECT Name, Phone FROM Account WHERE isDeleted=true ALL ROWS
];
// Undeletes records
undelete deletedAccounts;