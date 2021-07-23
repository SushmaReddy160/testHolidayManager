public with sharing class HolidayManager {
     @AuraEnabled(cacheable=true)
    public static List<CalendarificWrapper> getHolidayDetails(){
        List<CalendarificWrapper>  lstWrapResponse = new List<CalendarificWrapper>();
        String endPoint = 'https://calendarific.com/api/v2/holidays?country=CA&year=2021&api_key=5e81b82c09cde593f7e914f00303f5cf968139a7';
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(endPoint);
        HttpResponse res = h.send(req);


        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(res.getbody());
        object response = m.get('response');
        Map < String, Object > m1 = ( Map < String, Object > )response;
        for ( Object obj : ( List< Object > )m1.get('holidays') ) {
            Map <String, Object > mobj = ( Map < String, Object > )obj;
            String description  = String.ValueOf(mobj.get('description'));
            String name  = String.ValueOf(mobj.get('name'));
            object  dateVal = mobj.get('date') ;
            Map < String, Object > mapDate = ( Map < String, Object > )dateVal;
            String dateValstr = String.ValueOf(mapDate.get('iso'));
            lstWrapResponse.add(new CalendarificWrapper(false,name,description,dateValstr));
        }
        return lstWrapResponse;

  }
  @AuraEnabled
  public Static void updateUserRecord(String selectedRow){
      user obj = new user(id= userinfo.getUserId());
      
      obj.Selected_Holiday__c  = selectedRow;
      update obj;
  
  }

  @AuraEnabled
  public static string preSelectedHoliday(){
    user u = [select id,Selected_Holiday__c from user where id =:userinfo.getUserId()  ];
  //  user u = new user(id= userinfo.getUserId());
    string hName;
    system.debug('==user==='+u);
    system.debug('==u.Selected_Holiday__c==='+u.Selected_Holiday__c);
    if(u.Selected_Holiday__c != ''){
     hName = u.Selected_Holiday__c;
    }
    return hName;
  }
}
