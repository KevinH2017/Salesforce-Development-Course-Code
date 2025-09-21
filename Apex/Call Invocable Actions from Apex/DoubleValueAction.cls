public class DoubleValueAction {

    // Wrapper class for input
    public class InputWrapper {
        @InvocableVariable(required=true)
        public Double inputValue;
    }

    // Wrapper class for output
    public class OutputWrapper {
        @InvocableVariable
        public Double doubledValue;
    }

    // Invocable method that doubles the input
    @InvocableMethod(label='Double Value' description='Doubles the input value')
    public static List<OutputWrapper> doubleIt(List<InputWrapper> inputs) {
        List<OutputWrapper> results = new List<OutputWrapper>();
        for (InputWrapper input : inputs) {
            OutputWrapper output = new OutputWrapper();
            output.doubledValue = input.inputValue * 2;
            results.add(output);
        }
        return results;
    }
}
