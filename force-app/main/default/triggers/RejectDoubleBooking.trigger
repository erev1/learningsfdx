trigger RejectDoubleBooking on Session_Speaker__c (before insert, before update) {
        for(Session_Speaker__c sessionSpeaker : trigger.new){
            //grab session information including session date
            Session__c session = [SELECT Id, Session_Date__c FROM Session__c
                                 WHERE Id = :sessionSpeaker.Session__c];
            
            //create a list of conflicts
            List<Session_Speaker__c> conflicts = [SELECT Id FROM Session_Speaker__c
                                                 WHERE Speaker__c = :sessionSpeaker.Speaker__c 
                                                  AND Session__r.Session_Date__c = :session.Session_Date__c];
            
            //if conflicts found, add an error
            if(!conflicts.isEmpty()){
                sessionSpeaker.addError('The speaker is already booked at that time');
            }
        }
}