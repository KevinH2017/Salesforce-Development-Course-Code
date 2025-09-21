public with sharing class AccountTriggerHandler {
    public static void afterUpdateHandler(List<Account> accs) {
        // SOQL query to get Accounts from Opportunity object
        // Without sufficient permissions using WITH USER_MODE, an error will be thrown: 
            // System.QueryException: Variable does not exist: tmpVar1
        for (Opportunity opp : [
            SELECT Id, Name, Amount
            FROM Opportunity
            WHERE AccountId IN :accs
            // WITH USER_MODE               
        ]) {
            System.debug('Opp Id: ' + opp.Id);
            System.debug('Opp Name: ' + opp.Name);
            System.debug('Opp Amount: ' + opp.Amount);
        }

        // DML insert for a new Opportunity object
        List<Opportunity> oppsToInsert = new List<Opportunity>();
        for (Account acc : accs) {
            if (acc.Type == 'Customer - Direct') {
                oppsToInsert.add(
                    new Opportunity(
                        Name = 'Direct Customer Opp -' + acc.Name,
                        Amount = 100000,
                        AccountId = acc.Id,
                        StageName = 'Prospecting',
                        CloseDate = Date.today()
                    )
                );
            }
        }
        insert oppsToInsert;

        // Using insert as user, an error will be thrown if not given enough access:
            // System.DmlException: Operation failed due to fields being inaccessible on Sobject Opportunity, 
            // check errors on Exception or Result! 
        // insert as user oppsToInser;
        
        
        // Database query for Opportunities for AccountIds with USER_MODE privileges
        // If not given enough access, AccessLevel.USER_MODE will throw an exception:
            // System.QueryException: No such column 'Amount' on entity 'Opportunity'. 
            // If you are attempting to use a custom field, be sure to append the '__c' after the custom field name. 
            // Please reference your WSDL or the describe call for the appropriate names.
        List<Opportunity> opps = Database.query(
            'SELECT Id, Name, Amount FROM Opportunity WHERE AccountId IN :accs',
            AccessLevel.USER_MODE
        );
        for (Opportunity opp : opps) {
            System.debug('Database Query Opp Id: ' + opp.Id);
            System.debug('Database Query Opp Name: ' + opp.Name);
            System.debug('Database Query Opp Amount: ' + opp.Amount);
        }
    }
}
