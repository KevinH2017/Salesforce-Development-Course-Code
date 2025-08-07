public class Covid19 {
    private Integer recoveredInArea = 0;
    public static Integer recoveredInCountry = 0;

    // Parameterized constructor to set class variables value
    public Covid19(Integer recoveredInArea) {
        // Cannot have negative treated people
        if (recoveredInArea < 0){
            this.recoveredInArea = 0;
        } else {
            this.recoveredInArea = recoveredInArea;
            recoveredInCountry += recoveredInArea;
        }
    }

    // Increments count of recoveredInArea and recoveredInCountry by 1
    public void treatPatient() {
        recoveredInArea++;
        recoveredInCountry++;
    }

    // Returns the value of recoveredInArea
    public Integer getTreated() {
        return recoveredInArea;
    }
}
