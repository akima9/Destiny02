package com.destiny.web.info;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Community;

@Controller
@RequestMapping("/info/*")
public class InfoController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	///Constructor
	public InfoController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Method
	
	/*getRestaurantInfoList.jsp로 단순 Navigation : start*/
	@RequestMapping(value="listRestaurantInfo", method=RequestMethod.GET)
	public ModelAndView listRestaurantInfo() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/community/getRestaurantInfoList.jsp");
		return modelAndView;
	}
	/*getRestaurantInfoList.jsp로 단순 Navigation : end*/
	
	
	/*addRestaurantInfo.jsp로 단순 Navigation : start*/
	@RequestMapping(value="addRestaurantInfo", method=RequestMethod.GET)
	public ModelAndView addRestaurantInfo() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/community/addRestaurantInfo.jsp");
		return modelAndView;
	}
	/*addRestaurantInfo.jsp로 단순 Navigation : end*/
	
	/*addRestaurantInfo : start*/
	@RequestMapping(value="addRestaurantInfo", method=RequestMethod.POST)
	public ModelAndView addRestaurantInfo(@ModelAttribute("community") Community community) throws Exception{
		System.out.println(":: InfoController/addRestaurantInfo/post : 실행");
		
		/*Business Logic : start*/
		community.setWriterId("kimgiyong");
		community.setCategory("RES");
		community.setUserGrade("NOR");
		/*community.setTitle(title);*/
		community.setWriterNickName("javaKing");
		/*community.setDetail(detail);*/
		community.setViews(0);
		community.setLike(0);
		community.setImportRank("N");
		community.setViewCondition("DEF");
		
		System.out.println(":: InfoController/addRestaurantInfo/post의 community : "+community);
		/*Business Logic : end*/
		
		ModelAndView modelAndView = new ModelAndView();
		communityService.addCommunity(community);
		modelAndView.setViewName("/community/addRestaurantInfoConfirm.jsp");
		return modelAndView;
	}
	/*addRestaurantInfo : end*/
	
	@RequestMapping(value="imgUpload", method=RequestMethod.POST)
	public ModelAndView imgUpload(HttpServletRequest request) throws Exception{
		
		
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
}
