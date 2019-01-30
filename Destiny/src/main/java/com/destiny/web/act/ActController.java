package com.destiny.web.act;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.Act.ActService;
import com.destiny.service.chatting.ChattingService;
import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.Upload;
import com.destiny.service.domain.User;
import com.destiny.service.info.InfoService;
import com.destiny.service.meeting.MeetingService;
import com.destiny.service.review.ReviewService;
import com.destiny.service.upload.UploadService;
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
	
	@Autowired
	@Qualifier("uploadServiceImpl")
	private UploadService uploadService;
	
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
	public ModelAndView getCrewList(@PathVariable("meetingNo") int meetingNo, HttpServletRequest request) throws Exception {
		System.out.println("act/getCrewList : GET + " + meetingNo);
		
		Meeting meeting = meetingService.getMeeting(meetingNo);
		int limit = meeting.getMeetingCrewLimit();
		
		List<Meeting> list = actService.getCrewAll(meetingNo);
		
		List<Meeting> listAPL = new ArrayList<Meeting>();
		List<User> listAPLUser = new ArrayList<User>();
		List<Meeting> listYES = new ArrayList<Meeting>();
		List<User> listYESUser = new ArrayList<User>();
		
		for(Meeting v : list) {
			if(!v.getRole().equals("MST"))
			{
				if(v.getCrewCondition().equals("APL")) {
					listAPL.add(v);
					listAPLUser.add(userService.getUser(v.getMeetingMasterId()));
				} else if (v.getCrewCondition().equals("YES")) {
					listYES.add(v);
					listYESUser.add(userService.getUser(v.getMeetingMasterId()));
				}
			}
		}
		String reason = "";
		if(request.getAttribute("judgmentApplyReason") != null) {
			reason = (String) request.getAttribute("judgmentApplyReason");
			request.removeAttribute("judgmentApplyReason");
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getCrewList.jsp");
		modelAndView.addObject("listAPL", listAPL);
		modelAndView.addObject("listAPLUser", listAPLUser);
		modelAndView.addObject("listYES", listYES);
		modelAndView.addObject("listYESUser", listYESUser);
		modelAndView.addObject("meetingNo", meetingNo);
		modelAndView.addObject("limit", limit);
		modelAndView.addObject("reason", reason);
		modelAndView.addObject("contextMeeting", meetingService.getMeeting(meetingNo));
		return modelAndView;
	}
	
	@RequestMapping(value="judgmentApply/{judgment}/{meetingNo}/{userId}", method=RequestMethod.GET)
	public ModelAndView judgmentApply(@PathVariable("judgment") String judgment, @PathVariable("meetingNo") int meetingNo, @PathVariable("userId") String userId, HttpServletRequest request) throws Exception{
		
		System.out.println("act/judgmentApply : GET + " + judgment + " + " + meetingNo);
		
		Meeting meeting = new Meeting();
		Meeting contextMeeting = meetingService.getMeeting(meetingNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/act/getCrewList/"+meetingNo);
		
		
		
			
		if(judgment.equals("yes")) {
			if(contextMeeting.getMeetingCrewLimit() == meetingService.getCrewCount(meetingNo)) {
				request.setAttribute("judgmentApplyReason", "가입 한도를 초과하셨습니다.");
			} else {
				meeting.setCrewCondition("YES");
				meeting.setMeetingMasterId(userId);
				
				actService.updateCrewCondition(meeting);
			}
		} else if(judgment.equals("no")) {
			actService.delectCrew(userId);
		}
		
		
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="getMeetingAct/{meetingNo}", method=RequestMethod.GET)
	public ModelAndView getMeetingAct(@PathVariable("meetingNo") int meetingNo, @ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("act/getMeetingAct : GET + " + meetingNo);
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Meeting contextMeeting = meetingService.getMeeting(meetingNo);
		
		Map<String , Object> map = actService.getMeetingAct(search, meetingNo);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getMeetingActCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getMeetingAct.jsp");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("contextMeeting", contextMeeting);
		return modelAndView;
	}
	
	@RequestMapping(value="getActCrew/{meetingActNo}/{meetingActCount}/{meetingNo}", method=RequestMethod.GET)
	public ModelAndView getActCrew(@PathVariable("meetingActNo") int meetingActNo,
									@PathVariable("meetingActCount") int meetingActCount,
									@PathVariable("meetingNo") int meetingNo) throws Exception{
		
		System.out.println("act/getActCrew : GET + "+meetingActNo+" + "+meetingActCount +" + "+ meetingNo);
		
		Meeting meeting = new Meeting();
		meeting.setMeetingActNo(meetingActNo);
		meeting.setMeetingActCount(meetingActCount);
		
		List<String> listString = actService.getActCrew(meeting);
		List<User> list = new ArrayList<User>();
		
		for(String v : listString) {
			list.add(userService.getUser(v));
		}
		
		Meeting contextMeeting = meetingService.getMeeting(meetingNo);

		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getActCrew.jsp");
		modelAndView.addObject("list", list);
		modelAndView.addObject("contextMeeting", contextMeeting);
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
	
	@RequestMapping(value="addStoryView/{Category}", method=RequestMethod.GET)
	public ModelAndView addStoryView(@PathVariable("Category") String Category) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/addStory.jsp");
		modelAndView.addObject("Category", Category);
		return modelAndView;
	}
	
	/*addRestaurantInfo : start*/
	@RequestMapping(value="addStory/{Category}", method=RequestMethod.POST)
	public ModelAndView addStory(@ModelAttribute("community") Community community, HttpSession session, @PathVariable("Category") String Category, @RequestParam("uploadFile")MultipartFile fileName, MultipartHttpServletRequest mtfRequest, @ModelAttribute("upload")Upload upload) throws Exception{
		System.out.println(":: ActController/addStory/post : 실행");
		
		/*대표이미지 업로드 : start*/
		String path = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\uploadImg\\";
		String name = System.currentTimeMillis()+"."+fileName.getOriginalFilename().split("\\.")[1];
		
		File file = new File(path + name);

		fileName.transferTo(file);
		/*대표이미지 업로드 : end*/
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		String nickName = user.getNickName();
		String userGrade = user.getUserGrade();
		System.out.println("userId :: " + userId);
		System.out.println("nickName : "+nickName);
		System.out.println("userGrade : "+userGrade);
		
		community.setWriterId(userId);
		community.setCategory(Category);
		community.setUserGrade(userGrade);
		community.setWriterNickName(nickName);
		community.setViews(0);
		community.setLike(0);
		community.setImportRank("N");
		community.setViewCondition("DEF");
		
		System.out.println(":: ActController/addStory/post의 community : "+community);
		
		ModelAndView modelAndView = new ModelAndView();
		communityService.addCommunity(community);
		
		System.out.println("community : "+community);
		/*업로드 테이블 : start*/
		upload.setCommunityNo(community.getCommunityNo());
		upload.setFileName(name);
		upload.setFileCode("IMG");
		uploadService.addUload(upload);
		System.out.println("upload : "+upload);
		/*업로드 테이블 : end*/
		modelAndView.setViewName("/user/userAct/addStoryConfirm.jsp");
		return modelAndView;
	}
	/*addRestaurantInfo : end*/
	
	@RequestMapping(value="meetingChart/{meetingNo}", method=RequestMethod.GET)
	public ModelAndView meetingChart(@PathVariable("meetingNo") int meetingNo) throws Exception{
		
		System.out.println("act/meetingChart/+"+meetingNo);
		
		Meeting meeting = meetingService.getMeeting(meetingNo);
		
		//============================================가입한 회원들의 주요 관심사=============================================
		Map<String, Object> meetingCrewMap = meetingService.getCrew(meetingNo);
		List<Meeting> meetingCrew = (List<Meeting>) meetingCrewMap.get("crewList");
		List<User> meetingCrewUser = new ArrayList<User>();
		
		int[] personalInterestArray = new int[3];
		User user = new User();
		List<String> personalInterestList = new ArrayList<String>();
		List<String> globalInterestList = new ArrayList<String>();
		
		for(Meeting m : meetingCrew) {
			System.out.println("여기는?");
			user = userService.getUser(m.getMeetingMasterId());
			//meetingCrewUser.add(user);
			
			System.out.println("여긴 오나?");
			
			personalInterestArray[0] = user.getFirstInterest();
			personalInterestArray[1] = user.getSecondInterest();
			personalInterestArray[2] = user.getThirdInterest();
			
			personalInterestList = userService.getInterestByUser(personalInterestArray);
			for(String s : personalInterestList) {
				globalInterestList.add(s);
			}
		}
		
		List<String> interestList = userService.getInterestList();
		
		int[] numOfInterest = new int[19];
		int i = 0;
		
		for(String s : interestList) {
			for(String ss: globalInterestList) {
				if(s.equals(ss)) {
					numOfInterest[i]++;
				}
			}
			i++;
		}
		
		for(int j = 0; j<=18; j++) {
			System.out.println(interestList.get(j) + " : " + numOfInterest[j]);
		}
		
		int[] fiveTOP = new int[5];
		String[] fiveTOPInerest = new String[5];
		
		int max = 0;
		String maxInterest = "";
		
		int temporarily = 0;
		
		for(int k = 0; k<=4; k++){
			
			for(int j = 0; j<=18; j++) {
				if(numOfInterest[j] > max) {
					max = numOfInterest[j];
					maxInterest = interestList.get(j);
					
					temporarily = j;
				}
			}
			numOfInterest[temporarily] = 0;
			temporarily = 0;
			
			fiveTOP[k] = max;
			fiveTOPInerest[k] = maxInterest;
			
			max= 0;
			maxInterest = "";
		}
		//===================================================================================================
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/userAct/meetingchart.jsp");
		modelAndView.addObject("Meeting", meeting);
		modelAndView.addObject("fiveTOP", fiveTOP);
		modelAndView.addObject("fiveTOPInerest", fiveTOPInerest);
		return modelAndView;
	}
	
}
