// @isTest is required to use test functions (System.assert*)
@isTest
public class Covid19Test {

    // Test method for treatPatient(), method must be BOTH static and void
    @isTest
    public static void treatPatientTest() {
        // Creates new instance of Covid19 class with input 10
        Covid19 jaipur = new Covid19(10);

        Integer treated = jaipur.getTreated();
        // Checks if treated variable is 10 or not
        System.assertEquals(10, treated, 'Treated count does not match');

        // Creates new instance of Covid19 class with input 112
        Covid19 hyd = new Covid19(112);

        treated = hyd.getTreated();
        // Checks if treated variable is 112 or not
        System.assertEquals(112, treated, 'Treated count does not match');

        // Checks if count of recoveredInCountry is 122 or not
        System.assertEquals(122, Covid19.recoveredInCountry, 'Treated count does not match');

        jaipur.treatPatient();
        treated = jaipur.getTreated();
        System.assert(treated == 11, 'Treated count does not match');
        System.assert(Covid19.recoveredInCountry == 123, 'Treated count does not match');
    }
    
    @isTest
    public static void getTreatedTestNegative() {
        // Creates new instance of Covid19 class with input -10
        Covid19 jaipur = new Covid19(-10);
        
        Integer treated = jaipur.getTreated();
        // Checks if getTreated can return the correct value if it is 0 and not negative (cannot have negative treated people)
        System.assertEquals(0, treated, 'Treated count does not match');
    }
}
