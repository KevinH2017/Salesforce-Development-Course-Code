// Challenge 11 - DML Challenge using SObject type

// Creates SObject Account and inserts it into database
SObject acc1 = (SObject)Type.forName('Account').newInstance();
acc1.put('Name', 'WingNut Films');
acc1.put('Rating', 'Warm');
insert acc1;

// Creates SObject Opportunity and inserts it into database
SObject opp1 = (SObject)Type.forName('Opportunity').newInstance();
opp1.put('Name', 'Lord Of The Rings');
opp1.put('StageName', 'Qualification');
opp1.put('CloseDate', Date.today().addDays(30));
opp1.put('Account', acc1);
insert opp1;

// Updates acc_name Name field
List<SObject> acc_name = [SELECT Id, Name FROM Account WHERE Name='WingNut Films'];
for (SObject so : acc_name) {
    so.put('Name', 'New Line Cinema');
}
update acc_name;
    
// Updates opp_stage Stage field
List<SObject> opp_stage = [SELECT Id, Name, StageName FROM Opportunity WHERE Name='Lord Of The Rings'];
for (SObject so : opp_stage) {
	so.put('StageName', 'Closed-Won');
}
update opp_stage;

// Deletes opp1
List<SObject> deleteOpp1 = [SELECT Id, Name FROM Opportunity WHERE Name='Lord Of The Rings'];
delete deleteOpp1;

// Undeletes opp1
List<SObject> savedOpp1 = [SELECT Id, Name FROM Opportunity WHERE Name='Lord Of The Rings' ALL ROWS];
undelete savedOpp1;