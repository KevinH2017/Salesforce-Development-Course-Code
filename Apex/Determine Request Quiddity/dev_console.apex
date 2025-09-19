/*
Detect Apex Runtime Context with RequestId and Quiddity

You can detect Apex contxt at runtime and correlate multiple logs tirggered by the request,
using RequestId and Quiddity values

Methods in the System.Request class are used to obtain the RequstId and Quiddty of the current
Salesforce request

The Request ID and Quiddity values can be used to effectively correlate logs:

    - The Request ID is universally unique and is captured in the debug logs triggered by the request
    - The Request ID and Quiddity values are the same as in the event log files of the Apex Execution event type used in Event Monitoring


Request.getQuiddity() returns an ENUM of Quiddity type

ENUMS are abstract data types that represent a group of named constants
https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_enums.htm

*/

QuiddityExample.logMessage('Test logs');