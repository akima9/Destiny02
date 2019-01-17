package com.destiny.web.chatting;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	private int count;
	
	
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
			System.out.println("telepathyTest����");
		//===========================================���� ������ ���� ���� part=================================================
				
				//ä�ù� ����
				Chatting chatting=new Chatting();
				
				ServletContext applicationScope = request.getSession().getServletContext();
				User user=(User)session.getAttribute("me");
				System.out.println("user"+user);
				ModelAndView modelAndView = new ModelAndView();
				////user���α��� �� ���
				if (user.getUserId()!=null) {
					////���̵�� user������ �����´�.
					User dbUser=userService.getUser(user.getUserId());
					////���� ����Ʈ�� ���� ����Ʈ�� ���� ��ü ����
					List<User> womanList = new ArrayList<User>();
					List<User> manList = new ArrayList<User>();
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
					String man=null;
					String woman=null;
					int roomNo=0;
					if (manList.size()==womanList.size()) {
						////////��Ī�� ���̵� 2�� �ֱ�
						//		chatting.setManId(manId);
						//		chatting.setWomanId(womanId);
						/////////test
						woman=womanList.get(count).getUserId();
						man=manList.get(count).getUserId();
						//addChatting
						System.out.println("man  : "+man+"  woman : "+woman);
						chatting.setManId(man);
						chatting.setWomanId(woman);
						chatting.setContactMeeting("N");
						
						chattingService.addPerfectChatting(chatting);
						count++;
						//getChatting NO
						Chatting resultChatting=chattingService.getChatting(chatting);
						//roomName�� ChattingNo�� ����
						roomNo=resultChatting.getChattingNo();
						System.out.println("resultChatting : "+resultChatting);
						System.out.println("roomNo : "+roomNo);
						/////////////////////////////////////////
						//�̽����ɹ���
						Map<String, Object> map=chattingService.listTelepathy(roomNo);
						System.out.println("�̽����� ����, chattingNo : "+map);
						/////////////////////////////////////
						modelAndView.setViewName("redirect:/chatting/getTelepathyTest.jsp");
						modelAndView.addObject("result", "Success");
						modelAndView.addObject("womanId", woman);
						modelAndView.addObject("manId", man);
						modelAndView.addObject("roomNo", roomNo);
						modelAndView.addObject("Telepathy", map);
					
					}	

						
					
					
					
									
				}else { 
					////�α��� ���� ���� ���
					System.out.println("�α��� ����");
					modelAndView.setViewName("index.jsp");
				}
				
				
				
				//====================================================================================================
				
		//��Ī(Ŭ���� ����� �� ���� �Ѹ� ����) �� telepathy�� navigation ����3���� user�θ��� ���̵� ���� ������.
		//getTelepathy()
		
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="addRandomChatting", method=RequestMethod.GET)
	public ModelAndView addRandomChatting(HttpSession session) throws Exception{
		
		//telepathy ���� ��Ȱ� user�θ��� ���̵� ���� ������. ä�ù� ����
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addRandomChatting", method=RequestMethod.POST, consumes = "application/json")
	public ModelAndView addRandomChattingPost(HttpSession session, @RequestBody String body) throws Exception{
		
		//telepathy ���� ��Ȱ� user�θ��� ���̵� ���� ������. ä�ù� ����
		System.out.println("node"+body);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addPerfectChatting", method=RequestMethod.GET)
	public ModelAndView addPerfectChatting(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("addPerfectChatting ����");
		
		//===========================================���� ������ ���� ���� part=================================================
				
				ServletContext applicationScope = request.getSession().getServletContext();
				User user=(User)session.getAttribute("me");
				ModelAndView modelAndView = new ModelAndView();
				if (!user.getUserId().isEmpty()) {
					User dbUser=userService.getUser(user.getUserId());
					List<User> loginList = new ArrayList<User>();
					
						if(applicationScope.getAttribute("loginList") != null) {
							loginList = (List<User>) applicationScope.getAttribute("loginList");
						}
						loginList.add(dbUser);
							
						applicationScope.setAttribute("loginList", loginList);
							
						for(User v : loginList) {
							System.out.println("���� ������ ��� : " + v);
						}
						///////////////////////////////////
						//�̻�����Ī
						//////////////////////////////////
					
						modelAndView.setViewName("/chatting/getPerfectChatting.jsp");
						modelAndView.addObject("result", "Success");
						modelAndView.addObject(dbUser.getUserId(), dbUser);
					
									
				}else {
					modelAndView.setViewName("redirect:/user/userInfo/loginView.jsp");
				}
				
				
				
				//====================================================================================================
				
		// user�� ���̵��ʿ� ������ ��������, �̻��� ������ ���� ��Ī
		//ä�ù� ����
		Chatting chatting=new Chatting();

		////////��Ī�� ���̵� 2�� �ֱ�
		//		chatting.setManId(manId);
		//		chatting.setWomanId(womanId);
		/////////test
		chatting.setManId("aaaaa");
		chatting.setWomanId("aaaab");
		chatting.setContactMeeting("N");
		chattingService.addPerfectChatting(chatting);
		
		return modelAndView;
	}
}
