// Create class in Salesforce Setup
public class ParametersTest {
    
    // Generic method to print any message
    public void printMessage(String msg) {
        System.debug(msg);
    }

    // Takes dayNumber and returns the name of the day
    public String getDay(Integer dayNumber) {
        String dayString = '';

        switch on dayNumber {
            when 0 {
                return 'Monday';
            }
            when 1 {
                return 'Tuesday';
            }
            when 2 {
                return 'Wednesday';
            }
            when 3 {
                return 'Thursday';
            }
            when 4 {
                return 'Friday';
            }
            when 5 {
                return 'Saturday';
            }
            when 6 {
                return 'Sunday';
            }
            when else {
                dayString = 'Invalid day number.';
            }
        }
        return dayString;
    }
    
    // Polymorphic method that takes String dayAbbreviation and returns the day number
    public String getDay(String dayAbbreviation) {
        String dayString = '';

        switch on dayAbbreviation {
            when 'Sun' {
                dayString = 'Sunday';
            }
            when 'Mon' {
                dayString = 'Monday';
            }
            when 'Tue' {
                dayString = 'Tuesday';
            }
            when 'Wed' {
                dayString = 'Wednesday';
            }
            when 'Thu' {
                dayString = 'Thursday';
            }
            when 'Fri' {
                dayString = 'Friday';
            }
            when 'Sat' {
                dayString = 'Saturday';
            }
            when else {
                dayString = 'Invalid day abbreviation.';
            }
        }
        return dayString;
    }
}
