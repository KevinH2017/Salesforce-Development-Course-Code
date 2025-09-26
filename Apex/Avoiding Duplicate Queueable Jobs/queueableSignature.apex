/*
Ensure that Duplicate Queueable Jobs Aren't Enqueued

Reduce resource contention and race conditions by Enqueuing only a single instance of the asyn Queueable job based on its signature

When attempting to add more than one Queueable job to the processing queue with the same signature will result in an exception
on enqueue for the subsequent jobs
*/

// Example of Building an async job signature:
// AsyncOptions options = new AsyncOptions();

// options.DuplicateSignature = QueueableDuplicateSignature.Builder()
//                                 .addInteger(System.hashCode(someAccount))
//                                 .addId([SELECT Id FROM ApexClass 
//                                      WHERE Name='MyQueueable'].Id)
//                                 .build();
                                
// System.enqueueJob(new MyQueueable(), options);

AsyncOptions options = new AsyncOptions();

options.DuplicateSignature = QueueableDuplicateSignature.Builder()
                                .addId(UserInfo.getUserId())
                                .addString('LeadQueueable')
                                .build();

// First time enqueuing job
System.enqueueJob(new LeadQueueable(), options);

// Second time enqueuing job with same signature
// System.enqueueJob(new LeadQueueable(), options);

// Added integer to below queueable signature
options.DuplicateSignature = QueueableDuplicateSignature.Builder()
                                .addId(UserInfo.getUserId())
                                .addString('LeadQueueable')
                                .addInteger(1)
                                .build();

// Enqueuing same job with a different signature
System.enqueueJob(new LeadQueueable(), options);
