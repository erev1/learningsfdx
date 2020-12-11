trigger AccountTrigger on Account (before insert, after insert) {
    if (Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.handleBeforeInsert(Trigger.new);
    }
    else if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerHandler.handleAfterInsert(Trigger.new);
    }
}