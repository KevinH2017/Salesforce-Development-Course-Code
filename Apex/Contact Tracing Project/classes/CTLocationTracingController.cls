public with sharing class CTLocationTracingController {
    /**
     * Get all visitors for a location based on locationId in descending order
     * @param locationId
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getVistors(String locationId) {
        return [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Token__c, Person__r.Health_Status__c 
                FROM Location_Tracing__c 
                WHERE Location__c = :locationId 
                ORDER BY Visit_Date__c DESC];
    }

    /**
     * Get all locations for a person for the last 10 days
     * @param personIds
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getLocationsByPersonIds(Set<Id> personIds) {
        return [SELECT Id, Person__c, Location__c 
                FROM Location_Tracing__c 
                WHERE Person__c IN :personIds 
                    AND Visit_Date__c = LAST_N_DAYS:10];
    }

    /**
     * Get all locations for a location for the last 10 days and anyone with green health status
     * @param locationIds
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds) {
        return [SELECT Id, Person__c, Location__c 
                FROM Location_Tracing__c
                 WHERE Location__c IN :locationIds 
                    AND Person__r.Health_Status__c = 'Green' 
                    AND Visit_Date__c = LAST_N_DAYS:10];
    }

    /**
     * Get all locations for a location for the last 10 days and anyone with red health status
     * @param newLocationTraces
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newLocationTraces) {
        // Store unique location ids
        Set<Id> locationIds = new Set<Id>();
        // Store unique person Ids
        Set<Id> personIds = new Set<Id>();
        for (Location_Tracing__c trace : newLocationTraces) {
            locationIds.add(trace.Location__c);
            personIds.add(trace.Person__c);
        }

        // List to hold duplicate records
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();

        // Map Id and set<Id> of already existing records
        Map<Id, Set<Id>> mapOfExistingRecords = new Map<Id, Set<Id>>();

        // SOQL to query existing records
        List<Location_Tracing__c> existingRecords = [SELECT Id, Person__c, Location__c 
                                                    FROM Location_Tracing__c 
                                                    WHERE Location__c IN :locationIds 
                                                        AND Person__c IN :personIds];



        if (existingRecords != null && existingRecords.size() > 0) {
            for (Location_Tracing__c trace : existingRecords) {
                // Map to check for duplicates
                if (!mapOfExistingRecords.containsKey(trace.Location__c)) {
                    mapOfExistingRecords.put(trace.Location__c, new Set<Id>());
                }
                // Add person id to set
                mapOfExistingRecords.get(trace.Location__c).add(trace.Person__c);
            }

            // Loops over location records
            for (Location_Tracing__c trace : newLocationTraces) {
                // If a duplicate id is found in map, then check for person in set
                if (mapOfExistingRecords.containsKey(trace.Location__c) && 
                    mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c)) {
                    // Add duplicate record to list
                    duplicates.add(trace);
                }
            }
        }
        return duplicates;
    }
}
