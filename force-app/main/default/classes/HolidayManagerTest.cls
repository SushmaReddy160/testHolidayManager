@isTest
public with sharing class HolidayManagerTest {
    @isTest static void validateGetHolidayDetails(){
          Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
          List<CalendarificWrapper> lstResponse =  HolidayManager.getHolidayDetails();
          HolidayManager.updateUserRecord('Boxing day');
    }
}
