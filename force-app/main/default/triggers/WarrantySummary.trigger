trigger WarrantySummary on Case (before insert) {
    for (Case myCase : Trigger.new){
        String purchaseDate = 'unknown';
        Integer warrantyDays = 0;
        Decimal warrantyPercentage = 0;
        if (myCase.Product_Purchase_Date__c != null){
          purchaseDate = myCase.Product_Purchase_Date__c.format();
          warrantyPercentage = (100 *(myCase.Product_Purchase_Date__c.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c)).setScale(2);
        }
        String createdDate = DateTime.now().format();
        if (mycase.Product_Total_Warranty_Days__c != null){
        	warrantyDays = mycase.Product_Total_Warranty_Days__c.intValue();
        }
        
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;
    
    
        myCase.Warranty_Summary__c = 'Product purchased on ' + purchaseDate
                                + ' and case created on' + createdDate + '.\n'
                                + 'Warranty is for ' + warrantyDays
                                + 'days and is ' + warrantyPercentage + '% through its warranty period.\n'
                                + 'Extended warranty: ' + hasExtendedWarranty + '\n'
                                + 'Have a nice day!';
     }
}