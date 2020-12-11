import { LightningElement, wire } from 'lwc';
import getAllFollowUps from "@salesforce/apex/FollowUpManager.getFollowUps";


export default class OverDueFollowUps extends LightningElement {

    @wire(getAllFollowUps) followUps;

    get responseReceived(){
        if(this.followUps){
            return true;
        }
        return false
    }
}