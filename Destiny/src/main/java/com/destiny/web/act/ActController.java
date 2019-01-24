package com.destiny.web.act;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;
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
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
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
		modelAndView.addObject("listCommentCount", map.get("listCommentCount"));
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
	
	@RequestMapping(value="getCrewList/{meetingNo}", method=RequestMethod.GET)
	public ModelAndView getCrewList(@PathVariable("meetingNo") int meetingNo) throws Exception {
		System.out.println("act/getCrewList : GET + " + meetingNo);
		
		List<Meeting> list = actService.getCrewAll(meetingNo);
		
		List<Meeting> listAPL = new ArrayList<Meeting>();
		List<Meeting> listYES = new ArrayList<Meeting>();
		
		for(Meeting v : list) {
			if(!v.getRole().equals("MST"))
			{
				if(v.getCrewCondition().equals("APL")) {
					listAPL.add(v);
				} else if (v.getCrewCondition().equals("YES")) {
					listYES.add(v);
				}
			}
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getCrewList.jsp");
		modelAndView.addObject("listAPL", listAPL);
		modelAndView.addObject("listYES", listYES);
		modelAndView.addObject("meetingNo", meetingNo);
		return modelAndView;
	}
	
	@RequestMapping(value="judgmentApply/{judgment}/{meetingNo}/{userId}", method=RequestMethod.GET)
	public ModelAndView judgmentApply(@PathVariable("judgment") String judgment, @PathVariable("meetingNo") int meetingNo, @PathVariable("userId") String userId) throws Exception{
		
		System.out.println("act/judgmentApply : GET + " + judgment + " + " + meetingNo);
		
		Meeting meeting = new Meeting();
		
		if(judgment.equals("yes")) {
			meeting.setCrewCondition("YES");
			meeting.setMeetingMasterId(userId);
			
			actService.updateCrewCondition(meeting);
		} else if(judgment.equals("no")) {
			actService.delectCrew(userId);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/act/getCrewList/"+meetingNo);
		return modelAndView;
	}
	
	
	@RequestMapping(value="getMeetingAct/{meetingNo}", method=RequestMethod.GET)
	public ModelAndView getMeetingAct(@PathVariable("meetingNo") int meetingNo) throws Exception{
		
		System.out.println("act/getMeetingAct : GET + " + meetingNo);
		
		List<Meeting> list = actService.getMeetingAct(meetingNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getMeetingAct.jsp");
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	@RequestMapping(value="getActCrew/{meetingActNo}/{meetingActCount}", method=RequestMethod.GET)
	public ModelAndView getActCrew(@PathVariable("meetingActNo") int meetingActNo, @PathVariable("meetingActCount") int meetingActCount) throws Exception{
		
		System.out.println("act/getActCrew : GET + "+meetingActNo+" + "+meetingActCount);
		
		Meeting meeting = new Meeting();
		meeting.setMeetingActNo(meetingActNo);
		meeting.setMeetingActCount(meetingActCount);
		
		List<String> listString = actService.getActCrew(meeting);
		List<User> list = new ArrayList<User>();
		
		for(String v : listString) {
			list.add(userService.getUser(v));
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getActCrew.jsp");
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	@RequestMapping(value="getJoinMeetingList/{userId}", method=RequestMethod.GET)
	public ModelAndView getJoinMeetingList(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("act/getJoinMeetingList : GET + " + userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = actService.getMeetingListByApply(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getTotalCountByApply")).intValue(), pageUnit, pageSize);
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
		
		Map<String, Object> map = actService.getCommentListByWriter(search, userId);
		
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
	
	@RequestMapping(value="addStoryView", method=RequestMethod.GET)
	public ModelAndView addStoryView() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/addStory.jsp");
		return modelAndView;
	}
	
	/*addRestaurantInfo : start*/
	@RequestMapping(value="addStory", method=RequestMethod.POST)
	public ModelAndView addStory(@ModelAttribute("community") Community community, HttpSession session) throws Exception{
		System.out.println(":: ActController/addStory/post : Ω««‡");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		String nickName = user.getNickName();
		String userGrade = user.getUserGrade();
		System.out.println("userId :: " + userId);
		System.out.println("nickName : "+nickName);
		System.out.println("userGrade : "+userGrade);
		
		community.setWriterId(userId);
		community.setCategory("RES");
		community.setUserGrade(userGrade);
		community.setWriterNickName(nickName);
		community.setViews(0);
		community.setLike(0);
		community.setImportRank("N");
		community.setViewCondition("DEF");
		
		System.out.println(":: ActController/addStory/post¿« community : "+community);
		
		ModelAndView modelAndView = new ModelAndView();
		communityService.addCommunity(community);
		modelAndView.setViewName("/user/userAct/addStoryConfirm.jsp");
		return modelAndView;
	}
	/*addRestaurantInfo : end*/
	
}
