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

// Execute in Anonymous Apex Window:
// Initializes ParametersTest class to variable parametersTest
ParametersTest parametersTest = new ParametersTest();

parametersTest.printMessage('Hello World!');
parametersTest.printMessage('This is my generic message method.');
parametersTest.printMessage('Good Morning');

System.debug(parametersTest.getDay(0));
System.debug(parametersTest.getDay(1));
System.debug(parametersTest.getDay(4));
System.debug(parametersTest.getDay(10));        // Invalid day number

System.debug(parametersTest.getDay('Sun'));
System.debug(parametersTest.getDay('Tue'));
System.debug(parametersTest.getDay('Sat'));
System.debug(parametersTest.getDay('asdf'));    // Invalid day abbreviation 