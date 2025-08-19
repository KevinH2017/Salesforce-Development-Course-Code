// Retrieves all accounts and assigns it to a list
List<SObject> accounts = [SELECT Id, Name, Account.Case FROM Account];
// SObject is a generic representation of any Salesforce object
for (SObject account : accounts) {
    System.debug('Account Id: ' + (String)account.get('Id') + 
    ', Name: ' + (String)account.get('Name') + 
    ', Case: ' + (String)account.getSObject('Case').get('Name'));    // (String) converts output to be String type
}