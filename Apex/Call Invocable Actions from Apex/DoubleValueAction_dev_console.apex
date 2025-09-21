List<DoubleValueAction.InputWrapper> inputList = new List<DoubleValueAction.InputWrapper>();
DoubleValueAction.InputWrapper input = new DoubleValueAction.InputWrapper();
input.inputValue = 7.5;
inputList.add(input);

List<DoubleValueAction.OutputWrapper> resultList = DoubleValueAction.doubleIt(inputList);
System.debug('Doubled value: ' + resultList[0].doubledValue);
