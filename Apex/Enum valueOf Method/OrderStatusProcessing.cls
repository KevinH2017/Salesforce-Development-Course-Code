/*
The valueOf() method converts a specified string to an enum constant value

An exception is thrown if the input string doesn't match an enum value

The enum holds values that are defined in the enum class Season,
and the string currentSeasonInput is converted to the enum value and 
assigned to the variable currentSeason

Example:

public enum Season {WINTER, SPRING, SUMMER, FALL}

string currentSeasonInput = 'winter';
Season currentSeason = Season.valueOf(currentSeasonInput);
*/

public with sharing class OrderStatusProcessing {
    // Enum holds a list of possible string values
    public enum OrderStatus {
        PROCESSING,
        SHIPPED,
        DELIVERED,
        CANCELLED
    }

    public void processStatus(String status) {
        // for (OrderStatus os : OrderStatus.values()) {
        //     if (os.name() == status) {
        //         // Code to process the order status goes here
        //         System.debug('os: ' + os);
        //     }
        // }

        // Gets the enum value from the string, this is much more efficient than the for loop above
        System.debug('Order Status: ' + OrderStatus.valueOf(status));
    }
}
