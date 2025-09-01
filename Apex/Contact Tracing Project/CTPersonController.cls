/**
 * CTPersonController
 * Main controller class for CT project
 * @author Kevin
 */
public with sharing class CTPersonController {

    /** Generates a unique hash using md5 algorithm using Crypto.generateDigest to generate a one-way hash
     * @param mobile The mobile number to hash
     * @return String token
     */
    public static String getToken(String mobile) {
        Blob hash = Crypto.generateDigest('MD5', Blob.valueOf(mobile));
        // Converts hash to string
        return EncodingUtil.base64Encode(hash);
    }

    /** Gets all recent health changes of a person, limited to 100 records
     * @return List of recent health changes
     */
    public static List<String> getRecentHealthChanges() {
        return [SELECT Id, Name, Health_Status__c 
                FROM Person 
                ORDER BY Status_Update_Date__c DESC 
                LIMIT 100];
    }

    /** Searches for people based on a search term
     * @param searchTerm The term to search for (Name, Mobile, or Token)
     * @return List of matching people
     */
    public static List<String> searchPeople(String searchTerm) {
        // Prepares the search term for wildcard search
        searchTerm = '%' + searchTerm + '%';
        return [SELECT Id, Name, Health_Status__c 
                FROM Person 
                WHERE Name LIKE :searchTerm 
                    OR Mobile LIKE :searchTerm 
                    OR Token LIKE :searchTerm 
                ORDER BY Status_Update_Date__c DESC 
                NULLS LAST];
    }

    /** Gets a person by their ID
     * @param personId The ID of the person to retrieve
     * @return Returns the first matching person or null
     */
    public static String getPersonById(String personId) {
        List<String> people = [SELECT Id, Name, Health_Status__c 
                FROM Person 
                WHERE Id = :personId];
        // Return the first person or null if none found
        if (people != null && people.size() > 0) {
            return people[0];
        }
        return null;
    }

    /** Gets the count of people in each health status
     * @return Map of health status and their respective counts
     */
    public static Map<String, Integer> getHealthStatusCount() {
        // Map to store health status counts
        Map<String, Integer> statusCountMap = new Map<String, Integer>();
        // Query Person records to find number of people in each health status and puts them into the map
        for (AggregateResult result : [SELECT Health_Status__c, COUNT(Id) total
                                        FROM Person 
                                        GROUP BY Health_Status__c]) {
            // Uses type casting
            statusCountMap.put(
                (String)result.get('Health_Status__c'), 
                (Integer)result.get('total'));   
        }
        return statusCountMap;
    }

}