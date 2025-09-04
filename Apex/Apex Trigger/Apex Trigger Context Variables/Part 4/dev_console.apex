// Insert single lead and multiple leads to test trigger context variables

// Insert single lead
Lead newLead = new Lead(LastName='Test Lead Single', Status='Open - Not Contacted', Company='Single Lead Company', Industry='Finance');

System.debug('Trigger size: '+ Trigger.size);
System.debug('Is trigger executing: '+ Trigger.isExecuting);
System.debug('Trigger operation type: '+ Trigger.operationType);
insert newLead;


// Insert multiple leads
List<Lead> multipleLeads = new List<Lead>();

for(Integer i=0; i<10; i++){
    multipleLeads.add(new Lead(LastName='Test Lead Multiple', Status='Open - Not Contacted', Company='Multiple Lead Company', Industry='Finance'));
}

System.debug('Trigger size: '+ Trigger.size);
System.debug('Is trigger executing: '+ Trigger.isExecuting);
System.debug('Trigger operation type: '+ Trigger.operationType);
insert multipleLeads;
