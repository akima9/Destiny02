package com.destiny.web.act;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.Act.ActService;
import com.destiny.service.chatting.ChattingService;
import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.info.InfoService;
import com.destiny.service.meeting.MeetingService;
import com.destiny.service.review.ReviewService;
import com.destiny.service.user.UserService;

@Controller
@RequestMapping("/act/*")
public class ActController {

	//Field
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("infoServiceImpl")
	private InfoService infoService;
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	
	@Autowired
	@Qualifier("actServiceImpl")
	private ActService actService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	public ActController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="getWriteCommunityList/{userId}", method=RequestMethod.GET )
	public ModelAndView getWriteCommunityList(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("/act/getWriteCommunityList : GET + "+ userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = actService.getCommunityListByWriter(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getTotalCountByWriter")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/writeCommunityList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="getOpenMeetingList/{userId}", method=RequestMethod.GET)
	public ModelAndView getOpenMeetingList(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("act/getOpenMeetingList : GET + " + userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = actService.getMeetingListByMaster(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountByMaster")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getOpenMeetingList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="getJoinMeetingList/{userId}", method=RequestMethod.GET)
	public ModelAndView getJoinMeetingList(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("act/getJoinMeetingList : GET + " + userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ผ๖วเ
		//Map<String , Object> map=userService.getUserList(search);
		Map<String , Object> map = new HashMap<String, Object>();
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getJoinMeetingList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="getCommentListByWriter/{userId}", method=RequestMethod.GET)
	public ModelAndView getCommentListByWriter(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("act/getCommentListByWriter : GET + " + userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = actService.getCommentListByWriter(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getTotalCountByCommentSwiter")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getWriteCommentList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="getContactList/{userId}", method=RequestMethod.GET)
	public ModelAndView getContactList(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("act/getContactList : GET + " + userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = actService.getContactList(search, userId);
		
		List<String> fileList = new ArrayList<String>();
		
		for(Chatting  v : (List<Chatting>)map.get("list")) {
			if(v.getManId().equals(userId)) {
				fileList.add(userService.getUser(v.getWomanId()).getProfile());
			} else {
				fileList.add(userService.getUser(v.getManId()).getProfile());
			}
		}
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getTotalContact")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getContactList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("fileList", fileList);
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
}
