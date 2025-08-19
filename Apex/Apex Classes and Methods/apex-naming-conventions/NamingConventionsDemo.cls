public class NamingConventionsDemo {
    // Variable names should be written in camelCase
    // Always give meaningful name to variables
    public String employeeFirstName;
    public String employeeLastName;
    String superSecretKey = 'Secret_Key';

    // Constants should be written in CAPITAL_CASE
    final String FINAL_STRING_VARIABLE = 'CONSTANT_STRING';

    // Method names should be written in camelCase
    public void myFirstMethod() {
        System.debug('superSecretKey: ' + superSecretKey);
        System.debug('FINAL_STRING_VARIABLE: ' + FINAL_STRING_VARIABLE);
    }
}
