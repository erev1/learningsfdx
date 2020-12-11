@isTest
public class TestRejectDoubleBooking {
	//good scenario 
    static testmethod void TestSingleBooking(){
        Datetime now = System.now();
            
        Speaker__c speaker = new Speaker__c();
        speaker.First_Name__c = 'Gary';
        speaker.Last_Name__c = 'Jones';
            
        insert speaker;
        
        Session__c session1 = new Session__c();
        session1.Name = 'Gaming Basics';
        session1.Session_Date__c = now;
        
        insert session1;
        
        Session_Speaker__c assignment = new Session_Speaker__c();
        assignment.Speaker__c = speaker.Id;
        assignment.Session__c = session1.Id;
        
        Test.startTest();
        Database.SaveResult result = Database.insert(assignment, false);
        Test.stopTest();
        
        System.assert(result.isSuccess());
        
    }
    
    //double book scenario 

    static testmethod void TestDoubleBooking(){
        Datetime now = System.now();
        Speaker__c speaker = new Speaker__c();
        speaker.First_Name__c = 'Gary';
        speaker.Last_Name__c = 'Jones';
            
        insert speaker;
        
        Session__c session1 = new Session__c();
        session1.Name = 'Gaming Basics';
        session1.Session_Date__c = now;
        
        insert session1;
        
        Session__c session2 = new Session__c();
        session2.Name = 'Gaming Pitfalls';
        session2.Session_Date__c = now;
        
        insert session2;
        
        Session_Speaker__c assignment1 = new Session_Speaker__c();
        assignment1.Speaker__c = speaker.Id;
        assignment1.Session__c = session1.Id;
        
        insert assignment1;
        
        Session_Speaker__c assignment2 = new Session_Speaker__c();
        assignment2.Session__c = session2.Id;
        assignment2.Speaker__c = speaker.Id;

        
        Test.startTest();
        Database.SaveResult result = Database.insert(assignment2, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
    }
}