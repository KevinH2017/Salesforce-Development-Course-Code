/*
Maximum Depth of Chained Queueable Jobs

With this feature, you can set a maximum stack depth of Queueable jobs, overriding the default limit
This is a useful safety feature to prevent runaway recursive jobs from consuimg daily async Apex limits

You can test chained queueables using appropriate stack depths, but be aware of Apex governor limits

These methods in the System.AsyncInfo class help to determine the current and maximum stack depths to get the minimum queueable delay:

    getCurrentQueueableStackDepth()
        - Get the current queueable stack depth for queueable transactions

    getMaximumQueueableStackDepth()
        - Get the maximum queueable stack depth for queueable transactions

    getMinimumQueueableDelayInMinutes()
        - Get the minimum queueable delay for queueable transactions (in minutes)

    hasMaxStackDepth()
        - Determine if maximum stack depth is set for your queueable requests

Link to AsyncInfo Class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_System_AsyncInfo.htm
*/
// Fibonacci
public class FibonacciDepthQueueable implements Queueable {
   
    private long nMinus1, nMinus2;
       
    public static void calculateFibonacciTo(integer depth) {
        AsyncOptions asyncOptions = new AsyncOptions();
        asyncOptions.MaximumQueueableStackDepth = depth;
        System.enqueueJob(new FibonacciDepthQueueable(null, null), asyncOptions);
    }
       
    private FibonacciDepthQueueable(long nMinus1param, long nMinus2param) {
        nMinus1 = nMinus1param;
        nMinus2 = nMinus2param;
    }
   
    public void execute(QueueableContext context) {

       // Get current stack depth
        integer depth = AsyncInfo.getCurrentQueueableStackDepth();
       
        // Calculate step
        long fibonacciSequenceStep;
        switch on (depth) {
            when 1, 2 {
                fibonacciSequenceStep = 1;
            }
            when else {
                fibonacciSequenceStep = nMinus1 + nMinus2;
            }
        }
       
        System.debug('Depth: ' + depth + ' fibonacciSequenceStep: ' + fibonacciSequenceStep);
       
        // Check if it reached maximum stack depth
        // If so, insert result into database
        // Otherwise, enqueue next job
        if(System.AsyncInfo.hasMaxStackDepth() &&
           AsyncInfo.getCurrentQueueableStackDepth() >= 
           AsyncInfo.getMaximumQueueableStackDepth()) {
            // Reached maximum stack depth
            Fibonacci__c result = new Fibonacci__c(
                Depth__c = depth,
                Result__c = fibonacciSequenceStep
                );
            insert result;
        } else {
            System.enqueueJob(new FibonacciDepthQueueable(fibonacciSequenceStep, nMinus1));
        }
    }
}