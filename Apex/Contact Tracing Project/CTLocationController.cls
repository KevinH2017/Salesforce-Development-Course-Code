/**
 * CTLocationController
 * Main controller class for locations for CT project
 * @author Kevin
 */
public with sharing class CTLocationController {

    /** Gets all recent status changes of a location, limited to 100 records
     * @return List of recent status changes
     */
    public static List<String> getRecentStatusChanges() {
        return [SELECT Id, Name, Status__c 
                FROM Location 
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
                FROM Location 
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
                FROM Location 
                WHERE Id = :locationId];
        // Return the first location or null if none found
        if (locations != null && locations.size() > 0) {
            return locations[0];
        }
        return null;
    }
}