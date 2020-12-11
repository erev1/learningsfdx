import { LightningElement, track, wire } from 'lwc';
import {createRecord, getRecord} from "lightning/uiRecordApi"
const fieldArray=['Contact.LastName', 'Contact.Phone', 'Contact.Email']

export default class CreateContactLDS2 extends LightningElement {
    @track name
    @track email
    @track phone

    @track recordId
    @wire(getRecord, {recordId: '$recordId', fields:fieldArray}) contactRecord;

    contactNameChangeHandler(event){
        this.name = event.target.value
    }

    contactPhoneChangeHandler(event){
        this.phone = event.target.value
    }
    contactEmailChangeHandler(event){
        this.email = event.target.value
    }

    createContact(){
        let fields = {'LastName': this.name, 'Phone': this.phone, 'Email': this.email}
        let input = {apiName:'Contact', fields}
        
        createRecord(input)
        .then(response=>{
            console.log("contact has been successfully created", response.id)
            this.recordId = response.id
        })
        .catch(err =>{
            console.error("there was an error: ", err.body)
        })
    }

    get returnedContactName(){
        if(this.contactRecord.data){
            return this.contactRecord.data.fields.LastName.value
        }
        return undefined
    }

    get returnedContactPhone(){
        if(this.contactRecord.data){
            return this.contactRecord.data.fields.Phone.value
        }
        return undefined
    }

    get returnedContactEmail(){
        if(this.contactRecord.data){
            return this.contactRecord.data.fields.Email.value
        }
        return undefined
    }

}