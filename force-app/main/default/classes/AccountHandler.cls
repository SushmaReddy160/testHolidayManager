public with sharing class AccountHandler {
    @auraEnabled
    public static list<Account> AccountHandlerMethod(){
        return [select  name from Account limit 5];
    }
}
