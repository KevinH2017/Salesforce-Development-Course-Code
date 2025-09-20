/*
Sends a desktop and/or mobile notification to a user

Desktop nofitications are sent to the desktop's notification tray

Mobile notifications are sent as an in-app and push notification to enabled supported apps

User permissions are required to view notifications types and to create and edit notification types

Notifications can sent from a process and the recipient can be a single user or a group of users
based on a query, such as their Id, account, or owner field from a record

CustomNotification allows two approaches to creating and configuring a custom notification

    1. Create an instance with the default constructor, and then set notification attributes using the various setter methods
    2. Create an instance and configure notification parameters at the same time using the parameterized constructor
*/

// Get the Id for our custom notification type
// Has to be an existing DeverloperName
CustomNotificationType notificationType = [
                            SELECT Id, DeveloperName
                            FROM CustomNotificationType
                            WHERE DeveloperName='enablement_coaching_feedback_ready'
                            ];
                            
// Create a new custom notification
Messaging.CustomNotification notification = new Messaging.CustomNotification();

// Set the contents for the notification
notification.setTitle('Apex Custom Notification 09-20-2025');
notification.setBody('The notifications are coming from INSIDE the Apex!');

// Set the notification type and target
notification.setNotificationTypeId(notificationType.Id);
notification.setTargetId(UserInfo.getUserId());

// Set of recipients to send the notification to
Set<String> recipientsIds = new Set<String>();
recipientsIds.add(UserInfo.getUserId());

// Send the notification to target recipients
try {
    notification.send(recipientsIds);
}
catch (Exception e) {
    System.debug('Problem sending notification: ' + e.getMessage());
}
