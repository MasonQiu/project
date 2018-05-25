public with sharing class RandomContactFactory {
    public static list<Contact> generateRandomContacts(Integer num, String lastName){
    	// Integer i = 0;
	  list<Contact> list_cont = new list<Contact>();
    	// 
    	for(Integer i= 0; i< num; i++){
    		Contact cont = new Contact();
    		cont.LastName = lastName;
    		cont.FirstName = 'qiu' +i;
				list_cont.add(cont);
    	}
    	return list_cont;
    }
}