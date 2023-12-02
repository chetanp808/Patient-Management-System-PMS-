public class searchAccountInfo {
    @AuraEnabled(cacheable=true)
    public static List<account> getAccountDetails(String actName){
        actName = '%'+actName+'%';
        List<account> act = [select id,name from account where name like:actName];
        return act;
    }
}