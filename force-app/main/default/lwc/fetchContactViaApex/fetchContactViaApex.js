import { LightningElement, wire } from 'lwc';
import getAllContacts from "@salesforce/apex/ContactManager.getContacts";
export default class FetchContactViaApex extends LightningElement {
    @wire(getAllContacts) contacts;

    get responseReceived(){
        if(this.contacts){
            return true;
        }
        return false
    }
    
}