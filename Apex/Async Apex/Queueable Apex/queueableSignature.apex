/*
Ensuring that duplicate queueable jobs aren't being enqueued can help reduce resource conflicts and race conditions
by enqueuing only a single instance of your async Queueable job based on the signature

Signatures can be built using the QueueableDuplicateSignature.Builder class
They must be unique and can be built using a combination of Ids(including SOQL queries), Strings, and Integers(using hashCode)

Attempting to add more than one Queueable job to the processing queue with the same signature will result in an Exception being thrown
on enqueue for the subsequent jobs
*/

// Below builds the async job signature with UserId and the string 'MyQueueable'
AsyncOptions options = new AsyncOptions();

// Set the signature for the queueable job
options.DuplicateSignature = QueueableDuplicateSignature.Builder()
                                .addId(UserInfo.getUserId())
                                .addString('MyQueueable')
                                .build();

// Enqueue the job with signature
try {
    System.enqueueJob(new MyQueueable(), options);
} catch (DuplicateMessageException ex) {
    // Exception is thrown if there is already an enqueued job with the same signature
    Assert.areEqual('Attempt to enqueue job with duplicate queueable signature',
        ex.getMessage());
}

// You can build an async job signature using ApexClass Id and the hash value of an SObject
// Below enqueues another job with a different signature using a hash with the account Id using SOQL
Account someAccount = [SELECT Id FROM Account LIMIT 1];
AsyncOptions options2 = new AsyncOptions();
options2.DuplicateSignature = QueueableDuplicateSignature.Builder()
                                .addInteger(System.hashCode(someAccount))
                                .addId([SELECT Id FROM ApexClass 
                                     WHERE Name='MyQueueable'].Id)
                                .build();

// Enqueue the job with signature
System.enqueueJob(new MyQueueable(), options2);