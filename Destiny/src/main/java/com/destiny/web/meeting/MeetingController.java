package com.destiny.web.meeting;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.domain.Meeting;
import com.destiny.service.meeting.MeetingService;

@Controller
@RequestMapping("/meeting/*")
public class MeetingController {
	
	///Field
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	///Constructor
	public MeetingController() {
		System.out.println(this.getClass());
	}
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	///Method
	
	@RequestMapping(value="listMeeting", method=RequestMethod.GET)
	public ModelAndView listMeeting(Model model) throws Exception{
		
		System.out.println("하이리스트");
		
		Map<String , Object> map=meetingService.getMeetingList();
		
		model.addAttribute("list", map.get("list"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/getMeetingList.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping(value="addMeeting", method=RequestMethod.GET)
	public ModelAndView addMeetingView(Model model,@ModelAttribute("meeting") Meeting meeting) throws Exception{
		
		System.out.println("개설하기");
		
		Map<String , Object> map=meetingService.getInterestList();
		
		Map<String , Object> locationmap=meetingService.getInterestList();
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("locationList", locationmap.get("list"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/addMeeting.jsp");
		
		System.out.println("끝");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addMeeting", method=RequestMethod.POST)
	public ModelAndView addMeeting(@ModelAttribute("meeting") Meeting meeting) throws Exception{
		System.out.println("하이에드포스트");
		System.out.println(meeting);
		
		meetingService.addMeeting(meeting);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/meeting/getMeetingList.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getMeeting", method=RequestMethod.GET)
	public ModelAndView getMeeting(@RequestParam("meetingNo") int meetingNo) throws Exception{
		System.out.println("하이 겟 미팅");
		System.out.println(meetingNo);
		
		//Meeting meeting = meetingService.getMeeting(meetingNo);
		//meetingService.updateViews(meetingNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/meeting/getMeeting.jsp");
		//return modelAndView;
		return null;
	}
}
