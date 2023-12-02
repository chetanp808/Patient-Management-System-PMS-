public class PatientWithoutAppointments {

    public void getPatientsWithoutAppointments() {
        list<Patient__c> pt = [select id,name,status__c,  (select id,Appointment_Date_Time__c from appointments__r ) from patient__c];
        for(Patient__c p:pt){
            for (appoi__c ap :p.appointments__r){
				//System.debug(p.name + ap.Appointment_Date_Time__c);
				if (ap.Appointment_Date_Time__c<system.today().addDays(-180)){
                    p.Status__c = 'Inactive';
                }
            }
        }
        update pt;
    }
}