// Creates new instance
LeadQueueable leadQueueableInstance = new LeadQueueable();

// Enque job for processing
Id jobId = System.enqueueJob(leadQueueableInstance);