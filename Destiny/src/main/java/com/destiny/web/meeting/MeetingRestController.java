package com.destiny.web.meeting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;
import com.destiny.service.meeting.MeetingService;
import com.destiny.service.user.UserService;

@RestController
@RequestMapping("/meetingRest/*")
public class MeetingRestController {
	
	///Field
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public MeetingRestController(){
		
		System.out.println(this.getClass());
		
	}
	
	@RequestMapping( value="meetingRest/addCrewM", method=RequestMethod.POST)
	public int addCrewM(@RequestBody Meeting meeting)throws Exception{
		System.out.println("시작함");
		boolean flag = false;
		
		if(flag==false){
			int result = meetingService.checkDuplicationCrew(meeting);
			System.out.println(result);
			if(result==0) {
				flag=true;
				System.out.println(result);
			}
			
		}
		System.out.println(flag);
		
		if(flag==true) {
			User user =userService.getUser(meeting.getMeetingMasterId());
			
			System.out.println("유저내용을 가져와랏!!"+user);
			meeting.setMasterProfileImg(user.getProfile());
			meeting.setCrewNickName(user.getNickName());
			
			int susses= meetingService.addCrewM(meeting);
			//System.out.println("미팅내용 가져와랏"+meeting);
			System.out.println("끝냄");
			return susses;
		}else {
			return 5018;
		}
		
	}
	
	@RequestMapping( value="meetingRest/addActList", method=RequestMethod.POST)
	public int addActList(@RequestBody Meeting meeting)throws Exception{
		System.out.println("참여하기시작함");
		// 모임원인지 체크 
		int result = meetingService.checkDuplicationCrew(meeting);
		System.out.println(result);
		if(result < 1) return 5018;/*모임원 아님*/
		//유저정보확인
		User user =userService.getUser(meeting.getMeetingMasterId());
		meeting.setMasterProfileImg(user.getProfile());
		meeting.setCrewNickName(user.getNickName());
		
		meeting.setMeetingActNo(meetingService.getActNo(meeting).getMeetingActNo());
		meeting.setMeetingCrewNo(meetingService.getCrewNo(meeting).getMeetingCrewNo());
		
		// 참여했는지 체크
		int duplicationAct = meetingService.DuplicationAct(meeting);
		System.out.println("참여중복값은"+duplicationAct);
		if(duplicationAct >0 ) return 486; /*이미참여함*/

		//회차에 추가 
		int success= meetingService.addCrewAct(meeting);
		//System.out.println("미팅내용 가져와랏"+meeting);
		System.out.println("끝냄");
		
		if (success == 1) {
			return success;
		} else {
			return 5018;
		}
		
	}
	
	@RequestMapping( value="meetingRest/getActCrew", method=RequestMethod.POST)
	public Map<String , Object> getActCrew(@RequestBody Meeting meeting, Model model)throws Exception{
		System.out.println("참여자목록  시작함");
		int result = meetingService.checkDuplicationCrew(meeting);
		System.out.println("리저트도 없는거냐?"+result);
		if(result < 1) {
			System.out.println("여기들어옴");
			Map<String, Object> notCrewMap = new HashMap<String, Object>();
			notCrewMap.put("result", result);
			return notCrewMap; /*모임원아님*/
		}else {
			System.out.println("여기나옴");
			Map<String, Object> actmap = new HashMap<String, Object>();
			actmap = meetingService.getActCrew(meeting.getMeetingNo());
			
			actmap.put("actCrewList", actmap.get("list"));
			return actmap;
		}
		
	}
	
	@RequestMapping( value="meetingRest/getCrewrole", method=RequestMethod.POST)
	public String getCrewrole(@RequestBody Meeting meeting)throws Exception{
		System.out.println("모인장인지 확인  시작함");
		String result = meetingService.getCrewrole(meeting);
		System.out.println("확인끝 결과는 ======"+result);
		
		return result;
	}

}
