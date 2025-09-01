/**
 * CTPeopleTracingController
 * Main controller class for people tracing in CT project
 * @author Kevin
 */
public with sharing class CTPeopleTracingController {

    /** Get traces for a specific record 
     * @param recordId The ID of the record to retrieve traces for
     * @return A string representation of the traces for the specified record
    */
    public static List<People_Tracing__c> getTraces(String recordId) {
        return [SELECT Id, Name, Person_1__c, Person_2__c, Contact_Date__c, Person_1__r.Health_Status__c, Person_2__r.Health_Status__c
                FROM People_Tracing__c 
                WHERE Person_1__c = :recordId
                    OR Person_2__c = :recordId
                ORDER BY Contact_Date__c DESC];
    }

    /** Check for duplicate traces 
     * @param peopleTraces The list of people tracing records to check for duplicates
     * @return A list of duplicate people tracing records
    */
    public static List<People_Tracing__c> checkDuplicates(List<People_Tracing__c> peopleTraces) {
        // Stores unique trace IDs of Person_1 and Person_2
        Set<String> traceIds = new Set<String>();
        for (People_Tracing__c trace : peopleTraces) {
            traceIds.add(trace.Person_1__c);
            traceIds.add(trace.Person_2__c);
        }

        // Retrieve existing records
        List<People_Tracing__c> existingRecords = [SELECT Id, Name, Person_1__c, Person_2__c 
                                                    FROM People_Tracing__c 
                                                    WHERE Person_1__c IN :traceIds
                                                        OR Person_2__c IN :traceIds];

        // Map to hold existing record IDs
        Map<Id, Set<Id>> mapOfDupes = new Map<Id, Set<Id>>();

        // List of duplicate records
        List<People_Tracing__c> duplicates = new List<People_Tracing__c>();

        // Populates the map with duplicate person traces
        if (existingRecords != null && existingRecords.size() > 0) {
            // Checks person 1 against person 2
            for (People_Tracing__c trace : existingRecords) {
                if(!mapOfDupes.containsKey(trace.Person_1__c)) {
                    mapOfDupes.put(trace.Person_1__c, new Set<Id>());
                }
                // Adds person ID to the set
                mapOfDupes.get(trace.Person_1__c).add(trace.Person_2__c);
            
            // Loops over new person tracing records
            // Checks person 2 against person 1
                if(!mapOfDupes.containsKey(trace.Person_2__c)) {
                    mapOfDupes.put(trace.Person_2__c, new Set<Id>());
                }
                // Adds person ID to the set
                mapOfDupes.get(trace.Person_2__c).add(trace.Person_1__c);
            }

            // Loops over existing records of traces
            for (People_Tracing__c trace : existingRecords) {
                // Checks for person 1 id, if found in map, then check for person 2 in set 
                // as well as the inverse
                if (mapOfDupes.containsKey(trace.Person_1__c) 
                    && mapOfDupes.get(trace.Person_1__c).contains(trace.Person_2__c)
                    ||
                    mapOfDupes.containsKey(trace.Person_2__c)
                    && mapOfDupes.get(trace.Person_2__c).contains(trace.Person_1__c)) {
                    // Adds duplicate trace to the list
                    duplicates.add(trace);
                }
            }        
        }

        return duplicates;
    }
        
}
