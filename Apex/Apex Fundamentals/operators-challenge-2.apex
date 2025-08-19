// Operators Challenge
// Pizza Rates:
// 1 slice = $8/slice; 2-3 slices = $7/slice; >3 slices = $6/slice
// Ross = 3 slices; Chandler = 1 slice; Joey = 4 slices
final Integer ONE_SLICE = 8;
final Integer TWO_TO_THREE_SLICES = 7;
final Integer MORE_THAN_THREE_SLICES = 6;

Integer numberOfSlices = 0;

// Ross's amount to pay
numberOfSlices = 3;
Integer rossPay = numberOfSlices == 1 ? ONE_SLICE*numberOfSlices : 
    (numberOfSlices <= 3 ? TWO_TO_THREE_SLICES*numberOfSlices :
    MORE_THAN_THREE_SLICES*numberOfSlices);
System.debug('Ross has to pay: $' + rossPay);

// Chandler's amount to pay
numberOfSlices = 1;
Integer chandlerPay = numberOfSlices == 1 ? ONE_SLICE*numberOfSlices : 
    (numberOfSlices <= 3 ? TWO_TO_THREE_SLICES*numberOfSlices :
    MORE_THAN_THREE_SLICES*numberOfSlices);
System.debug('Chandler has to pay: $' + chandlerPay);

// Joey's amount to pay
numberOfSlices = 4;
Integer joeyPay = numberOfSlices == 1 ? ONE_SLICE*numberOfSlices : 
    (numberOfSlices <= 3 ? TWO_TO_THREE_SLICES*numberOfSlices :
    MORE_THAN_THREE_SLICES*numberOfSlices);
System.debug('Joey has to pay: $' + joeyPay);

Integer total = rossPay + chandlerPay + joeyPay;
System.debug('Total: $' + total);