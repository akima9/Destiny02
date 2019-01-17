package com.destiny.web.complain;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.community.CommunityService;
import com.destiny.service.complain.ComplainService;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Complain;
import com.destiny.service.domain.Meeting;
import com.destiny.service.meeting.MeetingService;

@Controller
@RequestMapping("/complain/*")
public class ComplainController {
	
	///Field
		@Autowired
		@Qualifier("complainServiceImpl")
		private ComplainService complainService;
		
		@Autowired
		@Qualifier("meetingServiceImpl")
		private MeetingService meetingService;
		
		@Autowired
		@Qualifier("communityServiceImpl")
		private CommunityService communityService;
		
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
		public ModelAndView addComplain(@ModelAttribute("community") Community community, @ModelAttribute("meeting") Meeting meeting) throws Exception{
			
			System.out.println(":: ComplainController/addComplain/GET : 실행");
			int communityNo = community.getCommunityNo();
			int meetingNo = meeting.getMeetingNo();
				
			ModelAndView modelAndView = new ModelAndView();
			if(communityNo != 0) {
				modelAndView.addObject("community", communityService.getCommunity(communityNo));
			} else if(meetingNo != 0) {
				modelAndView.addObject("meeting", meetingService.getMeeting(meetingNo));
			}
			modelAndView.setViewName("forward:/complain/addComplain.jsp");
			return modelAndView;
		}
		/*addComplain.jsp로 단순 Navigation : end*/
		
		/*addComplain : start*/
		@RequestMapping(value="addComplain", method=RequestMethod.POST)
		public ModelAndView addRestaurantInfo(@ModelAttribute("complain") Complain complain, @ModelAttribute("community") Community community, @ModelAttribute("meeting") Meeting meeting) throws Exception{
			System.out.println(":: ComplainController/addComplain/post : 실행");
			int communityNo = community.getCommunityNo();
			int meetingNo = meeting.getMeetingNo();
			
			if(communityNo != 0) {
				complain.setComplainerId(community.getWriterId());
				complain.setDefendantId(community.getWriterId());
				complain.setCommunityNo(communityNo);
			}else if(meetingNo != 0) {
				complain.setComplainerId(meeting.getMeetingMasterId());
				complain.setDefendantId(meeting.getMeetingMasterId());
				complain.setMeetingNo(meetingNo);
			}

			System.out.println("complain은 ??? " + complain);
			complainService.addComplain(complain);
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("complain", complain);
			
			if(communityNo != 0) {
				modelAndView.addObject("community", communityService.getCommunity(communityNo));
			}else if(meetingNo != 0) {
				modelAndView.addObject("meeting", meetingService.getMeeting(meetingNo));
			}
			
			modelAndView.setViewName("forward:/complain/addComplainConfirm.jsp");
			return modelAndView;
		}
		/*addComplain : end*/
		
		/*getComplainList.jsp로 단순 Navigation : start*/
		@RequestMapping(value="listComplain")
		public ModelAndView listComplain(@ModelAttribute("search") Search search) throws Exception{
			System.out.println("::ComplainController/listComplain/get : 실행");
			
			if (search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String, Object> map = complainService.getComplainList(search);
			
			Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println("resultPage : "+resultPage);
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("list", map.get("list"));
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			modelAndView.setViewName("/complain/getComplainList.jsp");
			return modelAndView;
		}
		/*getComplainList.jsp로 단순 Navigation : end*/

}
