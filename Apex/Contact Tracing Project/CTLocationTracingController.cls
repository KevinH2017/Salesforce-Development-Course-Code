/**
 * CTLocationTracingController
 * Main controller class for location tracing in CT project
 * @author Kevin
 */
public with sharing class CTLocationTracingController {

    /** Gets all visitors for a specific location
     * @param locationId The ID of the location to retrieve visitors for
     * @return List of visitor IDs in descending order
     */
    public static List<String> getVisitors(String locationId) {
        return [SELECT Visitor__c 
                FROM Location_Trace__c 
                WHERE Location__c = :locationId
                ORDER BY Visit_Date__c DESC];
    }

    /** Gets all locations visited by a set of persons, limited to last 10 days
     * @param personIds The set of person IDs to retrieve locations for
     * @return List of location IDs
     */
    public static List<String> getLocationsByPersonIds(Set<Id> personIds) {
        return [SELECT Location__c 
                FROM Location_Trace__c 
                WHERE Visitor__c IN :personIds
                    AND Visit_Date__c = LAST_N_DAYS:10];
    }

    /** Gets all locations visited by a set of locations, limited to last 10 days
     * @param locationIds The set of location IDs to retrieve locations for
     * @return List of location IDs
     */
    public static List<String> getLocationsByLocationIds(Set<Id> locationIds) {
        return [SELECT Location__c 
                FROM Location_Trace__c 
                WHERE Location__c IN :locationIds
                    AND Person_Health_Status__c = 'Green'
                    AND Visit_Date__c = LAST_N_DAYS:10];
    }

    /** Checks for duplicate location traces
     * @param locationTraces The list of location traces to check
     * @return List of duplicate trace IDs
     */
    public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> locationTraces) {
        // Stores unique location IDs and person IDs
        Set<Id> locationIds = new Set<Id>();
        Set<Id> personIds = new Set<Id>();
        for (Location_Tracing__c trace : locationTraces) {
            locationIds.add(trace.Location__c);
            personIds.add(trace.Visitor__c);
        }

        // Query for location and person IDs
        List<Location_Tracing__c> existingRecords = [SELECT Id, Location__c, Visitor__c
                                                FROM Location_Trace__c
                                                WHERE Location__c IN :locationIds
                                                    AND Visitor__c IN :personIds];

        // Map of duplicate location traces with set of person IDS
        Map<Id, Set<Id>> mapOfDupes = new Map<Id, Set<Id>>();       // EX: location1_id, [person1_id, person2_id]

        // List of duplicate records
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();

        // Populates the map with duplicate location traces
        if (existingRecords != null && existingRecords.size() > 0) {
            for (Location_Tracing__c trace : existingRecords) {
                if(!mapOfDupes.containsKey(trace.Location__c)) {
                    mapOfDupes.put(trace.Location__c, new Set<Id>());
                }
                // Adds person ID to the set for the location
                mapOfDupes.get(trace.Location__c).add(trace.Visitor__c);
            }

            // Loops over new location tracing records
            for (Location_Tracing__c trace : existingRecords) {
                // Checks for location id, if found in map, then check for person in set
                if (mapOfDupes.containsKey(trace.Location__c) 
                    && mapOfDupes.get(trace.Location__c).contains(trace.Visitor__c)) {
                    // Adds duplicate trace to the list
                    duplicates.add(trace);
                }
            }
        }

        return duplicates;
    }
}