public class componentController {
		
		public componentController(){
			System.debug(LoggingLevel.INFO, '*** componentController');
		}
   
		public String selectedValue {
        get;
        set {
        		System.debug(LoggingLevel.INFO, '*** selectedValue.set: '  ); 
            editMode = (value != null);
            // Side effect here - don't do this!
            selectedValue = value;
        }
    }

    public Boolean editMode {get; private set;}
}