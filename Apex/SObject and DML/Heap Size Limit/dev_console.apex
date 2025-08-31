/*
Heap is the amount of memory allocated to your Apex code at runtime. 
The total heap size limit for a synchronous Apex transaction is 6 MB, 
while for an asynchronous transaction, it is 12 MB.

Total heap size limit: 6 MB

The space complexity of an algorithm or a computer program is the amount
of memory it needs to run to completion and produce an output.
*/

// Big SOQL query
List<Account> accounts = [SELECT Id, Type, Name, ParentId, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, BillingLongitude, BillingLatitude, BillingGeocodeAccuracy, BillingAddress, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, ShippingAddress, Phone, Fax, AccountNumber, Website, PhotoUrl, Sic, Industry, AnnualRevenue, NumberOfEmployees, Ownership, TickerSymbol, Description, Rating, Site, AccountSource, DunsNumber, Tradestyle, NaicsCode, NaicsDesc, YearStarted, SicDesc, DandbCompanyId, OperatingHoursId, CustomerPriority__c, SLA__c, Active__c, NumberofLocations__c, UpsellOpportunity__c, SLASerialNumber__c, SLAExpirationDate__c FROM Account];

// Infinite loop
while (1==1) {
    // Makes duplicate accounts
    List<Account> dupeAcc = accounts;
    // Adds duplicate accounts to orginal list
    accounts.addAll(dupeAcc);
}
// System.LimitException: Apex heap size too large: 6386251
// Heap size is more than 6mb

// Ways to improve heap utilization:

// Method 1: Nullify variables that are no longer needed
// Free the heap size used by accounts list
accounts = null;

// Mehod 2: Using SOQL for loop to retrieve records in batches of 200
// You can put the SOQL query inside the loop to avoid heap size limit issue
// But this is not a good practice as it can hit SOQL query limit
for (Account acc: [SELECT Id, Type, Name, ParentId, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, BillingLongitude, BillingLatitude, BillingGeocodeAccuracy, BillingAddress, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, ShippingAddress, Phone, Fax, AccountNumber, Website, PhotoUrl, Sic, Industry, AnnualRevenue, NumberOfEmployees, Ownership, TickerSymbol, Description, Rating, Site, AccountSource, DunsNumber, Tradestyle, NaicsCode, NaicsDesc, YearStarted, SicDesc, DandbCompanyId, OperatingHoursId, CustomerPriority__c, SLA__c, Active__c, NumberofLocations__c, UpsellOpportunity__c, SLASerialNumber__c, SLAExpirationDate__c FROM Account]) {
    // Process each account record
}