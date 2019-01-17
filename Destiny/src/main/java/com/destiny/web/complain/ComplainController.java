package com.destiny.web.complain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.complain.ComplainService;
import com.destiny.service.domain.Complain;

@Controller
@RequestMapping("/complain/*")
public class ComplainController {
	
	///Field
		@Autowired
		@Qualifier("complainServiceImpl")
		private ComplainService complainService;
		
		///Constructor
		public ComplainController() {
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		/*addComplain.jsp로 단순 Navigation : start*/
		@RequestMapping(value="addComplain", method=RequestMethod.GET)
		public ModelAndView addComplain() throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/complain/addComplain.jsp");
			return modelAndView;
		}
		/*addComplain.jsp로 단순 Navigation : end*/
		
		/*addComplain : start*/
		@RequestMapping(value="addComplain", method=RequestMethod.POST)
		public ModelAndView addRestaurantInfo(@ModelAttribute("complain") Complain complain) throws Exception{
			System.out.println(":: ComplainController/addComplain/post : 실행");
			
			/*Business Logic : start*/
			complain.setComplainerId("kimgiyong");
			complain.setDefendantId("aaaaa");
//			complain.setUserGrade("NOR");
//			/*community.setTitle(title);*/
//			complain.setWriterNickName("javaKing");
//			/*community.setDetail(detail);*/
//			complain.setViews(0);
//			complain.setLike(0);
//			complain.setImportRank("N");
//			complain.setViewCondition("DEF");
			
			System.out.println(":: ComplainController/addComplain/post의 complain : "+complain);
			/*Business Logic : end*/
			
			ModelAndView modelAndView = new ModelAndView();
			complainService.addComplain(complain);
			modelAndView.setViewName("/complain/addComplain.jsp");
			return modelAndView;
		}
		/*addComplain : end*/

}
