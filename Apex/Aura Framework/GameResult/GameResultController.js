({
    doInit : function(component, event, helper) {
        // Initializes columns
        const columns = [
            {label : 'Game Number', fieldName : 'Name', type : 'text'},
            {label : 'Mode', fieldName : 'Mode__c', type : 'text'},
            {label : 'Played On', fieldName : 'CreatedDate', type : 'date'},
            {label : 'Result', fieldName : 'Result__c', type : 'text'}
        ];
        component.set('v.columns', columns);

        // Get history of game results
        helper.fetchResult(component);
    },

    onResultHandler : function(component, event, helper) {
        // Get previous results immediately after completing a game
        helper.fetchResult(component);
    }
})