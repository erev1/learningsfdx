public class AccountCustomController {

    private final Account account;
    
    public PageReference savetheRecord() {
        update account;
        return null;
    }
    
    public AccountCustomController()
    {
        account=[select id,Name,Site from Account WHERE Id= :ApexPages.currentPage().getParameters().get('id')];
    }
    
    public Account getAccount(){
        return account;
    }
}