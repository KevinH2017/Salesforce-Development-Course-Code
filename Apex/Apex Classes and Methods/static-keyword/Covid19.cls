// Must be declared in its own cls file
public class Covid19 {
    //static variable
    public static Integer recoveredInCountry = 0;
    public Integer recoveredInArea = 0;

    public void treatPatient(){
        recoveredInArea++;
        recoveredInCountry++;
    }

    // static method
    public static void printTreated(){
        System.debug('Recovered in country : '+ recoveredInCountry);
    }
}