import { LightningElement } from 'lwc';

export default class parentpatient extends LightningElement {
    searchDetail=[];
    handlePatient(event){
        this.searchDetail=[];
        try{
            event.detail.forEach(element => {
                var custData={
                    id:element.Id,
                    name:element.Name,
                    email:element.Patient_Email__c,
                    status:element.Status__c
                }
                this.searchDetail.push(custData);
            });
        }catch(e){
            console.log(e);
        }
    }
}