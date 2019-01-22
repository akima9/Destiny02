package com.destiny.web.chatting;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.chatting.ChattingService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserService;


@RestController
@RequestMapping("/chatting/*")
public class ChattingRestController {
	///Field
	
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
////여성 리스트와 남성 리스트를 담을 객체 생성
	private List<User> womanList = new ArrayList<User>();
	private List<User> manList = new ArrayList<User>();
	private List<Chatting> chattingList = new ArrayList<Chatting>();
	private int no;
	
	
		
	
	/*node 연결 시도
	 * @RequestMapping(value="json/getPerfectChatting", method=RequestMethod.GET)
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
	}*/
	
	@RequestMapping(value="json/getPerfectChatting/{roomNo}", method=RequestMethod.GET)
	public ModelAndView getPerfectChatting(@PathVariable int roomNo,HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("getPerfectChatting 들어옴");
		ModelAndView modelAndView = new ModelAndView();
		
		//getChatting NO
		Chatting resultChatting=chattingService.getChatting2(roomNo);
		//roomName은 ChattingNo로 지정
		String man=null;
		String woman=null;
		man=resultChatting.getManId();
		woman=resultChatting.getWomanId();
		
		System.out.println("resultChatting : "+resultChatting);
		System.out.println("roomNo : "+roomNo);
		
		modelAndView.setViewName("chatting/getPerfectChatting.jsp");
		modelAndView.addObject("result", "Success");
		modelAndView.addObject("womanId", woman);
		modelAndView.addObject("manId", man);
		modelAndView.addObject("roomNo", roomNo);
		return modelAndView;
	}
	
	@RequestMapping(value="json/translate/{q}/{target}",method=RequestMethod.GET)
	public String chatGoogleTranslateGET( @PathVariable String q,@PathVariable String target, HttpSession session) throws Exception {
		System.out.println("chat 들어옴");
		//userId 가져옴
		User user=(User)session.getAttribute("me");
		String userId=user.getUserId();
		System.out.println("userId : "+userId);
		session.setAttribute("chat", userId);
		System.out.println("session에 저장된value : "+session.getAttribute("chat"));
		//chatting message
		//String q=(String)chat.get("message");
		//String q=message;
		String query = URLEncoder.encode(q, "UTF-8");
		//번역 받기 원하는 언어
		//String target=(String)chat.get("lang");
		//String target=lang;
		//google translate api key
		String key="AIzaSyBFXIiBAU7QfCf0fwndqoR63wwS0P8kNDM";
		System.out.println("q : "+query+"target : "+target);
		////나중에 구현 20개의 문자 길이면 바로 번역 그 이상길이면 원본언어->일->target언어/////////////////////
//		int textLength=q.length();
//		if (textLength>20) {
//			000+
//		}else {
//			
//		}
		
/////////////////////////////////////////////////////////////////////////		
		//google에 번역 요청
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
		System.out.println("결과값 : "+jsonobj.get("data").toString());
		
         br.close();
         //System.out.println(response.toString());
		///번역Text////////////////////////////
         String a=jsonobj.get("data").toString();
		//결과
         System.out.println("번역결과 : "+a);
         return a;	
	}
	@ResponseBody
	@RequestMapping(value="json/translate",method=RequestMethod.POST)

	public String chatGoogleTranslatePOST(@RequestBody JSONObject body, HttpSession session ) throws Exception {
		System.out.println("chat 들어옴");
		System.out.println(body);
		//userId 가져옴
		User user=(User)session.getAttribute("me");
		String userId=user.getUserId();
		System.out.println("userId : "+userId);
		session.setAttribute("chat", userId);
		System.out.println("session에 저장된value : "+session.getAttribute("chat"));
		//chatting message
		//String q=(String)chat.get("message");
		//String q=message;
		String q=(String)body.get("message");
		
		String query = URLEncoder.encode(q, "UTF-8");
		//번역 받기 원하는 언어
		//String target=(String)chat.get("lang");
		//String target=lang;
		
		//google translate api key
		 String target=(String)body.get("lang");
		String key="AIzaSyBFXIiBAU7QfCf0fwndqoR63wwS0P8kNDM";
		//System.out.println("q : "+query+"target : "+target);
		////나중에 구현 20개의 문자 길이면 바로 번역 그 이상길이면 원본언어->일->target언어/////////////////////
//		int textLength=q.length();
//		if (textLength>20) {
//			000+
//		}else {
//			
//		}
		
/////////////////////////////////////////////////////////////////////////		
		//google에 번역 요청
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
		System.out.println("결과값 : "+jsonobj.get("data").toString());
		
         br.close();
         //System.out.println(response.toString());
		///번역Text////////////////////////////
         String a=jsonobj.get("data").toString();
//         Map<String, Object> map=new HashMap<String, Object>();
//         map.put("a", a);
		//결과
         System.out.println("번역결과 : "+a);
         
         JSONObject data=(JSONObject)jsonobj.get("data");
         JSONArray translations=(JSONArray)data.get("translations");
         JSONObject translationsArr= (JSONObject)translations.get(0);
         String transText=(String)translationsArr.get("translatedText");
       //  String translatedText=(String)translations.get(0).toString();
         System.out.println("translations"+(String)translations.toString());
		System.out.println("translationsArr :"+translations.get(0).toString());
		System.out.println("번역된 text :"+transText);
	 ///////////////////////////////////////
         return transText;	
	}
	
	
	
