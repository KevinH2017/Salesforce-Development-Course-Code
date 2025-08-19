Account acc = new Account(Name='New Account 1', Phone='123-456-7890');
AccountController.insertAccount(acc);

// To update an account, you must use a valid Id
Account acc = new Account(Id='001fj00000BjMcLAAV', Name='New Account 1', Phone='123-456-7890', Rating='Warm');
update acc;

// Finds the specified account with these fields and updates the fields
List<Account> accounts = [SELECT Id, Name, Phone FROM Account WHERE Name='New Account 1' AND Phone='123-456-7890'];
for (Account account : accounts) {
    account.Name = 'New Account 2';
    account.Rating = 'Hot';
}
// Pushes the update to the database
update accounts;

// Another way to update records
Database.update(accounts, true);