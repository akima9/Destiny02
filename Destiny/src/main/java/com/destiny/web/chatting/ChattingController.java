package com.destiny.web.chatting;

import java.util.ArrayList;
import java.util.List;

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
				ServletContext applicationScope = request.getSession().getServletContext();
				User user=(User)session.getAttribute("user");
				User dbUser=userService.getUser(user.getUserId());
				List<User> loginList = new ArrayList<User>();
				ModelAndView modelAndView = new ModelAndView();
				if(applicationScope.getAttribute("loginList") != null) {
					loginList = (List<User>) applicationScope.getAttribute("loginList");
				}
				
				int numberOfLogin = 0;
				
				if(applicationScope.getAttribute("numberOfLogin") != null) {
					numberOfLogin = (int) applicationScope.getAttribute("numberOfLogin");
				}

				if( user.getPassword().equals(dbUser.getPassword())){
					
					if(loginList.contains(user.getUserId())) {

						loginList.add(dbUser);
						
						numberOfLogin++;
						
						applicationScope.setAttribute("loginList", loginList);
						applicationScope.setAttribute("numberOfLogin", numberOfLogin);
						for(User v : loginList) {
							System.out.println("���� ������ ��� : " + v);
						}
						System.out.println("���� ������ : " + numberOfLogin);
						String userId=user.getUserId();
						
						modelAndView.setViewName("redirect:/chatting/getTelepathyTest.jsp");
						modelAndView.addObject("result", "Success");
						modelAndView.addObject(dbUser.getUserId(), dbUser);
					
					} else {
						System.out.println("�̹� �α��ε� ȸ���Դϴ�.");
						modelAndView.addObject("result", "Fail");
					}
					
				} else {
					modelAndView.addObject("result", "Fail");
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
	public ModelAndView addPerfectChatting(HttpSession session) throws Exception{
		
		// user�� ���̵��ʿ� ������ ��������, �̻��� ������ ���� ��Ī
		//ä�ù� ����
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/chatting/getPerfectChatting.jsp");
		return modelAndView;
	}
}
