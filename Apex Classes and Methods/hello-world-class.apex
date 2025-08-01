// Create class in Salesforce Setup
public class HelloWorld {
    // private cannot be accessed outside of class
    private String greeting = 'Hello World';
    // public can be accessed outside of class
    public String publicGreeting = 'My public greeting var';

    public void printGreeting() {
        System.debug(greeting);
    }

    public void printPublicGreeting() {
        System.debug(publicGreeting);
    }
}

// Execute in Anonymous Apex Window:
// Initializes HelloWorld class to variable firstClass
HelloWorld firstClass = new HelloWorld();

firstClass.printGreeting();
firstClass.printPublicGreeting();

// Directly accessing private variables throws error; Variable is not visible: HelloWorld.greeting
// System.debug(firstClass.greeting);

// Directly accessing public variables works
System.debug('Public string variable: ' + firstClass.publicGreeting);