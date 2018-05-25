/**
 * this class used to trailhead https://trailhead.salesforce.com/modules/apex_integration_services/units/apex_integration_rest_callouts
 */
public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer num){
			//th-apex-http-callout.herokuapp.com/animals/:id
			//name
			map<String,Object> animals = new map<string,Object>();
			Http http = new Http();
      HttpRequest request = new HttpRequest();
       String testStr = 'https://th-apex-http-callout.herokuapp.com/animals/' + num;
      request.setEndpoint(testStr);
      request.setMethod('GET');
      HttpResponse response = http.send(request);
      // If the request is successful, parse the JSON response.
      if (response.getStatusCode() == 200) {
          // Deserializes the JSON string into collections of primitive data types.
          Map<String, object> results = (Map<String,object>) JSON.deserializeUntyped(response.getBody());
          System.debug('Received the following results:'+ results);
          // Cast the values in the 'animals' key as a list
          animals = (map<String,Object>)results.get('animal');
          System.debug('Received the following animals:'+ animals);
          System.debug('Received the following name:'+ animals.get('name'));
      }
      return (String)animals.get('name');
    }
}