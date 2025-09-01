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
}