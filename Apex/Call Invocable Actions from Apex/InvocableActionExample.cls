/*
Invocable Action is an Apex class that allows you to call invocable actions from Apex code

This allows you to package and reuse code into building blocks that can be called from other Apex code

Documentation:
https://developer.salesforce.com/docs/atlas.en-us.api_action.meta/api_action/actions_obj_apex.htm
*/

public class InvocableActionExample {

    public void postToChatter(String recordId) {
        // Create an Invocable Action called 'chatterPost'
        Invocable.Action action = Invocable.Action.createStandardAction('chatterPost');

        // Sets parameters for the invocable action
        action.setInvocationParameter('text', 'This is an example Chatter post.');
        action.setInvocationParameter('type', 'User');
        action.setInvocationParameter('subjectNameOrId', UserInfo.getUserId());

        // Uses the action to get the feedItemId parameter of the chatter post
        List<Invocable.Action.Result> results = action.invoke();
        if (results.size() > 0 && results[0].isSuccess()) {
            System.debug('Created feed item with ID: ' +
                        results[0].getOutputParameters().get('feedItemId'));
        }
    }
}
