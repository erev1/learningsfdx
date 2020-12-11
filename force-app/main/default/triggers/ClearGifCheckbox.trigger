trigger ClearGifCheckbox on Task (before update) {
    for(Task myTask : Trigger.new){
        if (myTask.subject.contains('gif') && myTask.Status == 'Completed'){
            List <Contact> taskContact = [SELECT Id, Name FROM Contact WHERE Id = :myTask.WhoId];
            System.Debug('contacts from query: ' + taskContact);
            for (Contact myContact : taskContact){
                myContact.Needs_gif__c = false;
                update mycontact;
            }
        }
        
    }

}