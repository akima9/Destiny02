package com.destiny.web.chatting;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.chatting.ChattingService;
import com.destiny.service.user.UserService;

@Controller
@RequestMapping("/chatting/*")
public class ChattingRestController {
	///Field
	
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
		
	
	@RequestMapping(value="json/getPerfectChatting", method=RequestMethod.GET)
	public ModelAndView nodeConn(Locale locale, Model model) throws Exception{
		System.out.println("nodeConn 연결");
		JSONObject cred = new JSONObject();
        JSONObject auth=new JSONObject();
        JSONObject parent=new JSONObject();
        cred.put("username","adm");
        cred.put("password", "pwd");
        auth.put("tenantName", "adm");
        auth.put("passwordCredentials", cred);
        parent.put("auth", auth);

        URLCOnn conn = new URLCOnn("http://192.168.0.28",83);
        conn.urlPost(parent);

       

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("index");
		modelAndView.setViewName("redirect:/chatting/mainChatting.jsp");
		return modelAndView;
	}
	
	
	@RequestMapping(value="json/translate", method=RequestMethod.POST, consumes = "application/json")
	public ModelAndView translate(Locale locale,  @RequestBody JSONObject body) throws Exception{
		System.out.println("translate 연결");
		 System.out.println(body);
		 
		 String userId=(String)body.get("userId");
		 String text=(String)body.get("text");
		 System.out.println("userId : "+userId);
		 System.out.println("text : "+text);
		 //////////////////번역/////////////////
		 String query = URLEncoder.encode(text, "UTF-8");
		 String target="en";
		 String key="AIzaSyBFXIiBAU7QfCf0fwndqoR63wwS0P8kNDM";
		 System.out.println("query : "+query+"target : "+target);
		 
		 String googleApi="https://translation.googleapis.com/language/translate/v2?q="+query+"&target="+target+"&model=nmt&key="+key;
		
			URL url = new URL(googleApi);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("POST");
	       
	        // post request
	        
	        con.setDoOutput(true);
	        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	      
	        wr.flush();
	        wr.close();
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 정상 호출
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
	        } else {  // 에러 발생
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
	        }
	        String inputLine;
	        StringBuffer response = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	            response.append(inputLine);
	        }
	        JSONObject jsonobj = (JSONObject)JSONValue.parse(response.toString());
			System.out.println(jsonobj.get("data").toString());
			
	         br.close();
	         //System.out.println(response.toString());
			
	         JSONObject data=(JSONObject)jsonobj.get("data");
	         JSONArray translations=(JSONArray)data.get("translations");
	         JSONObject translationsArr= (JSONObject)translations.get(0);
	         String transText=(String)translationsArr.get("translatedText");
	       //  String translatedText=(String)translations.get(0).toString();
	         System.out.println("translations"+(String)translations.toString());
			System.out.println("translationsArr :"+translations.get(0).toString());
			System.out.println("번역된 text :"+transText);
		 ///////////////////////////////////////
		JSONObject user = new JSONObject();
        
        user.put("userId",userId);
        user.put("text", URLEncoder.encode(text, "UTF-8"));
        user.put("transText", transText);
        URLCOnn conn = new URLCOnn("http://192.168.0.28",83);
        conn.urlPost(user);

       

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("index");
		//modelAndView.setViewName("redirect:/chatting/mainChatting.jsp");
		return modelAndView;
	}
}
