LeadBatch leadBatchInstance = new LeadBatch();

// Executes batch with batch size 50
Database.executeBatch(leadBatchInstance, 50);

// Executes batch with batch size 2000
Database.executeBatch(leadBatchInstance, 2000);

// Executes batch with default batch size (200)
Database.executeBatch(leadBatchInstance);
