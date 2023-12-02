global class UpdatePatientStatusBatch implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Name, Status__c, (SELECT Id, Name, Appointment_Date_Time__c FROM Appointments__r ORDER BY Appointment_Date_Time__c DESC LIMIT 1) FROM Patient__c';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Patient__c> scope) {
        List<Patient__c> patientsToUpdate = new List<Patient__c>();
		integer c=0;
        for (Patient__c patient : scope) {
            if (patient.Appointments__r.size() > 0) {
                Datetime latestAppointmentDate = patient.Appointments__r[0].Appointment_Date_Time__c;
                
                 if (latestAppointmentDate.addDays(180) <= Datetime.now()) {
                    patient.Status__c = 'Inactive';
                    patientsToUpdate.add(patient);
                     c=c+1;
                }
            }
        }
        System.debug(c);
        if (!patientsToUpdate.isEmpty()) {
            update patientsToUpdate;
        }
    }

    global void finish(Database.BatchableContext BC) {
    }
}