Component List - 

1- Lightning Web component - HolidayList

A lightning web component is exposed on UI as lightning tab and this component is displaying list of holiday in a given calender year based on year and country.


Functionality - 

From LWC, we have used wire method to call an apex method which is calling the third party api of calenderific, getting all data in a lightning datatable.
I have used the conditional rendering of this data table if the property has data in datatable, otherwise we are catching the error and displaying it.

on the connected callback we are calling an apex method to get the current favorite holiday of the logged in user and are displaying it on UI.

We have a updateHoliday method(holidayUpdateHandler) on jS file which is calling another apex method(updateUserRecord) to update the favorite holiday on user object.

A method handleRowSelection is used on row selection of the datatable to make sure that user is only able to select one row.user will get toast notification in case he tries to select more than one row.


Toast Notification - 

We have intotal 4 toast notification and we have used a generic method showNotification to display toast notification.Custom label are used to display error message or success messages.



2- Apex class-

We have in total 2 classes -
 a- CalendarificWrapper
 b- HolidayManager
 
 CalendarificWrapper class is a wrapper class and is used to create different set of variables as per our requirement .
 HolidayManager class is used to perform different operations like saving favorite holiday, calling calenderific apis, getting data and deconstructing the data etc.
 
 
 3- Test class-
 
 a- HolidayManagerTest
 b- MockHttpResponseGenerator
 
 both of these test classes are used to cover the test coverage of our main classes.
