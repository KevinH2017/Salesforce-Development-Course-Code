// Challenge 11 - DML Challenge using SObject type

// Creates SObject Account and inserts it into database
SObject acc1 = (SObject)Type.forName('Account').newInstance();
acc1.put('Name', 'WingNut Films');
acc1.put('Rating', 'Warm');
insert acc1;

// Gets account records
SObject account = Database.query('SELECT Id, Name FROM Account WHERE Name=\'WingNut Films\' LIMIT 1');

// Creates SObject Opportunity and inserts it into database
SObject opp1 = (SObject)Type.forName('Opportunity').newInstance();
opp1.put('Name', 'Lord Of The Rings');
opp1.put('StageName', 'Qualification');
opp1.put('CloseDate', Date.today().addDays(30));
// Connects opp1 to acc1 through AccountId
opp1.put('AccountId', acc1.Id);
insert opp1;

// Updates acc_name Name field
SObject acc_name = Database.query('SELECT Id, Name FROM Account WHERE Name=\'WingNut Films\' LIMIT 1');
acc_name.put('Name', 'New Line Cinema');
update acc_name;
    
// Updates opp_stage Stage field
SObject opp_stage = Database.query('SELECT Id, Name, StageName FROM Opportunity WHERE Name=\'Lord Of The Rings\' LIMIT 1');
opp_stage.put('StageName', 'Closed-Won');
update opp_stage;

// Deletes opp1
SObject deleteOpp1 = Database.query('SELECT Id, Name, StageName FROM Opportunity WHERE Name=\'Lord Of The Rings\' LIMIT 1');
delete deleteOpp1;

// Undeletes opp1
List<SObject> savedOpp1 = Database.query('SELECT Id, Name, StageName FROM Opportunity WHERE isDeleted=true ALL ROWS');
undelete savedOpp1;