public with sharing class FollowUpManager {

    @AuraEnabled (cacheable=true)
    public static List<Clinic_Tracker__c> getFollowUps(){
        Date today = Date.today();
        Id userId = UserInfo.getUserId();
        List<Clinic_Tracker__c> cts = [SELECT Name, Next_Follow_Up_Date__c, Notes__c FROM
                                Clinic_Tracker__c WHERE Next_Follow_Up_Date__c <= :today AND OwnerId = :userId];

        return cts;
    }
}