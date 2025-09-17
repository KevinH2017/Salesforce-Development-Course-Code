/*
Queueable Apex essentially is a superset of future methods

Advantages:
- Non-primitive types
- Monitoring
- Chaining jobs
*/
public class QueueableApex implements Queueable {

    public void execute(QueueableContext context) {
        // Write asynchronous code here
        // Can also chain other queueable classes here
    }
}