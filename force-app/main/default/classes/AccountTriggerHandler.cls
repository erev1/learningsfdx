public class AccountTriggerHandler {
    public static void handleBeforeInsert(List<Account> acclist){
        for (Account a: accList){
            a.description = 'New Description from Trigger';
            System.debug('Hello World');
        }
    }
     public static void handleAfterInsert (List<Account> accList){
         List<Task> myTask = new List<Task>();
             for (Account a : accList){
                 Task aTask = new Task();
                 aTask.ownerID = a.OwnerId;
                 aTask.Subject = 'New Account Auto Task from Trigger';
                 aTask.Priority = 'Normal';
                 aTask.whatId = a.id;
                 myTask.add(aTask);   
             }
         Insert myTask;
     }
}