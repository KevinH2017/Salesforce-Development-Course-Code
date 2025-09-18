LeadQueueable lq = new LeadQueueable();
Integer delayInMinutes = 2;         // 2 minuntes delay, can be 0-10 minutes
System.debug('Enqueuing job for processing in ' + delayInMinutes + ' minutes at ' + Datetime.now());
// Job is put into queue for processing and will be processed after the delay
System.enqueueJob(lq);
// Default minimum enqueque delay can be changed in Settings --> Apex Settings
