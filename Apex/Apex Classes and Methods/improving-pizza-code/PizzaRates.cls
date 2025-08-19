public class PizzaRates {
    final Integer ONE_SLICE = 8;
    final Integer TWO_TO_THREE_SLICES = 7;
    final Integer MORE_THAN_THREE_SLICES = 6;

    public Integer getSliceCost(Integer numberOfSlices) {
        Integer totalPay = numberOfSlices == 1 ? ONE_SLICE*numberOfSlices : 
    (numberOfSlices <= 3 ? TWO_TO_THREE_SLICES*numberOfSlices :
    MORE_THAN_THREE_SLICES*numberOfSlices);
        return totalPay;
    }
}