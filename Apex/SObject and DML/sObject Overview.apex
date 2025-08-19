// Primitive Data Types:
// Boolean
// Date
// DateTime
// Decimal
// Double
// Id
// Integer
// Long
// Object
// String
// Time

// Collections:
// List
// Set
// Map

// Class as Datatype:
// Covid19 is the datatype and jaipur is the variable
Covid19 jaipur = new Covid19();
List<Covid19> covidList = new List<Covid19>();
Set<Covid19> covidSet = new Set<Covid19>();
Map<String, Covid19> covidMap = new Map<String, Covid19>();

// Standard / Custom Object as Datatype:
// Account is the datatype and account is the variable
Account account = new Account(Name='New Account');
List<Account> accounts = new List<Account>();
Set<Account> accountSet = new Set<Account>();
Map<String, Account> accountMap = new Map<String, Account>();

// SOQL Queries
List<Account> accounts = [SELECT Id, Name FROM Account];

Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account]);

// SObject Datatype:
List<Account> accounts = [SELECT Id, Name FROM Account];

// SObjects are Salesforce Objects, or records stored in the database
// Any standard or custom object is an SObject
// Examples:
List<SObject> accounts = [SELECT Id, Name FROM Account];
List<SObject> contacts = [SELECT Id, Name FROM Contact];
List<SObject> leads = [SELECT Id, Name FROM Lead];
List<SObject> books = [SELECT Id, Name FROM Book__c];
List<SObject> authors = [SELECT Id, Name FROM Author__c];

for (SObject author : authors) {
    // Process each author record
}