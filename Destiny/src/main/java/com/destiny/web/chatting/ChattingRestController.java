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
	/// Field

	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//// 여성 리스트와 남성 리스트를 담을 객체 생성
	private List<User> womanList = new ArrayList<User>();
	private List<User> manList = new ArrayList<User>();
	private List<User> perfectWomanList = new ArrayList<User>();
	private List<User> perfectManList = new ArrayList<User>();
	private List<Chatting> chattingList = new ArrayList<Chatting>();
	private int no;
	private int perfectNo;

	@ResponseBody
	@RequestMapping(value = "json/translate", method = RequestMethod.POST)

	public String chatGoogleTranslatePOST(@RequestBody JSONObject body, HttpSession session) throws Exception {
		System.out.println("chat 들어옴");
		System.out.println(body);
		// userId 가져옴
		User user = (User) session.getAttribute("me");
		String userId = user.getUserId();
		System.out.println("userId : " + userId);
		session.setAttribute("chat", userId);
		System.out.println("session에 저장된value : " + session.getAttribute("chat"));

		String q = (String) body.get("message");

		String query = URLEncoder.encode(q, "UTF-8");
		// 번역 받기 원하는 언어

		String target = (String) body.get("lang");
		// google translate api key
		String key = "AIzaSyBFXIiBAU7QfCf0fwndqoR63wwS0P8kNDM";

		//// 나중에 구현 20개의 문자 길이면 바로 번역 그 이상길이면 원본언어->일->target언어/////////////////////
		// int textLength=q.length();
		// if (textLength>20) {
		// 000+
		// }else {
		//
		// }

		/////////////////////////////////////////////////////////////////////////
		// google에 번역 요청
		String googleApi = "https://translation.googleapis.com/language/translate/v2?q=" + query + "&target=" + target
				+ "&model=nmt&key=" + key;

		URL url = new URL(googleApi);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");

		// post request

		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());

		wr.flush();
		wr.close();
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
		}
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		JSONObject jsonobj = (JSONObject) JSONValue.parse(response.toString());
		System.out.println("결과값 : " + jsonobj.get("data").toString());

		br.close();

		/// 번역된 Text 꺼내기////////////////////////////

		JSONObject data = (JSONObject) jsonobj.get("data");
		JSONArray translations = (JSONArray) data.get("translations");
		JSONObject translationsArr = (JSONObject) translations.get(0);
		String transText = (String) translationsArr.get("translatedText");

		System.out.println("translations" + (String) translations.toString());
		System.out.println("translationsArr :" + translations.get(0).toString());
		System.out.println("번역된 text :" + transText);
		///////////////////////////////////////
		return transText;
	}

	@RequestMapping(value = "json/addPerfectChatting", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addPerfectChatting(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/addPerfectChatting 들어옴");

		// ===========================================현재 접속자 구현 로직
		// part=================================================

		Chatting chatting = new Chatting();
		ServletContext applicationScope = request.getSession().getServletContext();
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		ModelAndView modelAndView = new ModelAndView();
		//// user가로그인 한 경우

		//// 아이디로 user정보를 가져온다.
		User dbUser = userService.getUser(user.getUserId());

		///// 여성일 경우
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("perfectWomanList") != null) {
				perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
			}
			perfectWomanList.add(dbUser);

			applicationScope.setAttribute("perfectWomanList", perfectWomanList);

			for (User v : perfectWomanList) {
				System.out.println("현재 이상형 채팅 여성 접속자 목록 : " + v);

			}
		} else {
			// 남성일 경우
			if (applicationScope.getAttribute("perfectManList") != null) {
				perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
			}
			perfectManList.add(dbUser);

			applicationScope.setAttribute("perfectManList", perfectManList);

			for (User v : perfectManList) {
				System.out.println("현재  이상형 채팅 남성 접속자 목록 : " + v);
			}
		}

		System.out.println("perfectManList.size() : " + perfectManList.size() + "perfectWomanList.size() : " + perfectWomanList.size());
		System.out.println("perfectManList : " + perfectManList + "perfectWomanList : " + perfectWomanList);

		map.put("perfectManList", perfectManList);
		map.put("perfectWomanList", perfectWomanList);

		// ====================================================================================================

		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭

		return map;
	}

	@RequestMapping(value = "json/getPerfectMatching", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPerfectMatching(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/getPerfectMatching 들어옴");

		// ===========================================현재 접속자 구현 로직
		// part=================================================

		Chatting chatting = new Chatting();
		Map<String, Object> map = new HashMap<String, Object>();
		ServletContext applicationScope = request.getSession().getServletContext();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		String userId = user.getUserId();
		ModelAndView modelAndView = new ModelAndView();
		//// user가로그인 한 경우

		//// 아이디로 user정보를 가져온다.
		User dbUser = userService.getUser(user.getUserId());

		///// 여성일 경우
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("perfectWomanList") != null) {
				perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
			}

			for (User v : perfectWomanList) {
				System.out.println("현재 이상형매칭 여성 접속자 목록 : " + v);

			}
		} else {
			// 남성일 경우
			if (applicationScope.getAttribute("perfectManList") != null) {
				perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
			}

			for (User v : perfectManList) {
				System.out.println("현재 이상형매칭  남성 접속자 목록 : " + v);
			}
		}

		System.out.println("perfectManList.size() : " + perfectManList.size() + "perfectWomanList.size() : " + perfectWomanList.size());
		System.out.println("perfectManList : " + perfectManList + "perfectWomanList : " + perfectWomanList);
		String man = null;
		String woman = null;
		int roomNo = 0;
		////이상형매칭/////////////////////////////////////////////////
		
		/////////////////////////////////////////////
		if (perfectManList.size() > perfectNo && perfectWomanList.size() > perfectNo) {
			//////// 매칭된 아이디 2개 넣기

			System.out.println("perfectManList==perfectWomanList");
			man = perfectManList.get(perfectNo).getUserId();
			woman = perfectWomanList.get(perfectNo).getUserId();
			chatting.setManId(man);
			chatting.setWomanId(woman);
			chatting.setContactMeeting("N");
			// addChatting
			System.out.println("man  : " + man + "  woman : " + woman);

			chattingService.addPerfectChatting(chatting);

			perfectNo++;

			map.put("perfectManList", perfectManList);
			map.put("perfectWomanList", perfectWomanList);

		}
		// get
		System.out.println("이상형매칭 getChatting");

		if (perfectNo > 0 && (perfectWomanList.get(perfectNo - 1).getUserId().equals(userId)
				|| perfectManList.get(perfectNo - 1).getUserId().equals(userId))) {
			Chatting resultChatting = chattingService.getChatting(userId);
			// roomName은 ChattingNo로 지정
			roomNo = resultChatting.getChattingNo();
			System.out.println("resultChatting : " + resultChatting);
			System.out.println("roomNo : " + roomNo);
			man = resultChatting.getManId();
			woman = resultChatting.getWomanId();
			map.put("womanId", woman);
			map.put("manId", man);
			map.put("roomNo", roomNo);
			map.put("perfectNo", perfectNo);
			session.setAttribute("chatting", resultChatting);
			chattingList.add(resultChatting);
			System.out.println("map : " + map);
		} else {
			map.put("womanId", woman);
			map.put("manId", man);
			map.put("roomNo", roomNo);
			Chatting emptyChatting = new Chatting();
			session.setAttribute("chatting", emptyChatting);
			System.out.println("map : " + map);
		}

		// ====================================================================================================

		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭

		return map;
	}

	@RequestMapping(value = "json/addRandomChatting", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addRandomChatting(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/addRandomChatting 들어옴");

		// ===========================================현재 접속자 구현 로직
		// part=================================================

		Chatting chatting = new Chatting();
		ServletContext applicationScope = request.getSession().getServletContext();
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		ModelAndView modelAndView = new ModelAndView();
		//// user가로그인 한 경우

		//// 아이디로 user정보를 가져온다.
		User dbUser = userService.getUser(user.getUserId());

		///// 여성일 경우
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("womanList") != null) {
				womanList = (List<User>) applicationScope.getAttribute("womanList");
			}
			womanList.add(dbUser);

			applicationScope.setAttribute("womanList", womanList);

			for (User v : womanList) {
				System.out.println("현재 랜덤채팅 여성 접속자 목록 : " + v);

			}
		} else {
			// 남성일 경우
			if (applicationScope.getAttribute("manList") != null) {
				manList = (List<User>) applicationScope.getAttribute("manList");
			}
			manList.add(dbUser);

			applicationScope.setAttribute("manList", manList);

			for (User v : manList) {
				System.out.println("현재 랜덤채팅 남성 접속자 목록 : " + v);
			}
		}

		System.out.println("manList.size() : " + manList.size() + "womanList.size() : " + womanList.size());
		System.out.println("manList : " + manList + "womanList : " + womanList);

		map.put("manList", manList);
		map.put("womanList", womanList);

		// ====================================================================================================

		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭

		return map;
	}

	@RequestMapping(value = "json/getRandomMatching", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getRandomMatching(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/getRandomMatching 들어옴");

		// ===========================================현제 접속자 구현 로직
		// part=================================================

		Chatting chatting = new Chatting();
		Map<String, Object> map = new HashMap<String, Object>();
		ServletContext applicationScope = request.getSession().getServletContext();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		String userId = user.getUserId();
		ModelAndView modelAndView = new ModelAndView();
		//// user가로그인 한 경우

		//// 아이디로 user정보를 가져온다.
		User dbUser = userService.getUser(user.getUserId());

		///// 여성일 경우
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("womanList") != null) {
				womanList = (List<User>) applicationScope.getAttribute("womanList");
			}

			for (User v : womanList) {
				System.out.println("현재 랜덤매칭 여성 접속자 목록 : " + v);

			}
		} else {
			// 남성일 경우
			if (applicationScope.getAttribute("manList") != null) {
				manList = (List<User>) applicationScope.getAttribute("manList");
			}

			for (User v : manList) {
				System.out.println("현재 랜덤매칭 남성 접속자 목록 : " + v);
			}
		}

		System.out.println("manList.size() : " + manList.size() + "womanList.size() : " + womanList.size());
		System.out.println("manList : " + manList + "womanList : " + womanList);
		String man = null;
		String woman = null;
		int roomNo = 0;

		if (manList.size() > no && womanList.size() > no) {
			//////// 매칭된 아이디 2개 넣기

			System.out.println("manList==womanList");
			man = manList.get(no).getUserId();
			woman = womanList.get(no).getUserId();
			chatting.setManId(man);
			chatting.setWomanId(woman);
			chatting.setContactMeeting("N");
			// addChatting
			System.out.println("man  : " + man + "  woman : " + woman);

			chattingService.addPerfectChatting(chatting);

			no++;
		

			map.put("manList", manList);
			map.put("womanList", womanList);

		}
		// get
		System.out.println("랜덤매칭 getChatting");

		if (no > 0 && (womanList.get(no - 1).getUserId().equals(userId)
				|| manList.get(no - 1).getUserId().equals(userId))) {
			Chatting resultChatting = chattingService.getChatting(userId);
			// roomName은 ChattingNo로 지정
			roomNo = resultChatting.getChattingNo();
			System.out.println("resultChatting : " + resultChatting);
			System.out.println("roomNo : " + roomNo);
			man = resultChatting.getManId();
			woman = resultChatting.getWomanId();
			map.put("womanId", woman);
			map.put("manId", man);
			map.put("roomNo", roomNo);
			map.put("no", no);
			session.setAttribute("chatting", resultChatting);
			chattingList.add(resultChatting);
			System.out.println("map : " + map);
		} else {
			map.put("womanId", woman);
			map.put("manId", man);
			map.put("roomNo", roomNo);
			Chatting emptyChatting = new Chatting();
			session.setAttribute("chatting", emptyChatting);
			System.out.println("map : " + map);
		}

		// ====================================================================================================

		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭

		return map;
	}

	
	@RequestMapping(value="json/endRandomMatching", method=RequestMethod.GET)
	public String endRandomMatching(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("endRandomMatching 들어옴");
		//매칭 완료 전 나갈 경우
		String result="";
		User user=(User)session.getAttribute("me");
		String userId=user.getUserId();
		ServletContext applicationScope = request.getSession().getServletContext();
		
		//여성일 경우
				if (user.getGender().equals("W")) {
					if (applicationScope.getAttribute("womanList")!=null) {
						womanList=(List<User>) applicationScope.getAttribute("womanList");
						for (int i = no; i < womanList.size(); i++) {
							if (womanList.get(i).getUserId().equals(userId)) {
								womanList.remove(i);
								result="Random 여성 랜덤 대기자 지워짐";
							}
						}
					}
					
				//남성일 경우
				}else {
					if (applicationScope.getAttribute("manList")!=null) {
						manList=(List<User>) applicationScope.getAttribute("manList");
						for (int j = no; j < manList.size(); j++) {
							if (manList.get(j).getUserId().equals(userId)) {
								manList.remove(j);
								result="Random 남성 랜덤 대기자 지워짐";
							}
						}
					}					
				}
		
		System.out.println("remove=manList.size() : " + manList.size() + "womanList.size() : " + womanList.size());
		System.out.println("remove=manList : " + manList + "womanList : " + womanList);
		System.out.println(result);
		
		
		
		return result;
	}
	
	@RequestMapping(value="json/endPerfectMatching", method=RequestMethod.GET)
	public String endPerfectMatching(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("endPerfectMatching 들어옴");
		
		
			//매칭 완료 전 나갈 경우//////////////////////////////////////////////////////////
			String result="";
			User user=(User)session.getAttribute("me");
			String userId=user.getUserId();
			ServletContext applicationScope = request.getSession().getServletContext();
		
			//여성일 경우
			if (user.getGender().equals("W")) {
				if (applicationScope.getAttribute("perfectWomanList")!=null) {
					perfectWomanList=(List<User>) applicationScope.getAttribute("perfectWomanList");
					for (int i = perfectNo; i < perfectWomanList.size(); i++) {
						if (perfectWomanList.get(i).getUserId().equals(userId)) {
							perfectWomanList.remove(i);
							result="Perfect 여성 이상형 대기자 지워짐";
						}
					}
				}
				
			//남성일 경우
			}else {
				if (applicationScope.getAttribute("perfectManList")!=null) {
					perfectManList=(List<User>) applicationScope.getAttribute("perfectManList");
					for (int j = perfectNo; j < perfectManList.size(); j++) {
						if (perfectManList.get(j).getUserId().equals(userId)) {
							perfectManList.remove(j);
							result="Perfect 남성 이상형 대기자 지워짐";
						}
					}
				}
			}
			//////////////////////////////////////////////////////////////////////////////////////////////
		
		
		System.out.println("remove=perfectManList : " + perfectManList + "perfectWomanList : " + perfectWomanList);
		System.out.println("remove=perfectManList.size() : " + perfectManList.size() + "perfectWomanList.size() : " + perfectWomanList.size());
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping(value="json/endPerfectChatting", method=RequestMethod.GET)
	public String endPerfectChatting(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("endPerfectMatching 들어옴");
	//채팅 방을 나갈경우/////////////////////////////////////////////////////////////////////////////////////////////
		Chatting outUserChatting=(Chatting)session.getAttribute("chatting");
		int chattingNo=outUserChatting.getChattingNo();
		
		if (chattingNo!=0) {
			Chatting emptyChatting = new Chatting();
			session.setAttribute("chatting", emptyChatting);
			
		}else {
			
		}
		return null;
	}
}
