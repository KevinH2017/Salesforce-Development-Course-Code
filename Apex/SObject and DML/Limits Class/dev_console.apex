/* 
Limits Class

You can get the current limit usage in apex using methods in Limits class

Example:
getDMLStatements() - returns the number of DML statements (such as insert, update, 
                    or the database.EmptyRecycleBin method) 
                    that have been executed in the current transaction

getHeapSize() - returns the total heap size of memory (in bytes) for the heap

You can also get the allowed limits in apex using methids in Limits class

Example:
getLimitDMLStatements() - returns the maximum number of DML statements or the 
                        database.EmptyRecycleBin methods that can be executed in 
                        a transaction

getLimitHeapSize() - returns the maximum heap size of memory (in bytes) for the heap

Documentation: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_limits.htm
*/

// Big SOQL query to get all accounts
List<Account> accounts = [SELECT Id, Type, Name, ParentId, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, BillingLongitude, BillingLatitude, BillingGeocodeAccuracy, BillingAddress, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, ShippingAddress, Phone, Fax, AccountNumber, Website, PhotoUrl, Sic, Industry, AnnualRevenue, NumberOfEmployees, Ownership, TickerSymbol, Description, Rating, Site, AccountSource, DunsNumber, Tradestyle, NaicsCode, NaicsDesc, YearStarted, SicDesc, DandbCompanyId, OperatingHoursId, CustomerPriority__c, SLA__c, Active__c, NumberofLocations__c, UpsellOpportunity__c, SLASerialNumber__c, SLAExpirationDate__c FROM Account];

// Infinite loop
while (1==1) {
    // Checks if the max heap size is reached and breaks the loop
    if (Limits.getHeapSize()*2 >= Limits.getLimitHeapSize()) {
        System.debug('Max Heap Size reached');
        break;
    }
    // Makes duplicate accounts
    List<Account> dupeAcc = accounts;
    // Adds duplicate accounts to orginal list
    accounts.addAll(dupeAcc);
}
// Prints the size of the list
System.debug('List Size: ' + accounts.size());
// (4402718778)|USER_DEBUG|[16]|DEBUG|List size: 1114112