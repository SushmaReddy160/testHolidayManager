public with sharing class CalendarificWrapper {
    @AuraEnabled
    public Boolean isSelected;
    @AuraEnabled
    public string name;
    @AuraEnabled
    public string description;
    @AuraEnabled
    public string Hdate;
    public CalendarificWrapper(boolean isSelected,String name,string description,string Hdate) {
        this.isSelected = isSelected;
        this.name = name;
        this.description = description;
        this.Hdate = Hdate;
    }
}
