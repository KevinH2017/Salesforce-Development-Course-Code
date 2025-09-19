public with sharing class QuiddityExample {

    public static void logMessage(String message) {
        // Get the current request's quiddity
        Quiddity quiddity = Request.getCurrent().getQuiddity();

        // Log the message based on the quiddity's context
        switch on quiddity {
            when ANONYMOUS {
                System.debug('Executing anonymous Apex. Log: ' + message);
            }

            when SYNCHRONOUS {
                System.debug('Executing SYNCHRONOUS Apex. Log: ' + message);
            }
        }
    }
}