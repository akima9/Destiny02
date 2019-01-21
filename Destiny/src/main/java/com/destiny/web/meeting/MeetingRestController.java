package com.destiny.web.meeting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
		System.out.println("������");
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
			
			System.out.println("���������� �����Ͷ�!!"+user);
			meeting.setMasterProfileImg(user.getProfile());
			meeting.setCrewNickName(user.getNickName());
			
			int susses= meetingService.addCrewM(meeting);
			//System.out.println("���ó��� �����Ͷ�"+meeting);
			System.out.println("����");
			return susses;
		}else {
			return 5018;
		}
		
	}
	
	@RequestMapping( value="meetingRest/addActList", method=RequestMethod.POST)
	public int addActList(@RequestBody Meeting meeting)throws Exception{
		System.out.println("�����ϱ������");
		// ���ӿ����� üũ 
		int result = meetingService.checkDuplicationCrew(meeting);
		System.out.println(result);
		if(result < 1) return 5018;/*���ӿ� �ƴ�*/
		//��������Ȯ��
		User user =userService.getUser(meeting.getMeetingMasterId());
		meeting.setMasterProfileImg(user.getProfile());
		meeting.setCrewNickName(user.getNickName());
		
		meeting.setMeetingActNo(meetingService.getActNo(meeting).getMeetingActNo());
		meeting.setMeetingCrewNo(meetingService.getCrewNo(meeting).getMeetingCrewNo());
		
		// �����ߴ��� üũ
		int duplicationAct = meetingService.DuplicationAct(meeting);
		System.out.println("�����ߺ�����"+duplicationAct);
		if(duplicationAct >0 ) return 486; /*�̹�������*/

		//ȸ���� �߰� 
		int success= meetingService.addCrewAct(meeting);
		//System.out.println("���ó��� �����Ͷ�"+meeting);
		System.out.println("����");
		
		if (success == 1) {
			return success;
		} else {
			return 5018;
		}
		
	}

}
