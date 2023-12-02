public class PatientBatch implements Database.Batchable<sObject>{
    public Database.queryLocator start(Database.BatchableContext bc){
        String query = 'select id,name,status__c,  (select id,Appointment_Date_Time__c from appointments__r ) from patient__c';
        return Database.getqueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Patient__c> pt){
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
    public void finish(Database.BatchableContext bc){
 
    }
}