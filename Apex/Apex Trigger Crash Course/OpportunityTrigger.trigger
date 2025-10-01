trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update) {

    switch on Trigger.operationType {
        // Runs BEFORE insert and BEFORE update
        when BEFORE_INSERT, BEFORE_UPDATE {
            // Change the NextStep for an Opportunites that are 'Closed Won' to 'Onboard a Contract'
            for (Opportunity opp : Trigger.new) {
                if (opp.StageName == 'Closed Won') {
                    opp.NextStep = 'Onboard a Contract';
                }
            }
        }

        // Runs AFTER insert and AFTER update
        when AFTER_INSERT, AFTER_UPDATE {
            // List to hold tasks to be inserted
            List<Task> tasks = new List<Task>();
            // Creates tasks for Opportunities that are 'Closed Won'
            for (Opportunity opp : Trigger.new) {
                if (opp.StageName == 'Closed Won') {
                    Task engage = new Task();
                    engage.whoId = opp.Id;
                    engage.Subject = 'Engage with customer';
                    tasks.add(engage);

                    Task welcomeCall = new Task();
                    welcomeCall.whoId = opp.Id;
                    welcomeCall.Subject = 'Welcome Call';
                    tasks.add(welcomeCall);

                    Task thankYouEmail = new Task();
                    thankYouEmail.whoId = opp.Id;
                    thankYouEmail.Subject = 'Send Thank You Email';
                    tasks.add(thankYouEmail);
                }
            }
            // Insert list of tasks
            insert tasks;
        }
    }
}