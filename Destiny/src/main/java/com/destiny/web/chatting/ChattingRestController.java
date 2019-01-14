package com.destiny.web.chatting;

import java.util.Locale;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		System.out.println("nodeConn ¿¬°á");
		JSONObject cred = new JSONObject();
        JSONObject auth=new JSONObject();
        JSONObject parent=new JSONObject();
        cred.put("username","adm");
        cred.put("password", "pwd");
        auth.put("tenantName", "adm");
        auth.put("passwordCredentials", cred);
        parent.put("auth", auth);

        URLCOnn conn = new URLCOnn("http://192.168.0.28",1516);
        conn.urlPost(parent);

       

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("index");
		modelAndView.setViewName("redirect:/chatting/mainChatting.jsp");
		return modelAndView;
	}
}
