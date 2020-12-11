public class FrontDeskRegistration {

    public FrontDeskRegistration(ApexPages.StandardController controller) {
        this.guestFormVis = false;
        this.youthFormVis = false;
        this.successMessageVis = false;
        this.topBarVis = true;
        this.programA = new Program_Attendance__c();

    }

    public integer youthID {get;set;}
    public string name {get;set;}
    private Casework__c casework;
    public boolean guestFormVis {get;set;}
    public boolean youthFormVis {get;set;}
    public string personName {get; set;}
    public boolean successMessageVis {get; set;}
    public boolean topBarVis{get; set;}
    public Program_Attendance__c programA {get; set;}
    
    
    
    public void showYouthForm(){
        this.guestFormVis = false;
        this.youthFormVis = true;
    }
    
    public void showGuestForm(){
        this.youthFormVis = false;
        this.guestFormVis = true;
    }
    
    public void submit (){
    
        Program_Attendance__c newRec = new Program_Attendance__c();
        Datetime attendDate = Datetime.now();

        
        if(this.youthID == NULL){
            casework = [SELECT Id, Name FROM Casework__c WHERE Casework__c.Id = 'a093u00000blbCE'];
            this.guestFormVis = false;
            this.personName = this.name;
            newRec.Name__c = this.name;
            newRec.Date__c = attendDate;
            newRec.Casework_Record__c = casework.Id;

   

        }
        else{
        casework = [SELECT Id, Name, Name__c FROM Casework__c where YouthID__c = :youthID];
        this.personName = casework.Name__c;
        this.youthFormVis = false;
        newRec.Name__c = this.name;
        newRec.Date__c = attendDate;
        newRec.YouthID__c = this.youthID;
        newRec.Casework_Record__c = casework.Id;

        }
        
        insert newRec;
        this.topBarVis = false;
        this.successMessageVis = true;
        
    }
    
    // get the casework record if the youthID is not null
    
    
}