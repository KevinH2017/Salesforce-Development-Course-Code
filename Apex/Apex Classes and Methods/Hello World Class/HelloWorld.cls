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
