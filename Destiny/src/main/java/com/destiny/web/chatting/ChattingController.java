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
			System.out.println("telepathyTest들어옴");
		//===========================================현제 접속자 구현 로직 part=================================================
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
							System.out.println("현제 접속자 목록 : " + v);
						}
						System.out.println("현제 접속자 : " + numberOfLogin);
						String userId=user.getUserId();
						
						modelAndView.setViewName("redirect:/chatting/getTelepathyTest.jsp");
						modelAndView.addObject("result", "Success");
						modelAndView.addObject(dbUser.getUserId(), dbUser);
					
					} else {
						System.out.println("이미 로그인된 회원입니다.");
						modelAndView.addObject("result", "Fail");
					}
					
				} else {
					modelAndView.addObject("result", "Fail");
				}
				//====================================================================================================
				
		//매칭(클릭한 사람들 중 남녀 한명씩 선정) 후 telepathy로 navigation 문제3개와 user두명의 아이디 값을 보낸다.
		//getTelepathy()
		
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="addRandomChatting", method=RequestMethod.GET)
	public ModelAndView addRandomChatting(HttpSession session) throws Exception{
		
		//telepathy 선택 답안과 user두명의 아이디 값을 보낸다. 채팅방 생성
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addRandomChatting", method=RequestMethod.POST, consumes = "application/json")
	public ModelAndView addRandomChattingPost(HttpSession session, @RequestBody String body) throws Exception{
		
		//telepathy 선택 답안과 user두명의 아이디 값을 보낸다. 채팅방 생성
		System.out.println("node"+body);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addPerfectChatting", method=RequestMethod.GET)
	public ModelAndView addPerfectChatting(HttpSession session) throws Exception{
		
		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭
		//채팅방 생성
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/chatting/getPerfectChatting.jsp");
		return modelAndView;
	}
}
