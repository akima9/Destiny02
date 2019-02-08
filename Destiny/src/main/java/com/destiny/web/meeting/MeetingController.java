package com.destiny.web.meeting;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;
import com.destiny.service.meeting.MeetingService;
import com.destiny.common.Page;

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
		
		System.out.println("����rpt����Ʈ");
		//System.out.println(search.getSearchCondition());
		Search search = new Search();
		Map<String , Object> map=meetingService.getMeetingList(search);
		Map<String , Object> bestMap=meetingService.getBestProduct();
		Map<String , Object> interestmap=meetingService.getInterestList();
		model.addAttribute("list", map.get("list"));
		model.addAttribute("bestList", bestMap.get("bestList"));
		model.addAttribute("interlist", interestmap.get("list"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/getMeetingList.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping(value="listMeeting/{meetingCenter}", method=RequestMethod.POST)
	public ModelAndView listMeeting(Model model, @PathVariable("meetingCenter") String meetingCenter,
			@ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("���̸���Ʈ");
		System.out.println(search);
		System.out.println(meetingCenter);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(meetingCenter !=null) {
			if(search.getSearchCondition()=="��/��/�� ����" || meetingCenter.length()==2) {
				System.out.println("�ñ��� ����");
				search.setSearchCondition("");
			}else {
				System.out.println("�ñ��� �ƴԾƴԾƴ�");
				search.setSearchCondition(meetingCenter);
			}
		}
		
		Map<String , Object> interestmap=meetingService.getInterestList();
		Map<String , Object> map=meetingService.getMeetingList(search);
		Map<String , Object> bestMap=meetingService.getBestProduct();
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("bestList", bestMap.get("bestList"));
		model.addAttribute("interlist", interestmap.get("list"));
		model.addAttribute("resultPage", resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/getMeetingList.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping(value="addMeeting", method=RequestMethod.GET)
	public ModelAndView addMeetingView(Model model,@ModelAttribute("meeting") Meeting meeting) throws Exception{
		
		System.out.println("�����ϱ�");
		
		Map<String , Object> map=meetingService.getInterestList();
		
		model.addAttribute("list", map.get("list"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/addMeeting.jsp");
		
		System.out.println("��");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addMeeting", method=RequestMethod.POST)
	public ModelAndView addMeeting(@ModelAttribute("meeting") Meeting meeting) throws Exception{
		System.out.println("���̿�������Ʈ");
		System.out.println(meeting);
		
		meetingService.addMeeting(meeting);
		meetingService.addAct(meeting);
		meetingService.addCrewList(meeting);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getMeeting", method=RequestMethod.GET)
	public ModelAndView getMeeting(Model model, @RequestParam("meetingNo") int meetingNo) throws Exception{
		System.out.println("���� �� ����");
		System.out.println(meetingNo);
		
		Map<String , Object> map=meetingService.getInterestList();
		model.addAttribute("list", map.get("list"));
		
		Meeting meeting = meetingService.getMeeting(meetingNo);
		meetingService.updateViews(meetingNo);
		Meeting meetingAct = meetingService.getAct(meetingNo);
		int crewCount = meetingService.getCrewCount(meetingNo);
		Map<String , Object> crewMap=meetingService.getCrew(meetingNo);
		
		model.addAttribute("meeting", meeting);
		model.addAttribute("meetingAct", meetingAct);
		model.addAttribute("crewCount", crewCount);
		model.addAttribute("crewList", crewMap.get("crewList"));
		
		//System.out.println("�̷����Ӥ����Ӹ����Ӥ���Τ���"+crewMap.get("crewList"));
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/getMeeting.jsp");
		return modelAndView;
//		return null;
	}
	
	@RequestMapping(value="updateMeeting", method=RequestMethod.POST)
	public ModelAndView updateMeeting(@ModelAttribute("meeting") Meeting meeting) throws Exception{
		//System.out.println("���� ������Ʈ");
		//Meeting meeting = new Meeting();
		System.out.println("�����������"+meeting.getMeetingCondition());
		//System.out.println(meeting.getMeetingNo());
		//Meeting meeting = meetingService.getMeeting(meetingNo);
		
		if(meeting.getMeetingCondition()!="DEF" && meeting.getMeetingCondition()!=null) {
			System.out.println("def�� �ƴϴ�");
			//���ù� ���� �÷��� ó�� 
			meetingService.updateMeeting(meeting);
		}else {
			//���ù� ���� ����
			meetingService.updateContentsMeeting(meeting);
			meetingService.updateContentsAct(meeting);
		}
		
		
		//model.addAttribute("meeting", meeting);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index.jsp");
		return modelAndView;
		//return null;
	}
}
