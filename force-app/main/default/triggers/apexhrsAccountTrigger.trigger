trigger apexhrsAccountTrigger on Account (before insert, before update, after update) {
    if(Trigger.isBefore && Trigger.isInsert){
        system.debug('account created');
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            for(Account acc: Trigger.new){
                System.Debug('New name'+ acc.Name);
                System.debug('Old name' + Trigger.OldMap.get(acc.id).Name);
            }
            System.Debug('I am in a before update context');
        }
        if(Trigger.isAfter){
            System.Debug('I am in After update context');
        }
    }
}