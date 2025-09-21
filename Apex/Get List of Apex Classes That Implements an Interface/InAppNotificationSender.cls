public class InAppNotificationSender implements NotificationSender {
    public void sendNotification(String message, String recipient) {
        // Send an in-app notification
        System.debug('Sending in-app notification to ' + recipient + ' with message: ' + message);
    }
}