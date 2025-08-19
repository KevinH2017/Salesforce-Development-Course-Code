// Creates bind variables source and industry objects for Map params
Map<String, Object> params = new Map<String, Object>{'source' => 'Web', 'industry' => 'Finance'};

// Binds variables to SOQL query from above params variable                                               
String queryString = 'SELECT Id, Name, LeadSource, Industry FROM Lead WHERE LeadSource = :source AND Industry = :industry';

System.debug('LEAD RESULTS FROM DYNAMIC QUERY WITH BINDS');

// Queries database using the above bind variables with a for-loop
// AccessLevel runs with a specific user context (not admin / elevated permissions like default)
for (SObject lead : Database.queryWithBinds(queryString, params, AccessLevel.USER_MODE)) {
    System.debug('Lead: ' + lead);
}