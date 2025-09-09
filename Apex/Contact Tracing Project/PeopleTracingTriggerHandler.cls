public with sharing class CTPersonTracingHandler extends Exception {

    public static void beforeInsert(List<Person> newRecord) {
        // Check for duplicate records
        for (Person p : newRecords) {
            List<Id> pid = [SELECT COUNT(Id) personId 
                            FROM Person_Tracing__c 
                            WHERE COUNT(personId) > 0];

            // If duplicates found, add error
            // If no duplicates found, add record
            if (pid.size() > 0) {
                throw new Exception('Error: Duplicate record found!');
            } else {
                newRecords.add(p);
            }
        }
    }

    public static void afterInsert(List<Person> newRecords) {
        // Check for duplicate records
        for (Person p : newRecords) {
            List<Id> pid = [SELECT COUNT(Id) personId 
                            FROM Person_Tracing__c 
                            WHERE COUNT(personId) > 0];

            // If duplicates found, add error
            // If no duplicates found, add record
            if (pid.size() > 0) {
                throw new Exception('Error: Duplicate record found!');
            } else {
                newRecords.add(p);
            }
        }
    }
}