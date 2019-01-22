package com.destiny.web.chatting;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.chatting.ChattingService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserService;

@Controller
@RequestMapping("/chatting/*")
public class ChattingController {
	
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
	
	
	///Constructor
	public ChattingController() {
		System.out.println(this.getClass());
	}
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
	///Method
	
	@RequestMapping(value="mainChatting", method=RequestMethod.GET)
	public ModelAndView mainChatting() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/chatting/mainChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="telepathyTest", method=RequestMethod.GET)
	public ModelAndView telepathyTest(HttpSession session, HttpServletRequest request) throws Exception{
			System.out.println("telepathyTest들어옴");
		
			//===========================================현제 접속자 구현 로직 part=================================================
				
				//채팅방 생성
				Chatting chatting=new Chatting();
				
				ServletContext applicationScope = request.getSession().getServletContext();
				User user=(User)session.getAttribute("me");
				String userId=user.getUserId();
				System.out.println("user"+user);
				ModelAndView modelAndView = new ModelAndView();
				////user가로그인 한 경우
				if (user.getUserId()!=null) {
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
					String man=null;
					String woman=null;
					int roomNo=0;
					System.out.println("manList.size() : "+manList.size()+"womanList.size() : "+womanList.size());
					System.out.println("manList : "+manList+"womanList : "+womanList);
					if (manList.size()>0 && womanList.size()>0) {
						////////매칭된 아이디 2개 넣기
						//		chatting.setManId(manId);
						//		chatting.setWomanId(womanId);
						/////////test
						System.out.println("manList==womanList");
						woman=womanList.get(0).getUserId();
						man=manList.get(0).getUserId();
						//addChatting
						System.out.println("man  : "+man+"  woman : "+woman);
						chatting.setManId(man);
						chatting.setWomanId(woman);
						chatting.setContactMeeting("N");
						
						chattingService.addPerfectChatting(chatting);
						
						//getChatting NO
						Chatting resultChatting=chattingService.getChatting(userId);
						//roomName은 ChattingNo로 지정
						roomNo=resultChatting.getChattingNo();
						System.out.println("resultChatting : "+resultChatting);
						System.out.println("roomNo : "+roomNo);
						
						////대기상태//////////////////////////////
						
						//////////////////////////////////
						/////////////////////////////////////////
						//이심전심문항
						Map<String, Object> map=chattingService.listTelepathy(roomNo);
						System.out.println("이심전심 문항, chattingNo : "+map);
						List<Telepathy> list01=(List<Telepathy>)map.get("list");
						System.out.println(list01);
						/////////////////////////////////////
					
						modelAndView.setViewName("/chatting/getTelepathyTest.jsp");
						modelAndView.addObject("result", "Success");
						modelAndView.addObject("womanId", woman);
						modelAndView.addObject("manId", man);
						modelAndView.addObject("roomNo", roomNo);
						modelAndView.addObject("list", list01);
					
						womanList.remove(0);
						manList.remove(0);
					}else {
						
					}

						
					
					
					
									
				}else { 
					////로그인 하지 않은 경우
					System.out.println("로그인 안함");
					modelAndView.setViewName("index.jsp");
				}
				
				
				
				//====================================================================================================
				
		//매칭(클릭한 사람들 중 남녀 한명씩 선정) 후 telepathy로 navigation 문제3개와 user두명의 아이디 값을 보낸다.
		//getTelepathy()
		
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="addRandomChatting", method=RequestMethod.GET)
	public ModelAndView addRandomChatting(HttpSession session) throws Exception{
		System.out.println("addRandomChatting들어옴");
		//telepathy 선택 답안과 user두명의 아이디 값을 보낸다. 채팅방 생성
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addRandomChatting", method=RequestMethod.POST, consumes = "application/json")
	public ModelAndView addRandomChattingPost(HttpSession session, @RequestBody String body) throws Exception{
		
		//telepathy 선택 답안과 user두명의 아이디 값을 보낸다. 채팅방 생성
		System.out.println("node"+body);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addPerfectChatting", method=RequestMethod.GET)
	public ModelAndView addPerfectChatting(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("addPerfectChatting 들어옴");
		
		//===========================================현제 접속자 구현 로직 part=================================================
		
		//채팅방 생성
		Chatting chatting=new Chatting();
		
		ServletContext applicationScope = request.getSession().getServletContext();
		if(applicationScope.getAttribute("womanList") != null) {
			womanList = (List<User>) applicationScope.getAttribute("womanList");
		}
		if(applicationScope.getAttribute("manList") != null) {
			manList = (List<User>) applicationScope.getAttribute("manList");
		}
		User user=(User)session.getAttribute("me");
		String userId=user.getUserId();
		System.out.println("user"+user);
		ModelAndView modelAndView = new ModelAndView();
		////user가로그인 한 경우
		if (user.getUserId()!=null) {
			////아이디로 user정보를 가져온다.
			User dbUser=userService.getUser(user.getUserId());
			
		
			
			//////////////////////////////
			////이상형 매칭
			//////////////////////////////
			String man=null;
			String woman=null;
			int roomNo=0;
			System.out.println("manList.size() : "+manList.size()+"womanList.size() : "+womanList.size());
			System.out.println("manList : "+manList+"womanList : "+womanList);
		
			//남녀매칭////////////////////////
//			MyThreadTask task1 = new MyThreadTask();
//			MyThreadTask task2 = new MyThreadTask();
//			MyThreadTask task3 = new MyThreadTask();
//
//			Thread thread1 = new Thread(task1,"firstThread");
//			Thread thread2 = new Thread(task2,"secondThread");
//			Thread thread3 = new Thread(task3,"thirdThread");
//			thread1.start();
//			thread2.start();
//			thread3.start();
					if(manList.size()>0 && womanList.size()>0) {
						////////매칭된 아이디 2개 넣기
						//		chatting.setManId(manId);
						//		chatting.setWomanId(womanId);
						/////////test
						try{ 
							System.out.println("manList==womanList");
							woman=womanList.get(0).getUserId();
							man=manList.get(0).getUserId();
							//addChatting
							System.out.println("man  : "+man+"  woman : "+woman);
							chatting.setManId(man);
							chatting.setWomanId(woman);
							chatting.setContactMeeting("N");
							
							chattingService.addPerfectChatting(chatting);
							
							//getChatting NO
							Chatting resultChatting=chattingService.getChatting(userId);
							//roomName은 ChattingNo로 지정
							roomNo=resultChatting.getChattingNo();
							System.out.println("resultChatting : "+resultChatting);
							System.out.println("roomNo : "+roomNo);
							
							modelAndView.setViewName("/chatting/getPerfectChatting.jsp");
							modelAndView.addObject("result", "Success");
							modelAndView.addObject("womanId", woman);
							modelAndView.addObject("manId", man);
							modelAndView.addObject("roomNo", roomNo);
							womanList.remove(0);
							manList.remove(0);
							
					     } catch (Exception e){
					      e.printStackTrace();
					      
					     }
					
				
					
				
			}
			
			
			////////////////////////
			

				
			
			
			
							
		}else { 
			////로그인 하지 않은 경우
			System.out.println("로그인 안함");
			modelAndView.setViewName("index.jsp");
		}
		
		
		
		//====================================================================================================
		
		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="getPerfectChatting/{roomNo}", method=RequestMethod.GET)
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
	
	@RequestMapping(value="endChatting", method=RequestMethod.GET)
	public ModelAndView endChatting(@PathVariable int roomNo,HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("endChatting 들어옴");
		ModelAndView modelAndView = new ModelAndView();
		Chatting emptyChatting=new Chatting();
		session.setAttribute("chatting", emptyChatting);
		modelAndView.addObject("채팅방 나감");
		return modelAndView;
	}
}
