LeadSchedulable leadSchedulableInstance = new LeadSchedulable();

String cronExp = '00 30 3 ? * MON';     // 00 30 3 ? * MON = Run at 3:30 AM every Monday

// Param 1: Job name
// Param 2: CRON Expression
// Param 3: Object implementing Schedulable interface
String jobId = System.schedule('Sample Job', cronExp, leadSchedulableInstance);

System.debug(jobId);