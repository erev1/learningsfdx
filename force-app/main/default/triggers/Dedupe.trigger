trigger Dedupe on Account (after insert) {
    for (Account acc: Trigger.new){
        Case c      = new Case();
        c.Subject   = 'dedupe this account';
        c.OwnerID   = '0056A000001fphH';
        c.AccountID = acc.ID;
        insert c;
    }
}