PizzaRates pizzaCosts = new PizzaRates();

Integer rossSlices = 3;
Integer chandlerSlices = 1;
Integer joeySlices = 4;

Integer rossPay = pizzaCosts.getSliceCost(rossSlices);
Integer chandlerPay = pizzaCosts.getSliceCost(chandlerSlices);
Integer joeyPay = pizzaCosts.getSliceCost(joeySlices);

System.debug('Ross has to pay: $' + rossPay);
System.debug('Chandler has to pay: $' + chandlerPay);
System.debug('Joey has to pay: $' + joeyPay);

Integer total = rossPay + chandlerPay + joeyPay;
System.debug('Total: $' + total);