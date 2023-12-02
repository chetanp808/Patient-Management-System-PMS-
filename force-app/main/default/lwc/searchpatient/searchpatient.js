import { LightningElement } from 'lwc';
import getPatient from '@salesforce/apex/SearchPatient.getpatientDetails'
import getPatientbyEmail from '@salesforce/apex/SearchPatientbyEmail.getpatientDetails'

export default class Searchpatient extends LightningElement {
    patientName;
    patientEmail;
    

    handleOnChangePatientName(event){
        this.patientName=event.target.value;
    }
    handleOnChangePatientEmail(event){
        this.patientEmail=event.target.value;
    }

    clearSearch(){
        this.patientName="";
        this.patientEmail="";
        getPatient({patientName:this.patientName}).then(result=>{
            this.dispatchEvent(new CustomEvent('getpatientdetails',{detail:result}))
        }).catch(error=>{console.log(error)})
    }

    initiateSearch(){
        if (this.patientName!=""){
        getPatient({patientName:this.patientName}) // Promise call Internally
        
        .then(result=>{this.dispatchEvent(new CustomEvent('getpatientdetails',{detail:result}))
    })
        .catch(error=>{console.log(error)})
    }
    else{
        getPatientbyEmail({patientEmail:this.patientEmail}) // Promise call Internally
        
        .then(result=>{this.dispatchEvent(new CustomEvent('getpatientdetails',{detail:result}))
    })
        .catch(error=>{console.log(error)})
    }
    
}

}