// Inserting records one by one
// Each record is inserted with separate insert statement
// Debug logs:
// Number of DML statements: 5 out of 150
// Number of DML rows: 5 out of 10000
Account acc1 = new Account(Name='DML Test 1');
insert acc1;
Account acc2 = new Account(Name='DML Test 2');
insert acc2;
Account acc3 = new Account(Name='DML Test 3');
insert acc3;
Account acc4 = new Account(Name='DML Test 4');
insert acc4;
Account acc5 = new Account(Name='DML Test 5');
insert acc5;

// Inserting all records at once
// All records are added to a list first and then inserted with one single insert statement
// Debug logs:
// Number of DML statements: 1 out of 150
// Number of DML rows: 6 out of 10000
List<Account> accounts = new List<Account>();
Account acc1 = new Account(Name='DML Test 1');
Account acc2 = new Account(Name='DML Test 2');
Account acc3 = new Account(Name='DML Test 3');
Account acc4 = new Account(Name='DML Test 4');
Account acc5 = new Account(Name='DML Test 5');
Account acc6 = new Account(Name='DML Test 6');
accounts.add(acc1);
accounts.add(acc2);
accounts.add(acc3);
accounts.add(acc4);
accounts.add(acc5);
accounts.add(acc6);
// Inserts the list of accounts
try {
    insert accounts;
} catch (DmlException e) {
    // EXCEPTION HERE   
}
