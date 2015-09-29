package hu.ozeki;



import java.net.*;

public class Java_example_httprequest {

	/**
	 * @param args
	 * @throws MalformedURLException 
	 */
	public static void main(String[] args) {
		
		String requestUrl ;
		String recipient = "+919066491494";
		String message = "gsm_id" +
				"   \n   ";
		String username = "admin";
		String password = "admin";
		String originator = "+918281424452";
		
	
		try {
			requestUrl  = "http://127.0.0.1:9501/api?action=sendmessage&" +
            "username=" + URLEncoder.encode(username, "UTF-8") +
            "&password=" + URLEncoder.encode(password, "UTF-8") + 
            "&recipient=" + URLEncoder.encode(recipient, "UTF-8") + 
            "&messagetype=SMS:TEXT" +
            "&messagedata=" + URLEncoder.encode(message, "UTF-8") +
            "&originator=" + URLEncoder.encode(originator, "UTF-8") +
            "&serviceprovider=SMPP0" +
            "&responseformat=html";
			
			
			
		  URL url = new URL(requestUrl);		  
		  HttpURLConnection uc = (HttpURLConnection)url.openConnection();
		  
		  System.out.println(uc.getResponseMessage());
		  
		  
		  

		  uc.disconnect();
		  
		  
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
			
		}
		 

	}

}
