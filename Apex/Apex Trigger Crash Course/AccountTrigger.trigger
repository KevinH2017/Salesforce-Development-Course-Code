trigger AccountTrigger on Account (before insert, after insert, before update, after update) {

    switch on Trigger.operationType {
        when AFTER_UPDATE {
            if (!AccountTriggerHandler.afterUpdateAlreadyxecuted) {
                AccountTriggerHandler.afterUpdateAlreadyxecuted = true;
                new AccountTriggerHandler.afterUpdateHandler(Trigger.new);
            }
        }
    }
}