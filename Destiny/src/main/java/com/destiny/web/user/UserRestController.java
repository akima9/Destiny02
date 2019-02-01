package com.destiny.web.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.MessagingException;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.destiny.common.Coolsms;
import com.destiny.service.domain.Location;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserService;


@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public UserRestController() {	
	}
	
	@RequestMapping(value="json/getUser/{userId}", method=RequestMethod.GET)
	public Map<String, Object> getUser(@PathVariable String userId) throws Exception{
		System.out.println("restController 진입 성공. json/getUser/"+userId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		User user = userService.getUser(userId);
		
		map.put("user", user);
		//프로필 사진
		user.setProfile(user.getProfile().replace("[", ""));
		user.setProfile(user.getProfile().replace("]", ""));
		String[] filelist = user.getProfile().split(", ");
		map.put("filelist", filelist);
		
		System.out.println("여긴 오냐?");
		return map;
	}
	
	@RequestMapping(value="json/getUserByNickName/{nickName}", method=RequestMethod.GET)
	public Map<String, Object> getUserByNickName(@PathVariable String nickName, HttpSession session) throws Exception{
		System.out.println("restController 진입 성공. json/getUserByNickName/"+nickName);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", userService.getUserByNickName(nickName));
		map.put("me", session.getAttribute("me"));
		System.out.println("여긴 오냐?");
		return map;
	}
	
	@RequestMapping(value="json/getUserByEmail/{email}", method=RequestMethod.GET)
	public Map<String, Object> getUserByEmail(@PathVariable String email, HttpSession session) throws Exception{
		email += ".com";
		System.out.println("restController 진입 성공. json/getUserByEmail/"+email);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", userService.getUserByEmail(email));
		map.put("me", session.getAttribute("me"));
		System.out.println("여긴 오냐?");
		return map;
	}
	
	@RequestMapping(value="json/getUserByPhone/{phone}", method=RequestMethod.GET)
	public Map<String, Object> getUserByPhone(@PathVariable String phone, HttpSession session) throws Exception{
		System.out.println("restController 진입 성공. json/getUserByPhone/"+phone);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", userService.getUserByPhone(phone));
		map.put("me", session.getAttribute("me"));
		System.out.println("여긴 오냐?");
		return map;
	}
	
	@RequestMapping(value="json/getLocationList/{city}", method=RequestMethod.GET)
	public Map<String, Object> getLocationList(@PathVariable String city) throws Exception{
		System.out.println("restController 진입 성공. json/getLocationList/"+city);
	
		System.out.println("여긴 오냐?");
		
		Map<String, Object> map = userService.getLocationList(city);
		
		
		System.out.println("끝");
		return map;
	}
	
	
	@RequestMapping(value="json/getAnswer/{question}", method=RequestMethod.GET)
	public Map getAnswer(@PathVariable("question") String question) throws Exception{
		System.out.println("json/getAnswer/ + " + question);
		String requestURL = "http://api.adams.ai/datamixiApi/deepqa?key=3758962826504551960&answerType=0&question=";
		
		String text = URLEncoder.encode(question, "UTF-8");
		requestURL += text;
		URL url = new URL(requestURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		
		int responseCode = con.getResponseCode();
		BufferedReader br = null;
		
		if(responseCode==200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        }
		
		//JSON Data 읽기
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        // Console 확인
        System.out.println(response.toString());
        
        String returnString = response.toString();
        JSONObject answer = (JSONObject)JSONValue.parse(returnString);
        System.out.println("json으로 달린 answer : "  + answer);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("answer", answer);
		
		return map;
	}
	

	@RequestMapping(value="json/SMSAuth/{phone}", method=RequestMethod.POST)
	public Map SMSAuth(@PathVariable String phone, HttpSession session) throws Exception{
		System.out.println("SMSAuth 진입 완료. 받은 폰 번호 : " + phone);
		
		String api_key = "NCS14Y4JAMHE1URY";
		String api_secret = "PGIB0ZOIVBL9IHYLZP7QIMNWHSSWP9F9";
		Coolsms coolsms = new Coolsms(api_key, api_secret);
		
		String key = RandomNum();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("to", phone);
		map.put("from", "01076679328");
		map.put("text", "하이 헬로우 안녕? 인증번호는 [" + key + "] 이야");
		map.put("type", "sms");
		
		System.out.println("여까지오긴하니?");
		
		Map reMap = new HashMap();
		
		JSONObject result = coolsms.send(map);
		if((boolean) result.get("status") == true) {
			System.out.println("성공");
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
			reMap.put("authNum", key);
			reMap.put("result", "success");
		} else {
			System.out.println("실패");
			System.out.println(result.get("code"));
			System.out.println(result.get("message"));
			reMap.put("result", "fail");
		}
			
		return reMap;
	}
	
	@RequestMapping(value="json/emailAuth/{email}", method=RequestMethod.POST)
	public Map emailAuth(@PathVariable String email, HttpSession session) throws Exception {
		System.out.println("emailAuth 진입 완료");
		//String email = request.getParameter("email");
		String authNum = "";
		email += ".com";
		System.out.println("이메일 획득 : " + email);
		
		authNum = RandomNum();
		System.out.println("난수 매서드 수행 : " +  authNum);
		
		sendEmail(email.toString().trim(), authNum);
		System.out.println("sendEmail 메서드 수행");
		
		Map map = new HashMap();
		//map.put("email", email);
		map.put("authNum", authNum);
		session.setAttribute("authNum", authNum);
		//model.addAttribute("email", email);
		//model.addAttribute("authNum", authNum);
		
		return map;
	}
	
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0;i <= 6; i++) {
			int n = (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	private void sendEmail(String email, String authNum) {
		String host = "smtp.naver.com";
		String subject = "인증정보 전달";
		String fromName = "전달자";
		String from = "ABC";
		String to1 = email;
		
		//String user = "pischa@naver.com";
		String password = "";

		
		String content = "인증번호를 입력하여 주세요. 인증번호 ["+authNum+"]";
		
		try {
			
			System.out.println("sendEmail try 진입. email : " + email);
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.user", 587);
			props.put("mail.smtp.auth", "true");
			System.out.println("Properties 선언  : " + props.toString());
			
			Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(email,password);
					}
			});
			
			System.out.println("session 선언 " + session.toString());
			
			Message msg = new MimeMessage(session);
			
			
			msg.setFrom(new InternetAddress(to1));
			
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to1));
			msg.setSubject("Confirm Mail");
			msg.setText(content);
			
			System.out.println("msg 구축 : " + msg.toString());
			
			Transport.send(msg);
			
		} catch(MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}



