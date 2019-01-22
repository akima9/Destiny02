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
	
////���� ����Ʈ�� ���� ����Ʈ�� ���� ��ü ����
	private List<User> womanList = new ArrayList<User>();
	private List<User> manList = new ArrayList<User>();
	private List<Chatting> chattingList = new ArrayList<Chatting>();
	private int no;
	
	
		
	
	/*node ���� �õ�
	 * @RequestMapping(value="json/getPerfectChatting", method=RequestMethod.GET)
	public ModelAndView nodeConn(Locale locale, Model model) throws Exception{
		System.out.println("nodeConn ����");
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
		System.out.println("getPerfectChatting ����");
		ModelAndView modelAndView = new ModelAndView();
		
		//getChatting NO
		Chatting resultChatting=chattingService.getChatting2(roomNo);
		//roomName�� ChattingNo�� ����
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
		System.out.println("chat ����");
		//userId ������
		User user=(User)session.getAttribute("me");
		String userId=user.getUserId();
		System.out.println("userId : "+userId);
		session.setAttribute("chat", userId);
		System.out.println("session�� �����value : "+session.getAttribute("chat"));
		//chatting message
		//String q=(String)chat.get("message");
		//String q=message;
		String query = URLEncoder.encode(q, "UTF-8");
		//���� �ޱ� ���ϴ� ���
		//String target=(String)chat.get("lang");
		//String target=lang;
		//google translate api key
		String key="AIzaSyBFXIiBAU7QfCf0fwndqoR63wwS0P8kNDM";
		System.out.println("q : "+query+"target : "+target);
		////���߿� ���� 20���� ���� ���̸� �ٷ� ���� �� �̻���̸� �������->��->target���/////////////////////
//		int textLength=q.length();
//		if (textLength>20) {
//			000+
//		}else {
//			
//		}
		
/////////////////////////////////////////////////////////////////////////		
		//google�� ���� ��û
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
        if(responseCode==200) { // ���� ȣ��
            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        } else {  // ���� �߻�
            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        }
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        JSONObject jsonobj = (JSONObject)JSONValue.parse(response.toString());
		System.out.println("����� : "+jsonobj.get("data").toString());
		
         br.close();
         //System.out.println(response.toString());
		///����Text////////////////////////////
         String a=jsonobj.get("data").toString();
		//���
         System.out.println("������� : "+a);
         return a;	
	}
	@ResponseBody
	@RequestMapping(value="json/translate",method=RequestMethod.POST)

	public String chatGoogleTranslatePOST(@RequestBody JSONObject body, HttpSession session ) throws Exception {
		System.out.println("chat ����");
		System.out.println(body);
		//userId ������
		User user=(User)session.getAttribute("me");
		String userId=user.getUserId();
		System.out.println("userId : "+userId);
		session.setAttribute("chat", userId);
		System.out.println("session�� �����value : "+session.getAttribute("chat"));
		//chatting message
		//String q=(String)chat.get("message");
		//String q=message;
		String q=(String)body.get("message");
		
		String query = URLEncoder.encode(q, "UTF-8");
		//���� �ޱ� ���ϴ� ���
		//String target=(String)chat.get("lang");
		//String target=lang;
		
		//google translate api key
		 String target=(String)body.get("lang");
		String key="AIzaSyBFXIiBAU7QfCf0fwndqoR63wwS0P8kNDM";
		//System.out.println("q : "+query+"target : "+target);
		////���߿� ���� 20���� ���� ���̸� �ٷ� ���� �� �̻���̸� �������->��->target���/////////////////////
//		int textLength=q.length();
//		if (textLength>20) {
//			000+
//		}else {
//			
//		}
		
/////////////////////////////////////////////////////////////////////////		
		//google�� ���� ��û
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
        if(responseCode==200) { // ���� ȣ��
            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        } else {  // ���� �߻�
            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        }
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        JSONObject jsonobj = (JSONObject)JSONValue.parse(response.toString());
		System.out.println("����� : "+jsonobj.get("data").toString());
		
         br.close();
         //System.out.println(response.toString());
		///����Text////////////////////////////
         String a=jsonobj.get("data").toString();
//         Map<String, Object> map=new HashMap<String, Object>();
//         map.put("a", a);
		//���
         System.out.println("������� : "+a);
         
         JSONObject data=(JSONObject)jsonobj.get("data");
         JSONArray translations=(JSONArray)data.get("translations");
         JSONObject translationsArr= (JSONObject)translations.get(0);
         String transText=(String)translationsArr.get("translatedText");
       //  String translatedText=(String)translations.get(0).toString();
         System.out.println("translations"+(String)translations.toString());
		System.out.println("translationsArr :"+translations.get(0).toString());
		System.out.println("������ text :"+transText);
	 ///////////////////////////////////////
         return transText;	
	}
	
	
	
	@RequestMapping(value="json/addPerfectChatting", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> addPerfectChatting(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("json/addPerfectChatting ����");
		
		//===========================================���� ������ ���� ���� part=================================================
		
	
		Chatting chatting=new Chatting();
		ServletContext applicationScope = request.getSession().getServletContext();
		Map<String, Object> map=new HashMap<String, Object>();
		User user=(User)session.getAttribute("me");
		System.out.println("user"+user);
		ModelAndView modelAndView = new ModelAndView();
		////user���α��� �� ���
	
			////���̵�� user������ �����´�.
			User dbUser=userService.getUser(user.getUserId());
			
			/////������ ���
			if (user.getGender().equals("W")) {
				if(applicationScope.getAttribute("womanList") != null) {
					womanList = (List<User>) applicationScope.getAttribute("womanList");
				}
				womanList.add(dbUser);
					
				applicationScope.setAttribute("womanList", womanList);
				
				for(User v : womanList) {
					System.out.println("����  ���� ������ ��� : " + v);
					
				}
			}else {
				//������ ���
				if(applicationScope.getAttribute("manList") != null) {
					manList = (List<User>) applicationScope.getAttribute("manList");
				}
				manList.add(dbUser);
					
				applicationScope.setAttribute("manList", manList);
				
				for(User v : manList) {
					System.out.println("����  ���� ������ ��� : " + v);
				}
			}
			
			
			System.out.println("manList.size() : "+manList.size()+"womanList.size() : "+womanList.size());
			System.out.println("manList : "+manList+"womanList : "+womanList);

			map.put("manList", manList);
			map.put("womanList", womanList);
			
							
		
		
		
		
		//====================================================================================================
		
		// user�� ���̵��ʿ� ������ ��������, �̻��� ������ ���� ��Ī
		
		
		return map;
	}
	
	@RequestMapping(value="json/matching", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> matching(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("json/addPerfectChatting ����");
		
		//===========================================���� ������ ���� ���� part=================================================
		
	
		Chatting chatting=new Chatting();
		Map<String, Object> map=new HashMap<String, Object>();
		ServletContext applicationScope = request.getSession().getServletContext();
		User user=(User)session.getAttribute("me");
		System.out.println("user"+user);
		String userId=user.getUserId();
		ModelAndView modelAndView = new ModelAndView();
		////user���α��� �� ���
	
			////���̵�� user������ �����´�.
			User dbUser=userService.getUser(user.getUserId());
			
			/////������ ���
			if (user.getGender().equals("W")) {
				if(applicationScope.getAttribute("womanList") != null) {
					womanList = (List<User>) applicationScope.getAttribute("womanList");
				}
			
				for(User v : womanList) {
					System.out.println("����  ���� ������ ��� : " + v);
					
				}
			}else {
				//������ ���
				if(applicationScope.getAttribute("manList") != null) {
					manList = (List<User>) applicationScope.getAttribute("manList");
				}
				
				for(User v : manList) {
					System.out.println("����  ���� ������ ��� : " + v);
				}
			}
			
			
			System.out.println("manList.size() : "+manList.size()+"womanList.size() : "+womanList.size());
			System.out.println("manList : "+manList+"womanList : "+womanList);
			String man=null;
			String woman=null;
			int roomNo=0;

			if (manList.size()>no && womanList.size()>no) {
				////////��Ī�� ���̵� 2�� �ֱ�
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
				////������//////////////////////////////
				
				map.put("manList", manList);
				map.put("womanList", womanList);
			
				
				
			}
			//get
			System.out.println("getChatting");
				if (no>0&&(womanList.get(no-1).getUserId().equals(userId)||manList.get(no-1).getUserId().equals(userId))) {
					Chatting resultChatting=chattingService.getChatting(userId);
					//roomName�� ChattingNo�� ����
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
		
		// user�� ���̵��ʿ� ������ ��������, �̻��� ������ ���� ��Ī
		
		
		return map;
	}
}
