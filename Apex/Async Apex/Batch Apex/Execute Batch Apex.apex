// To execute a batch class
SampleBatchClass batchInstance = new;
SampleBatchClass();

// Executes batch with batch size 50
// Param 1: Batch instance
// Param 2: Optional scope parameter
// Scope value must be greater than 0 and can be max 2000, default value is 200
Id batchJobId = Database.executeBatch(batchInstance, 50);

// Schedule batch
// Param 1: Batch instance
// Param 2: Batch job name
// Param 3: Minutes from NOW (always defined in minutes)
String cronID = System.scheduleBatch(batchInstance, 'My Sample Job', 30);
