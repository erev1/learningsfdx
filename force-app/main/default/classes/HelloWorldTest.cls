@isTest

private class HelloWorldTest {
    @isTest static void updateLead(){
        Lead myLead = new Lead();
        myLead.FirstName = 'Eneida';
        myLead.Lastname = 'Revueltas';
        myLead.Company = 'FCI';
        insert mylead;
        
        Id stdPriceBookRecId = Test.getStandardPricebookId();
        System.debug('stdPriceBookRecId' + stdPriceBookRecId );
        
        myLead.Company = 'Acme';
        update myLead;
    }
}