@isTest

private class WarrantyTest {
    @isTest static void insertCase(){
        Case myCase = new Case();
        myCase.Product_Purchase_Date__c = Date.today() - 4;
        myCase.Product_Total_Warranty_Days__c = 5;
        myCase.Product_Has_Extended_Warranty__c = true;
        myCase.OwnerId	 = '0056A000001fnF6';
        myCase.Subject = 'Test Case';        
        insert myCase;
    }
}