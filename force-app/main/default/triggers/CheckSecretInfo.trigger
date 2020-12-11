trigger CheckSecretInfo on Case (after insert, before update) {
  
   Set <string> secretKeywords = new Set <string>();
   secretKeywords.add('Credit Card');
   secretKeywords.add('Social Security');
   secretKeywords.add('SSN');
   secretKeywords.add('Passport');
   secretKeywords.add('Social Security');
   
   List<Case> casesWithSecretInfo = new List<Case>();
   String mycasesubject = 'warning: parent case may contain secret info';
    
   for (Case mycase : Trigger.new){
       if (mycase.Subject != 'warning: parent case may contain secret info'){
         for (String keyword : secretKeywords){
           if (mycase.Description != null && mycase.Description.contains(keyword)){
             casesWithSecretInfo.add(myCase);
             System.debug('Case' + myCase.id + ' include secret keyword ' + keyword );
             break;
            }
          }
       }
   }
    
    for (Case caseWithSecretInfo : casesWithSecretInfo) {
        Case childCase = new Case();
        childCase.Subject = 'warning: parent case may contain secret info';
        childCase.ParentID = caseWithSecretInfo.Id;
        childCase.IsEscalated = true;
        childCase.Priority = 'High';
        childCase.Description = 'At least one of the following keywords were found: ' + secretKeywords;
        insert childCase;
    }
}