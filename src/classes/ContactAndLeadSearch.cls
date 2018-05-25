public with sharing class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String str1){
    		List<List<sObject>> searchList = [FIND :str1 IN ALL FIELDS RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)];
    		system.debug('qmx_test:'+searchList);
    		return searchList;
    }
}