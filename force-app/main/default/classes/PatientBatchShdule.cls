public class PatientBatchShdule implements schedulable{
    public void execute(SchedulableContext sc){
        PatientBatch pb = new PatientBatch();
        database.executeBatch(pb);
    }
}