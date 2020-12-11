public class NewAndExistingController {

    public Account account {get;private set;}
    
    public NewAndExistingController() {
        Id id=ApexPages.currentPage().getParameters().get('id');
        
        account = (id==null)?new Account():[select name, Phone, industry from Account where Id=:id];
    }
    
    public PageReference save (){
       try
       { 
          upsert(account);
       }
       catch(System.DMLException e)
       {
           ApexPages.addMessages(e);
           return null;
       }
       PageReference redirectSuccess= new PageReference('/apex/customControllerExample2');
       // PageReference redirectSuccess= new ApexPages.StandardController(Account).view();
       redirectSuccess.setRedirect(true);
       return redirectSuccess;
    }
}