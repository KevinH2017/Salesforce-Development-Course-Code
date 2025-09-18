SampleScheduler sampleScheduler = new sampleScheduler();

/*
    CRON Expression, when to run the job:

    'Seconds Minutes Hours Day of Month Month Day of Week Year(Optional)'
    Can take special characters:
    '?' = No specific value
    '*' = Any value
    ',' = Multiple values
    '-' = Range of values
    '/' = Incremental values
    'L' = Last day of the month
    'W' = Nearest weekday
    '#' = Nth weekday of the month
    Year is optional but must be between 1970-2099 or null

    Hours are 0-23
    Minutes are 0-59
    Seconds are 0-59

    EX:
    0 0 13 * * ? = Run at 1:00 PM every day

    0 0 10 ? * MON-FRI = Run at 10:00 AM every weekday
*/
String cronExp = '00 30 8 1 * ?';   // 00 30 8 1 * ? = Run at 8:30 AM on the 1st day of every month

// Param 1: Job name
// Param 2: CRON Expression
// Param 3: Object implementing Schedulable interface
String jobId = System.schedule('Merge Job', cronExp, sampleScheduler);

// Jobs can be found in Setup --> Scheduled Jobs