/**
 * CTLocationController
 * Main controller class for locations for CT project
 * @author Kevin
 */
public with sharing class CTLocationController {

    /** Gets all recent status changes of a Location_Tracing__c, limited to 100 records
     * @return List of recent status changes
     */
    public static List<String> getRecentStatusChanges() {
        return [SELECT Id, Name, Status__c 
                FROM Location_Tracing__c 
                ORDER BY Status_Update_Date__c DESC 
                LIMIT 100];
    }

    /** Searches for locations based on a search term
     * @param searchTerm The term to search for (Name, PinCode, or Address)
     * @return List of matching locations
     */
    public static List<String> searchLocations(String searchTerm) {
        // Prepares the search term for wildcard search
        searchTerm = '%' + searchTerm + '%';
        return [SELECT Id, Name, Status__c 
                FROM Location_Tracing__c 
                WHERE Name LIKE :searchTerm 
                    OR PinCode LIKE :searchTerm 
                    OR Address LIKE :searchTerm 
                ORDER BY Status_Update_Date__c DESC 
                NULLS LAST];
    }

    /** Gets a location by its ID
     * @param locationId The ID of the location to retrieve
     * @return Returns the first matching location or null
     */
    public static String getLocationById(String locationId) {
        List<String> locations = [SELECT Id, Name, Status__c 
                FROM Location_Tracing__c 
                WHERE Id = :locationId];
        // Return the first location or null if none found
        if (locations != null && locations.size() > 0) {
            return locations[0];
        }
        return null;
    }

    public static void updateRedScore(Set<Id> locationIds) {
        List<Location__c> locationToUpdate = new List<Location__c>();
        // Query for the number of red people per location
        AggregateResult[] redPeoplePerLocation = [
            SELECT Location__c, COUNT(Id) total
            FROM Location_Tracing__c 
            WHERE Person__r.Health_Status__c = 'Red'
                AND Visit_Date__c = LAST_N_DAYS:10
                AND Location__c IN :locationIds
            GROUP BY Location__c];
        
        // Gets the location ID and red score for each location
        for (AggregateResult ar : redPeoplePerLocation) {
            String locationId = (String)ar.get('Location__c');
            Integer redScore = (Integer)ar.get('total');
            String status = getStatus(redScore);
            locationToUpdate.add(new Location__c(Id=locationId, Red_Score=redScore, Status__c=status));
        }

        // Updates locations if there are any
        if (locationToUpdate != null && locationToUpdate.size() > 0) {
            update locationToUpdate;
        }
    }

    public static String getStatus(Integer redScore) {
        // Returns status based on red score
        if (redScore == 0) {
            return 'Green';
        } else if (redScore <= 5) {
            return 'Yellow';
        } else if (redScore <= 10) {
            return 'Orange';
        } else {
            return 'Red';
        }
    }
}