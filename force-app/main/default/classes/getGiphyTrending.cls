public class getGiphyTrending {
	//@future(callout=true)
    public static void getRequest(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.giphy.com/v1/gifs/trending?api_key=37f1ef27d7584435a6c93395e0369ed8');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        system.debug('response1: '+response);
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'gifs' key as a list
            List<Object> gifs = (List<Object>)results.get('data');
            System.debug('response2: ' + gifs);
            
		//this method needs more work

        }
            
    }
}