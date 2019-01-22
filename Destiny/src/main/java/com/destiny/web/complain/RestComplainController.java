package com.destiny.web.complain;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.community.CommunityService;
import com.destiny.service.complain.ComplainService;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Complain;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;
import com.destiny.service.meeting.MeetingService;
import com.destiny.service.user.UserService;

@RestController
@RequestMapping("/complain/*")
public class RestComplainController {
	
	///Field
		@Autowired
		@Qualifier("complainServiceImpl")
		private ComplainService complainService;
		
		@Autowired
		@Qualifier("meetingServiceImpl")
		private MeetingService meetingService;
		
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		
		@Autowired
		@Qualifier("communityServiceImpl")
		private CommunityService communityService;
		
		///Constructor
		public RestComplainController() {
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		int pageSize;

		
		/*updateComplain/POST : start*/
		@RequestMapping(value="json/updateComplain/{complainNo}/{complainCondition}", method=RequestMethod.GET)
		public Complain updateComplain( @PathVariable("complainNo") int complainNo,@PathVariable("complainCondition") String complainCondition) throws Exception{
			
			System.out.println(":: ComplainController/updateComplain/json/POST : 실행");
			
			Complain complain = complainService.getComplain(complainNo);
			complain.setComplainCondition(complainCondition);
			
			User user = userService.getUser(complain.getDefendantId());
			Community community = communityService.getCommunity(complain.getCommunityNo());
			
			
			if(complain.getComplainCondition().equals("WAR") ) {
				System.out.println("1은 왔니!?");
				userService.updateWarningCount(user);
				if(userService.getUser(complain.getDefendantId()).getWarningCount() >= 5) {
					System.out.println("2는 왔니!?");
					user.setUserGrade("BLK");
					userService.updateGrade(user);
				}
			}
			System.out.println("여기는?!");
			System.out.println("1111111111111111"+complain);
			complainService.updateComplain(complain);
			System.out.println("22222222222222"+complain);
			Complain complain1=complainService.getComplain(complain.getComplainNo());
			System.out.println("333333333333333333"+complain1);

			/*Map<String, Object> map = new HashMap<String, Object>();
			map.put("complain",complain);
			System.out.println("map12312321 : " + map);
			*/
			return complain1;
		}
		/*updateComplain/POST : end*/

}
