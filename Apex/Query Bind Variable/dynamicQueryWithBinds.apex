// The bind variables in the query are resolved from a Map parameter directly with a key rather than from Apex code variables
Map<String, Object> params = new Map<String, Object>{'source' => 'Web', 'industry' => 'Finance'};

// SOQL query with bind variables from Map object
String queryString = 'SELECT Id, Name, LeadSource, Industry FROM Lead WHERE LeadSource = :source AND Industry = :industry';

System.debug('LEAD RESULTS FROM DYNAMIC QUERY WITH BINDS');

// Execute dynamic query with binds
for (SObject Lead : Database.queryWithBinds(queryString, params, AccessLevel.USER_MODE)) {
    System.debug('Lead: ' + lead);
}