trigger SendContactGif on Contact (after insert, before update) {
    for (Contact myContact : Trigger.new){
        
        List <Task> contactTasks = [SELECT Status, Type, Subject, Id FROM Task WHERE WhoId = :myContact.id];
		System.Debug('contact tasks: ' + contactTasks);
        
        for (Task t : contactTasks){
            if (t.Type == 'Success Gift' && t.Status != 'Completed'){
                return;
            }
        }
        
        if (myContact.Needs_gif__c) {
            //create a related task with subject 'send gif', set status to in progress
            Task myTask = new Task();
            
            //http://api.giphy.com/v1/gifs/random?api_key=37f1ef27d7584435a6c93395e0369ed8&tag='obama'
            
            System.Debug('task id: ' + myTask.id);
            myTask.Status = 'Not Started';
            myTask.Type = 'Success Gift';
            myTask.Subject = 'Send ' + myContact.FirstName + ' a gif!';
            System.Debug('contact id: ' + myContact.id);
            myTask.WhoId = myContact.id;
                
            insert myTask;
        }
    }
}