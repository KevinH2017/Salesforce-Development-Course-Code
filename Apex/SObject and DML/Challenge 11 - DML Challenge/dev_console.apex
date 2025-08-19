// Challenge 11 - DML Challenge

// Creates Account object and inserts it into database
Account acc1 = new Account(Name='WingNut Films', Rating='Warm');
insert acc1;

// Creates Opportunity object and inserts it into database
Opportunity opp1 = new Opportunity(Name='Lord Of The Rings', StageName='Qualification', CloseDate= Date.today().addDays(30), Account=acc1);
insert opp1;

// Updates acc_name Name field
Account acc_name = [SELECT Id, Name FROM Account WHERE Name='WingNut Films'];
acc_name.Name = 'New Line Cinema';
update acc_name;

// Updates opp_stage Stage field
Opportunity opp_stage = [SELECT Id, Name, StageName FROM Opportunity WHERE Name='Lord Of The Rings'];
opp_stage.StageName = 'Closed-Won';
update opp_stage;

// Deletes opp1
Opportunity deleteOpp1 = [SELECT Id, Name FROM Opportunity WHERE Name='Lord Of The Rings'];
delete deleteOpp1;

// Undeletes opp1
Opportunity[] savedOpp1 = [SELECT Id, Name FROM Opportunity WHERE Name='Lord Of The Rings' ALL ROWS];
undelete savedOpp1;