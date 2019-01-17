package com.destiny.web.user;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Search;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserService;
import com.destiny.common.Page;



@Controller
@RequestMapping("/user/*")
public class UserController {
	
	//Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public ModelAndView login() throws Exception{
		
		System.out.println("/user/login : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/userInfo/loginView.jsp");

		return modelAndView;
	}
	
	@RequestMapping( value="login/{userId}/{password}", method=RequestMethod.GET )
	public ModelAndView login(@PathVariable("userId") String userId, @PathVariable("password") String password , HttpSession session, HttpServletRequest request) throws Exception{
		
		System.out.println("/user/login : GET");
		System.out.println("userId : " + userId);
		System.out.println("password : " + password);
		
		//Business Logic
		User dbUser = new User();
		 
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index.jsp");
		//만일 유저가 없다면
		if(userService.getUser(userId) == null) {
			System.out.println("가입되지 않은 아이디입니다.");
			modelAndView.addObject("result", "Fail");
			modelAndView.addObject("reason", "가입되지 않은 아이디입니다.");
			modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
		} else {
			dbUser=userService.getUser(userId);
		
			//만일 탈퇴한 유저라면
			if(dbUser.getUserState().equals("O")) {
				modelAndView.addObject("result", "Fail");
				modelAndView.addObject("reason", "탈퇴한 회원입니다. 다시 이용하고 싶으시면 계정을 복구해 주십시요.");
				modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
			} else {
				//===========================================로그인 + 현제 접속자 구현 로직 part=================================================
				ServletContext applicationScope = request.getSession().getServletContext();
				
				List<User> loginList = new ArrayList<User>();
				
				if(applicationScope.getAttribute("loginList") != null) {
					loginList = (List<User>) applicationScope.getAttribute("loginList");
				}
				
				int numberOfLogin = 0;
				
				if(applicationScope.getAttribute("numberOfLogin") != null) {
					numberOfLogin = (int) applicationScope.getAttribute("numberOfLogin");
				}
		
				System.out.println("현 접속자 중 지금 로그인 시도한 사람이 있습니까? ");
				boolean checkDe = false;
				for(int i = 0; i < loginList.size(); i++) {
					if(loginList.get(i).toString().equals(dbUser.toString())) {
						System.out.println("어 있엉~~~~~~~~~~~~~~~~~~~~~~~");
						checkDe = true;
					}
				}
				
				//비밀번호가 일치하는가?
				if(password.equals(dbUser.getPassword())){
					//중복 로그인이 아닌가?
					if(!checkDe) {
						session.setAttribute("me", dbUser);
						
						loginList.add(dbUser);
						
						numberOfLogin++;
						
						applicationScope.setAttribute("loginList", loginList);
						applicationScope.setAttribute("numberOfLogin", numberOfLogin);
						for(User v : loginList) {
							System.out.println("현제 접속자 목록 : " + v);
						}
						System.out.println("현제 접속자 : " + numberOfLogin);
						
						modelAndView.addObject("result", "Success");
						modelAndView.addObject(dbUser.getUserId(), dbUser);
						
						//=========================================출석체크 로직 구현 part===========================================
						int numAttendCount = dbUser.getAttendCount();
						Date lastLoginDate = dbUser.getLastLoginDay();
						System.out.println(dbUser.getUserId() + "의 마지막 로그인 날자 : " + lastLoginDate);
						
						java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
				
						System.out.println("현제 날짜(sql) : " + sqlDate);
						
						LocalDate lastLoginDateLocal = new Date(lastLoginDate.getTime()).toLocalDate();
						LocalDate sqlDateLocal = new Date(sqlDate.getTime()).toLocalDate();
						
						if(lastLoginDateLocal.isBefore(sqlDateLocal)) {
							System.out.println("다른날 접속입니다. 마지막 접속 : " + lastLoginDate + " 오늘 접속 : " + sqlDate + " 출석 횟수 : " + numAttendCount);
							
							dbUser.setLastLoginDay(sqlDate);
							numAttendCount++;
							dbUser.setAttendCount(numAttendCount);
							
							userService.attendLogin(dbUser);
							
							//==========================================등급 업!(일단 출석일로만)===================================
							if(numAttendCount == 2) {
								dbUser.setUserGrade("NOR");
								userService.updateGrade(dbUser);
							}
							if(numAttendCount == 20) {
								dbUser.setUserGrade("VIP");
								userService.updateGrade(dbUser);
							}
							//==============================================================================================
							
						} else {
							System.out.println("같은날 접속입니다. 마지막 접속 : " + lastLoginDate+ " 오늘 접속 : " + sqlDate);
						}
						
						//=======================================================================================================
						
					
					} else {
						modelAndView.addObject("reason", "이미 로그인된 계정입니다.");
						modelAndView.addObject("result", "Fail");
						modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
					}
					
				} else {
					System.out.println("비밀번호가 다릅니다.");
					modelAndView.addObject("reason", "비밀번호가 다릅니다.");
					modelAndView.addObject("result", "Fail");
					modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
				}
				//====================================================================================================
			}
		}
		return modelAndView;
	}
	
	@RequestMapping(value="logout/{userId}" , method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session, HttpServletRequest request, @PathVariable String userId) throws Exception{
		
		System.out.println("/user/logout : GET");
		
		session.invalidate();
		
		//========================================현제 접속자에서 해당 회원 remove, 접속자수 update====================================
		ServletContext applicationScope = request.getSession().getServletContext();
		List<User> loginList = new ArrayList<User>();
		
		if(applicationScope.getAttribute("loginList") != null) {
			loginList = (List<User>) applicationScope.getAttribute("loginList");
		}
		User user = userService.getUser(userId);
		
		boolean checkDe = false;
		for(int i = 0; i < loginList.size(); i++) {
			if(loginList.get(i).toString().equals(user.toString())) {
				System.out.println("어 있엉~~~~~~~~~~~~~~~~~~~~~~~");
				loginList.remove(i);
			}
		}
		
		//loginList.remove(user);
		
		int numberOfLogin = 0;
		
		if(applicationScope.getAttribute("numberOfLogin") != null) {
			numberOfLogin = (int) applicationScope.getAttribute("numberOfLogin");
		}
		
		numberOfLogin--;
		
		applicationScope.setAttribute("loginList", loginList);
		applicationScope.setAttribute("numberOfLogin", numberOfLogin);
		//==================================================================================================================
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addUser", method=RequestMethod.GET)
	public ModelAndView addUser() throws Exception{
		System.out.println("/user/addUser : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/userInfo/addUserView.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("user") User user, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{
		System.out.println("/user/addUser : POST");
		
		System.out.println("가져온 user정보 : " + user);
		ModelAndView modelAndView = new ModelAndView();
		//=====================탈퇴한 회원인지 조회해서 탈퇴한 회원이면 신규회원으로 전환=========================
	
		if(userService.getUser(user.getUserId()) != null) {
			/*User dbUser = userService.getUser(user.getUserId());
			if(user.getUserState().equals("O")) {
				user.setUserState("I");
				userService.updateState(user);
				user.setUserGrade("NEW");
				userService.updateGrade(user);
			}*/
		} else {
			//===========================프로필 사진 업로드(다중)===========================
			String temDir = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\userprofile\\";
			
			List<MultipartFile> fileList  = multipartHttpServletRequest.getFiles("file");
			System.out.println("받은 파일들 : " + fileList);
			
			String originalFileName = null;
			long fileSize = 0;
			int idx = 0;
			String initail = "";
			
			List list = new ArrayList();
			
			File file = new File(temDir);
			if(file.exists() == false) {
				file.mkdirs();
			}
			
			//	================DB에 File이름 setting==================
			for(MultipartFile mf : fileList) {
				System.out.println("각 파일 : " + mf);
				originalFileName = mf.getOriginalFilename();
				System.out.println("파일 이름 : " + originalFileName);
				
				idx = originalFileName.indexOf('.');
				initail = originalFileName.substring(idx, originalFileName.length());
				originalFileName = originalFileName.substring(0, idx);
				originalFileName += System.currentTimeMillis();
				originalFileName += initail;
				
				list.add(originalFileName);
				
				fileSize = mf.getSize();
				System.out.println("파일 사이즈 : " + fileSize);
				
				String safeFile = temDir + originalFileName;
				System.out.println("파일 경로 + 이름 : " + safeFile);
				file = new File(safeFile);
				mf.transferTo(file);
			}
			String profileDomain = String.valueOf(list);
			profileDomain = profileDomain.replace("[", "");
			profileDomain = profileDomain.replace("]", "");
			
			user.setProfile(profileDomain);
			//====================================================
			//=========================================================================
			userService.addUser(user);
		}

		modelAndView.setViewName("redirect:/index.jsp");

		
		
		return modelAndView;
	}
	
	@RequestMapping(value="getUserView", method=RequestMethod.GET)
	public ModelAndView getUserView(HttpSession session) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/getUserView.jsp");
		modelAndView.addObject("me", session.getAttribute("me"));
		return modelAndView;
	}
	
	@RequestMapping(value="getUser/{userId}", method=RequestMethod.GET)
	public ModelAndView getUser(@PathVariable("userId") String userId) throws Exception {
		
		System.out.println("/user/getUser");
		
		User user = userService.getUser(userId);
		
		//프로필 사진
		user.setProfile(user.getProfile().replace("[", ""));
		user.setProfile(user.getProfile().replace("]", ""));
		String[] filelist = user.getProfile().split(", ");
		
		//관심사 가져오기
		int[] interestNo = new int[3];
		interestNo[0] = user.getFirstInterest();
		interestNo[1] = user.getSecondInterest();
		interestNo[2] = user.getThirdInterest();
		
		List<String> interestList = userService.getInterestByUser(interestNo);
		
		//성격유형 및 이미지 파일 가져오기
		int[] typeNo = new int[4];
		typeNo[0] = user.getMyType();
		typeNo[1] = user.getFirstType();
		typeNo[2] = user.getSecondType();
		typeNo[3] = user.getThirdType();
		
		Map<String, Object> typeMap = userService.getTypeByUser(typeNo);
		
		String myTypeFile = (String) typeMap.get("myType") + ".JPG";
		List<String> typeFileList = new ArrayList<String>();
		typeFileList.add((String) typeMap.get("firstType") + ".JPG");
		typeFileList.add((String) typeMap.get("secondType") + ".JPG");
		typeFileList.add((String) typeMap.get("thirdType") + ".JPG");
		
		Map<String, Object> typeFileMap = new HashMap<String, Object>();
		typeFileMap.put("myTpyeFile", myTypeFile);
		typeFileMap.put("typeFileList", typeFileList);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/getUser.jsp");
		modelAndView.addObject("user", user);
		modelAndView.addObject("filelist", filelist);
		modelAndView.addObject("interestList", interestList);
		modelAndView.addObject("typeMap", typeMap);
		modelAndView.addObject("typeFileMap", typeFileMap);
		return modelAndView;
	}
	
	@RequestMapping(value="updateUser/{userId}", method=RequestMethod.GET)
	public ModelAndView updateUser(@PathVariable String userId) throws Exception{
		
		User user = userService.getUser(userId);
		
		//지역 시/도  - 구/군 따로 확보
		List<String> location = new ArrayList<String>();
		location.add(user.getAddress().split(" ")[0]);
		location.add(user.getAddress().split(" ")[1]);
		
		//폰 번호 따로 확보
		List<String> phone = new ArrayList<String>();
		phone.add(user.getPhone().split("-")[0]);
		phone.add(user.getPhone().split("-")[1]);
		phone.add(user.getPhone().split("-")[2]);
		
		//프로필 사진 따로
		List<String> profile = new ArrayList<String>();
		for(String v : user.getProfile().split(", ")) {
			profile.add(v);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/updateUser.jsp");
		modelAndView.addObject("user", user);
		modelAndView.addObject("location", location);
		modelAndView.addObject("phone", phone);
		modelAndView.addObject("filelist", profile);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateUserResult", method=RequestMethod.POST)
	public ModelAndView updateUserResult(@ModelAttribute("user") User user, MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest request) throws Exception{
		System.out.println("user/updateUserResult POST 가져온 user정보 : " + user);
		
		//===========================프로필 사진을 수정하거나 수정하지 않았을 때 프로필 사진 업로드(다중)===========================
		String temDir = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\userprofile\\";
		
		List<MultipartFile> fileList  = multipartHttpServletRequest.getFiles("file");
		System.out.println("받은 파일들 : " + fileList);
		
		//새로운 프로필 사진을 등록하지 않았을 때
		if(fileList.get(0).getOriginalFilename() == "") {
			String[] profile = new String[3];
			String profileRe = "";
			for(int i = 0; i<=2; i++) {
				profile[i] = request.getParameter("profile"+(i+1));
				System.out.println("기존 프로필 사진 : "+profile[i]);
				if(profile[i] != "") {
					profileRe = profileRe + profile[i] + ", ";
				}
			}
			user.setProfile(profileRe);
		//새로운 프로필 사진을 등록했을 때
		} else {
			
			String originalFileName = null;
			long fileSize = 0;
			int idx = 0;
			String initail = "";
			
			List list = new ArrayList();
			
			File file = new File(temDir);
			if(file.exists() == false) {
				file.mkdirs();
			}
			
	
			//	================ File이름 setting==================
			for(MultipartFile mf : fileList) {
				System.out.println("각 파일 : " + mf);
				originalFileName = mf.getOriginalFilename();
				System.out.println("파일 이름 : " + originalFileName);
				
				idx = originalFileName.indexOf('.');
				initail = originalFileName.substring(idx, originalFileName.length());
				originalFileName = originalFileName.substring(0, idx);
				originalFileName += System.currentTimeMillis();
				originalFileName += initail;
				
				list.add(originalFileName);
				
				fileSize = mf.getSize();
				System.out.println("파일 사이즈 : " + fileSize);
				
				String safeFile = temDir + originalFileName;
				System.out.println("파일 경로 + 이름 : " + safeFile);
				file = new File(safeFile);
				mf.transferTo(file);
			}
			String profileDomain = String.valueOf(list);
			profileDomain = profileDomain.replace("[", "");
			profileDomain = profileDomain.replace("]", "");
			
			user.setProfile(profileDomain);
			//====================================================
			//=========================================================================
		}
		
		userService.updateUser(user);
		User reUser = userService.getUser(user.getUserId());
		
		//프로필 사진
		reUser.setProfile(reUser.getProfile().replace("[", ""));
		reUser.setProfile(reUser.getProfile().replace("]", ""));
		String[] filelist = reUser.getProfile().split(", ");
		
		//관심사 가져오기
		int[] interestNo = new int[3];
		interestNo[0] = reUser.getFirstInterest();
		interestNo[1] = reUser.getSecondInterest();
		interestNo[2] = reUser.getThirdInterest();
		
		List<String> interestList = userService.getInterestByUser(interestNo);
		
		//성격유형 및 이미지 파일 가져오기
		int[] typeNo = new int[4];
		typeNo[0] = reUser.getMyType();
		typeNo[1] = reUser.getFirstType();
		typeNo[2] = reUser.getSecondType();
		typeNo[3] = reUser.getThirdType();
		
		Map<String, Object> typeMap = userService.getTypeByUser(typeNo);
		
		String myTypeFile = (String) typeMap.get("myType") + ".JPG";
		List<String> typeFileList = new ArrayList<String>();
		typeFileList.add((String) typeMap.get("firstType") + ".JPG");
		typeFileList.add((String) typeMap.get("secondType") + ".JPG");
		typeFileList.add((String) typeMap.get("thirdType") + ".JPG");
		
		Map<String, Object> typeFileMap = new HashMap<String, Object>();
		typeFileMap.put("myTpyeFile", myTypeFile);
		typeFileMap.put("typeFileList", typeFileList);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/getUser.jsp");
		modelAndView.addObject("user", reUser);
		modelAndView.addObject("filelist", filelist);
		modelAndView.addObject("interestList", interestList);
		modelAndView.addObject("typeMap", typeMap);
		modelAndView.addObject("typeFileMap", typeFileMap);
		return modelAndView;
	}
	
	@RequestMapping(value="addTypeView/{userId}", method=RequestMethod.GET)
	public ModelAndView addTypeView(@PathVariable String userId) throws Exception{
		
		System.out.println("/user/addTypeView : GET");
		
		User user = userService.getUser(userId);
		
		int[] userList = new int[4];
		userList[0] = user.getMyType();
		userList[1] = user.getFirstType();
		userList[2] = user.getSecondType();
		userList[3] = user.getThirdType();
		
		List<String> list = userService.getTypeList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/addTypeView.jsp");
		modelAndView.addObject("list", list);
		modelAndView.addObject("userList", userList);
		return modelAndView;
	}
	
	@RequestMapping(value="addType", method=RequestMethod.POST)
	public ModelAndView addType(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/user/addType POST 가져온 user : " + user);
		
		user.setUserId(((User)session.getAttribute("me")).getUserId());
		
		userService.updateType(user);
		 
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/getUser/"+user.getUserId());
		return modelAndView;		
	}
	
	@RequestMapping(value="listUser", method=RequestMethod.GET)
	public ModelAndView listUser(@ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("/user/listUser : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/getListUser.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="leaveSite/{userId}", method=RequestMethod.GET)
	public ModelAndView leaveSite(@PathVariable String userId) throws Exception{
		
		System.out.println("/user/leaveSite/{"+userId+"}");
		
		User user = userService.getUser(userId);
		
		user.setUserState("O");
		userService.updateState(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/logout/"+userId);
		return modelAndView;
	}
	
	@RequestMapping(value="getBackSite/{userId}", method=RequestMethod.GET)
	public ModelAndView getBackSite(@PathVariable String userId) throws Exception{
		System.out.println("getBackSite : GET : " + userId);
		User user = userService.getUser(userId);
		user.setUserState("I");
		userService.updateState(user);
		user.setUserGrade("NEW");
		userService.updateGrade(user);
		
		user.setAttendCount(1);
		user.setLastLoginDay(new java.sql.Date(new java.util.Date().getTime()));
		userService.attendLogin(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("reason", "계정이 복구되었습니다. 다시 로그인해주세요.");
		modelAndView.setViewName("redirect:/index.jsp");
		return modelAndView;
	}

	
	
}
