/*
Flag Invocable Apex Methods That Make Callouts

For invocable actions that perform callouts, you can now add a callout attribute
to the invocable Apex method annotation
With this inormation, a flow calling the action knows how to manage the transaction at run time
*/

// Example:
public class FlowInputs {
    @InvocableMethod(callout=true, label='My Action Label')
    public static void myActionMethod(List<FlowInput> inputs) {
        // Code goes here
    }
}