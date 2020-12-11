public class GetGif {

    @future (callout=true)
   
    
    public static void getTheGif(String taskId) {
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint('http://api.giphy.com/v1/gifs/random?api_key=37f1ef27d7584435a6c93395e0369ed8&tag=\'obama\'');
            req.setMethod('GET');
            
            HttpResponse res = h.send(req);
            String myBod = res.getBody();
        
        	GifJsonData JSONDetails = (GifJsonData) 
            System.JSON.deserialize(myBod, GifJsonData.class);
        	
        	String myUrl = JSONDetails.data.url;
        	
        	System.Debug('taskID '+ taskId);
            
        	List <Task> myTask = [SELECT Id FROM Task WHERE Id = :taskId];
        	
        	for (Task t : myTask){
                t.Description = myUrl;
                update t;
            }
        	      
        	System.Debug('url???: ' + myUrl);
                        
    }
    

}