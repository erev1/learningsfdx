@isTest

private class DedupeTest {
    @isTest static void insertAccount(){
        Account myAccount = new Account();
        myAccount.OwnerId	 = '0056A000001fnF6';
        myAccount.Name = 'Acme';        
        insert myAccount;
    }
}