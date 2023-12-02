import { LightningElement } from 'lwc';
import getAccount from '@salesforce/apex/searchAccountInfo.getAccountDetails'

export default class ptientsearchresult extends LightningElement {
    accName;
    accPhone;
    accBillingStreet;
    accBillingCity;
    accBillingState;
    accBillingZip;
 
    handleOnChangeaccName(event){
        this.accName = event.target.value;
    }
    handleOnChangeaccPhone(event){
        this.accPhone = event.target.value;
    }
    handleOnChangeaccBillingStreet(event){
        this.accBillingStreet = event.target.value;
    }
    handleOnChangeaccBillingCity(event){
        this.accBillingCity = event.target.value;
    }
    handleOnChangeaccBillingState(event){
        this.accBillingState = event.target.value;
        alert(this.accBillingState);
    }
    handleOnChangeaccBillingZip(event){
        this.accBillingZip = event.target.value;
    }
    initiateSearch(event){
        alert('Yes sir, I am ready to search! = '+this.accName);
        getAccount({actName:this.accName}).then(results=>{
            this.dispatchEvent(new CustomEvent('getaccountdata',{detail:results}));
        }).catch(error=>{
            console.log(error);
        })
    }
 
}