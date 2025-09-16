public with sharing class CTLocationController {
    
    /** 
     * Get last 100 locations with recent health status change in descending order, nulls last
     * @return List<Location__c>
     */
    public static List<Location__c> getRecentStatusChanges() {
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
                FROM Location__c 
                ORDER BY Status_Update_Date__c DESC 
                NULLS LAST 
                LIMIT 100];
    }

    /**
     * Search a location by name, pincode or address in descending order, nulls last
     * @param searchTerm
     * @return List<Location__c>
     */
    public static List<Location__c> searchLocations(String searchTerm) {
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
                FROM Location__c 
                WHERE Name LIKE :searchTerm 
                    OR Pincode__c LIKE :searchTerm
                    OR Address__c LIKE :searchTerm
                ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }

    /**
     * Get a location by id
     * @param locationId
     * @return List<Location__c>[0]
     */
    public static Location__c getLocationById(String locationId) {
        List<Location__c> locations = [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
                                        FROM Location__c 
                                        WHERE Id =: locationId];
        // Returns location if found, else return null
        if(locations != null && locations.size() > 0){
            return locations[0];
        }
        return null;
    }

    /**
     * Update red score for locations
     * @param locationIds
     */
    public static void updateRedScore(Set<Id> locationIds) {
        List<Location__c> locationToUpdate = new List<Location__c>();
        // Aggregate query to get red status per location
        AggregateResult[] redPeoplePerLocation = [SELECT Location__c, COUNT(Id) total FROM Location_Tracing__c
                                                    WHERE Person__r.Health_Status__c = 'Red'
                                                        AND Visit_Date__c = LAST_N_DAYS :10
                                                        AND Location__c IN : locationIds
                                                    GROUP BY Location__c];

                // Iterate over aggregate results and update red score for each location
                for (AggregateResult ar : redPeoplePerLocation) {
                    String locationId = String.valueOf(ar.get('Location__c'));
                    Integer redScore = Integer.valueOf(ar.get('total'));
                    String status = getStatus(redScore);
                    locationToUpdate.add(new Location__c(Id=locationId, Red_Score__c=redScore, Status__c=status));
                }

                // Update red score for locations
                if (locationToUpdate != null && locationToUpdate.size() > 0) {
                    update locationToUpdate;
                }
    }

    /**
     * Get health status based on red score
     * @param redScore
     * @return String
     */
    public static String getStatus(Integer redScore) {
        // Determines health status based on redScore
        if (redScore == 0) {
            return 'Green';
        } else if(redScore <= 5){
            return 'Yellow';
        } else if(redScore <= 10){
            return 'Orange';
        } else{
            return 'Red';
        }
    }

    /**
     * Get health status count
     * @return Map<String, Integer>
     */
    public static Map<String, Integer> getHealthStatusCount() {
        // Aggregate query to get health status count by health status
        AggregateResult[] healthCountMap = [SELECT Status__c, Count(Id) total FROM Location__c GROUP BY Status__c];

        // Returns health status count as map if found, else return null
        if (healthCountMap != null && healthCountMap.size() > 0) {
            Map<String, Integer> result = new Map<String, Integer>();
            for (AggregateResult ar : healthCountMap) {
                result.put(String.valueOf(ar.get('Status__c')), Integer.valueOf(ar.get('total')));
            }
            return result;
        }
        return null;
    }
}
