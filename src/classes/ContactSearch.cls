public with sharing class ContactSearch {
    public static list<Contact> searchForContacts(String str1,String str2){
    		List<Contact>  list_cont = new List<Contact>() ;
    		list_cont = [select id,Name from Contact where LastName =: str1 And MailingPostalCode =: str2 ];
    		return list_cont;
    }
}