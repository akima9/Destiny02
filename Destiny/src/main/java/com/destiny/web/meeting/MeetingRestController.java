package com.destiny.web.meeting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.destiny.service.domain.Meeting;
import com.destiny.service.meeting.MeetingService;

@RestController
@RequestMapping("/meeting/*")
public class MeetingRestController {
	
	///Field
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	public MeetingRestController(){
		
		System.out.println(this.getClass());
		
	}
	
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST)
	public Meeting addProduct(@RequestBody Meeting meeting)throws Exception{
		System.out.println("Ω√¿€«‘");
		meetingService.addCrewM(meeting);
		System.out.println("≥°≥ø");
		
		return meeting;
	}

}