	@RequestMapping(value="json/addPerfectChatting", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> addPerfectChatting(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("json/addPerfectChatting 들어옴");
		
		//===========================================현제 접속자 구현 로직 part=================================================
		
	
		Chatting chatting=new Chatting();
		ServletContext applicationScope = request.getSession().getServletContext();
		Map<String, Object> map=new HashMap<String, Object>();
		User user=(User)session.getAttribute("me");
		System.out.println("user"+user);
		ModelAndView modelAndView = new ModelAndView();
		////user가로그인 한 경우
	
			////아이디로 user정보를 가져온다.
			User dbUser=userService.getUser(user.getUserId());
			
			/////여성일 경우
			if (user.getGender().equals("W")) {
				if(applicationScope.getAttribute("womanList") != null) {
					womanList = (List<User>) applicationScope.getAttribute("womanList");
				}
				womanList.add(dbUser);
					
				applicationScope.setAttribute("womanList", womanList);
				
				for(User v : womanList) {
					System.out.println("현재  여성 접속자 목록 : " + v);
					
				}
			}else {
				//남성일 경우
				if(applicationScope.getAttribute("manList") != null) {
					manList = (List<User>) applicationScope.getAttribute("manList");
				}
				manList.add(dbUser);
					
				applicationScope.setAttribute("manList", manList);
				
				for(User v : manList) {
					System.out.println("현재  남성 접속자 목록 : " + v);
				}
			}
			
			
			System.out.println("manList.size() : "+manList.size()+"womanList.size() : "+womanList.size());
			System.out.println("manList : "+manList+"womanList : "+womanList);

			map.put("manList", manList);
			map.put("womanList", womanList);
			
							
		
		
		
		
		//====================================================================================================
		
		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭
		
		
		return map;
	}
	
	@RequestMapping(value="json/matching", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> matching(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("json/addPerfectChatting 들어옴");
		
		//===========================================현제 접속자 구현 로직 part=================================================
		
	
		Chatting chatting=new Chatting();
		Map<String, Object> map=new HashMap<String, Object>();
		ServletContext applicationScope = request.getSession().getServletContext();
		User user=(User)session.getAttribute("me");
		System.out.println("user"+user);
		String userId=user.getUserId();
		ModelAndView modelAndView = new ModelAndView();
		////user가로그인 한 경우
	
			////아이디로 user정보를 가져온다.
			User dbUser=userService.getUser(user.getUserId());
			
			/////여성일 경우
			if (user.getGender().equals("W")) {
				if(applicationScope.getAttribute("womanList") != null) {
					womanList = (List<User>) applicationScope.getAttribute("womanList");
				}
			
				for(User v : womanList) {
					System.out.println("현재  여성 접속자 목록 : " + v);
					
				}
			}else {
				//남성일 경우
				if(applicationScope.getAttribute("manList") != null) {
					manList = (List<User>) applicationScope.getAttribute("manList");
				}
				
				for(User v : manList) {
					System.out.println("현재  남성 접속자 목록 : " + v);
				}
			}
			
			
			System.out.println("manList.size() : "+manList.size()+"womanList.size() : "+womanList.size());
			System.out.println("manList : "+manList+"womanList : "+womanList);
			String man=null;
			String woman=null;
			int roomNo=0;

			if (manList.size()>no && womanList.size()>no) {
				////////매칭된 아이디 2개 넣기
				//		chatting.setManId(manId);
				//		chatting.setWomanId(womanId);
				/////////test
				System.out.println("manList==womanList");
				man=manList.get(no).getUserId();
				woman=womanList.get(no).getUserId();
				chatting.setManId(man);
				chatting.setWomanId(woman);
				chatting.setContactMeeting("N");
				//addChatting
				System.out.println("man  : "+man+"  woman : "+woman);
				
				
				chattingService.addPerfectChatting(chatting);
				
				no++;
				//womanList.remove(0);
				//manList.remove(0);
				////대기상태//////////////////////////////
				
				map.put("manList", manList);
				map.put("womanList", womanList);
			
				
				
			}
			//get
			System.out.println("getChatting");
				if (no>0&&(womanList.get(no-1).getUserId().equals(userId)||manList.get(no-1).getUserId().equals(userId))) {
					Chatting resultChatting=chattingService.getChatting(userId);
					//roomName은 ChattingNo로 지정
					roomNo=resultChatting.getChattingNo();
					System.out.println("resultChatting : "+resultChatting);
					System.out.println("roomNo : "+roomNo);
					man=resultChatting.getManId();
					woman=resultChatting.getWomanId();
					map.put("womanId", woman);
					map.put("manId", man);
					map.put("roomNo", roomNo);
					map.put("no", no); 
					session.setAttribute("roomNo", roomNo);
					chattingList.add(resultChatting);
					System.out.println("map : "+map);
				}else {
					map.put("womanId", woman);
					map.put("manId", man);
					map.put("roomNo", roomNo); 
					
					System.out.println("map : "+map);
				}
				
		
			
			
		//====================================================================================================
		
		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭
		
		
		return map;
	}
}
