package com.destiny.web.find;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Find;
import com.destiny.service.find.FindService;

@Controller
@RequestMapping("/find/*")
public class FindController {
	
	///Field
		@Autowired
		@Qualifier("findServiceImpl")
		private FindService findService;
		
		///Constructor
		public FindController() {
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		///Method
		@RequestMapping(value="mainFind", method=RequestMethod.GET)
		public ModelAndView mainFind() throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/find/mainFind.jsp");
			return modelAndView;
		}
		
		@RequestMapping(value="selectUser", method=RequestMethod.GET)
		public ModelAndView selectUser() throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/find/selectUser.jsp");
			return modelAndView;
		}
		
		@RequestMapping(value="getUserResult", method=RequestMethod.POST)
		public ModelAndView getUserResult(@ModelAttribute("find") Find find) throws Exception{
			System.out.println("/find/getUserResult : POST");
			System.out.println("FIND : "+ find +"======================");
			
			System.out.println("?!?! : " + find.getSelectInterest());
			
			find.setSelectInterest01(find.getSelectInterest().split(",")[0]);
			find.setSelectInterest02(find.getSelectInterest().split(",")[1]);
			find.setSelectInterest03(find.getSelectInterest().split(",")[2]);
			
			System.out.println("first : " +find.getSelectInterest01());
			System.out.println("second : " + find.getSelectInterest02());
			System.out.println("third : " + find.getSelectInterest03());
			
			int totalCount = findService.getUserResult(find);
			
			System.out.println("FindMapper.getUserResult °¬´Ù¿È / totalCount: " + totalCount);
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("totalCount",totalCount);
			modelAndView.setViewName("forward:/find/getUserResult.jsp");
			return modelAndView;
		}
		
		@RequestMapping(value="selectMeeting", method=RequestMethod.GET)
		public ModelAndView selectMeeting() throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/find/selectMeeting.jsp");
			return modelAndView;
		}
				
		@RequestMapping(value="getMeetingResult", method=RequestMethod.POST)
		public ModelAndView getMeetingResult(@ModelAttribute("find") Find find) throws Exception{
			System.out.println("/find/getMeetingResult : POST");
			System.out.println("FIND : "+ find +"======================");
			
			Map<String, Object> map = findService.getMeetingResult(find);
			
			ModelAndView modelAndView = new ModelAndView();
			//modelAndView.addObject("list",map.get("list")); 
			modelAndView.setViewName("forward:/find/getMeetingResult.jsp");
			return modelAndView;
		}

}
