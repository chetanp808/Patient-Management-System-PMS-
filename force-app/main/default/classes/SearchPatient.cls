public class SearchPatient {
    @AuraEnabled(cacheable=true)
    public static List<Patient__c> getpatientDetails(String patientName,String patientEmail){
        if (patientName=='' && patientEmail==''){
            return null;
        }
        if(patientEmail==''){
            patientName='%'+patientName+'%';
        List<Patient__c> patients=[SELECT id,name,Patient_Email__c,Status__c FROM Patient__c 
                                        WHERE name LIKE : patientName];
        return patients;
        }
        if(patientName==''){
            List<Patient__c> patients=[SELECT id,name,Patient_Email__c,Status__c FROM Patient__c 
                                        WHERE Patient_Email__c=: patientName];
            return patients;
        }
        return null; 
    }
}