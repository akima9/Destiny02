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
	
	
////���� ����Ʈ�� ���� ����Ʈ�� ���� ��ü ����
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
					System.out.println("manList.size() : "+manList.size()+"womanList.size() : "+womanList.size());
					System.out.println("manList : "+manList+"womanList : "+womanList);
					if (manList.size()>0 && womanList.size()>0) {
						////////��Ī�� ���̵� 2�� �ֱ�
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
						Chatting resultChatting=chattingService.getChatting(chatting);
						//roomName�� ChattingNo�� ����
						roomNo=resultChatting.getChattingNo();
						System.out.println("resultChatting : "+resultChatting);
						System.out.println("roomNo : "+roomNo);
						/////////////////////////////////////////
						//�̽����ɹ���
						Map<String, Object> map=chattingService.listTelepathy(roomNo);
						System.out.println("�̽����� ����, chattingNo : "+map);
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
		System.out.println("addRandomChatting����");
		//telepathy ���� ��Ȱ� user�θ��� ���̵� ���� ������. ä�ù� ����
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addRandomChatting", method=RequestMethod.POST, consumes = "application/json")
	public ModelAndView addRandomChattingPost(HttpSession session, @RequestBody String body) throws Exception{
		
		//telepathy ���� ��Ȱ� user�θ��� ���̵� ���� ������. ä�ù� ����
		System.out.println("node"+body);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addPerfectChatting", method=RequestMethod.GET)
	public ModelAndView addPerfectChatting(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("addPerfectChatting ����");
		
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
			//////////////////////////////
			////�̻��� ��Ī
			//////////////////////////////
			String man=null;
			String woman=null;
			int roomNo=0;
			System.out.println("manList.size() : "+manList.size()+"womanList.size() : "+womanList.size());
			System.out.println("manList : "+manList+"womanList : "+womanList);
			if (manList.size()>0 && womanList.size()>0) {
				////////��Ī�� ���̵� 2�� �ֱ�
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
				Chatting resultChatting=chattingService.getChatting(chatting);
				//roomName�� ChattingNo�� ����
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
			
			}	

				
			
			
			
							
		}else { 
			////�α��� ���� ���� ���
			System.out.println("�α��� ����");
			modelAndView.setViewName("index.jsp");
		}
		
		
		
		//====================================================================================================
		
		// user�� ���̵��ʿ� ������ ��������, �̻��� ������ ���� ��Ī
		
		
		return modelAndView;
	}
}
