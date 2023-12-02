@RestResource(urlMapping='/PatientInfo/*')
global class ExposePatient {
    @httpGet
      global static List<Patient__c> getAllPatient(){
          List<Patient__c>pnt=[select Membership_Id__c,Name, Patient_Email__c,
                               Inactivity_Approved__c from Patient__c where Status__c='Active'];
          return pnt;
      }
 

}