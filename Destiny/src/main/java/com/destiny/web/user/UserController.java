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
		//���� ������ ���ٸ�
		if(userService.getUser(userId) == null) {
			System.out.println("���Ե��� ���� ���̵��Դϴ�.");
			modelAndView.addObject("result", "Fail");
			modelAndView.addObject("reason", "���Ե��� ���� ���̵��Դϴ�.");
			modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
		} else {
			dbUser=userService.getUser(userId);
		
			//���� Ż���� �������
			if(dbUser.getUserState().equals("O")) {
				modelAndView.addObject("result", "Fail");
				modelAndView.addObject("reason", "Ż���� ȸ���Դϴ�. �ٽ� �̿��ϰ� �����ø� ������ ������ �ֽʽÿ�.");
				modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
			} else {
				//===========================================�α��� + ���� ������ ���� ���� part=================================================
				ServletContext applicationScope = request.getSession().getServletContext();
				
				List<User> loginList = new ArrayList<User>();
				
				if(applicationScope.getAttribute("loginList") != null) {
					loginList = (List<User>) applicationScope.getAttribute("loginList");
				}
				
				int numberOfLogin = 0;
				
				if(applicationScope.getAttribute("numberOfLogin") != null) {
					numberOfLogin = (int) applicationScope.getAttribute("numberOfLogin");
				}
		
				System.out.println("�� ������ �� ���� �α��� �õ��� ����� �ֽ��ϱ�? ");
				boolean checkDe = false;
				for(int i = 0; i < loginList.size(); i++) {
					if(loginList.get(i).toString().equals(dbUser.toString())) {
						System.out.println("�� �־�~~~~~~~~~~~~~~~~~~~~~~~");
						checkDe = true;
					}
				}
				
				//��й�ȣ�� ��ġ�ϴ°�?
				if(password.equals(dbUser.getPassword())){
					//�ߺ� �α����� �ƴѰ�?
					if(!checkDe) {
						session.setAttribute("me", dbUser);
						
						loginList.add(dbUser);
						
						numberOfLogin++;
						
						applicationScope.setAttribute("loginList", loginList);
						applicationScope.setAttribute("numberOfLogin", numberOfLogin);
						for(User v : loginList) {
							System.out.println("���� ������ ��� : " + v);
						}
						System.out.println("���� ������ : " + numberOfLogin);
						
						modelAndView.addObject("result", "Success");
						modelAndView.addObject(dbUser.getUserId(), dbUser);
						
						//=========================================�⼮üũ ���� ���� part===========================================
						int numAttendCount = dbUser.getAttendCount();
						Date lastLoginDate = dbUser.getLastLoginDay();
						System.out.println(dbUser.getUserId() + "�� ������ �α��� ���� : " + lastLoginDate);
						
						java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
				
						System.out.println("���� ��¥(sql) : " + sqlDate);
						
						LocalDate lastLoginDateLocal = new Date(lastLoginDate.getTime()).toLocalDate();
						LocalDate sqlDateLocal = new Date(sqlDate.getTime()).toLocalDate();
						
						if(lastLoginDateLocal.isBefore(sqlDateLocal)) {
							System.out.println("�ٸ��� �����Դϴ�. ������ ���� : " + lastLoginDate + " ���� ���� : " + sqlDate + " �⼮ Ƚ�� : " + numAttendCount);
							
							dbUser.setLastLoginDay(sqlDate);
							numAttendCount++;
							dbUser.setAttendCount(numAttendCount);
							
							userService.attendLogin(dbUser);
							
							//==========================================��� ��!(�ϴ� �⼮�Ϸθ�)===================================
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
							System.out.println("������ �����Դϴ�. ������ ���� : " + lastLoginDate+ " ���� ���� : " + sqlDate);
						}
						
						//=======================================================================================================
						
					
					} else {
						modelAndView.addObject("reason", "�̹� �α��ε� �����Դϴ�.");
						modelAndView.addObject("result", "Fail");
						modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
					}
					
				} else {
					System.out.println("��й�ȣ�� �ٸ��ϴ�.");
					modelAndView.addObject("reason", "��й�ȣ�� �ٸ��ϴ�.");
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
		
		//========================================���� �����ڿ��� �ش� ȸ�� remove, �����ڼ� update====================================
		ServletContext applicationScope = request.getSession().getServletContext();
		List<User> loginList = new ArrayList<User>();
		
		if(applicationScope.getAttribute("loginList") != null) {
			loginList = (List<User>) applicationScope.getAttribute("loginList");
		}
		User user = userService.getUser(userId);
		
		boolean checkDe = false;
		for(int i = 0; i < loginList.size(); i++) {
			if(loginList.get(i).toString().equals(user.toString())) {
				System.out.println("�� �־�~~~~~~~~~~~~~~~~~~~~~~~");
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
		
		System.out.println("������ user���� : " + user);
		ModelAndView modelAndView = new ModelAndView();
		//=====================Ż���� ȸ������ ��ȸ�ؼ� Ż���� ȸ���̸� �ű�ȸ������ ��ȯ=========================
	
		if(userService.getUser(user.getUserId()) != null) {
			/*User dbUser = userService.getUser(user.getUserId());
			if(user.getUserState().equals("O")) {
				user.setUserState("I");
				userService.updateState(user);
				user.setUserGrade("NEW");
				userService.updateGrade(user);
			}*/
		} else {
			//===========================������ ���� ���ε�(����)===========================
			String temDir = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\userprofile\\";
			
			List<MultipartFile> fileList  = multipartHttpServletRequest.getFiles("file");
			System.out.println("���� ���ϵ� : " + fileList);
			
			String originalFileName = null;
			long fileSize = 0;
			int idx = 0;
			String initail = "";
			
			List list = new ArrayList();
			
			File file = new File(temDir);
			if(file.exists() == false) {
				file.mkdirs();
			}
			
			//	================DB�� File�̸� setting==================
			for(MultipartFile mf : fileList) {
				System.out.println("�� ���� : " + mf);
				originalFileName = mf.getOriginalFilename();
				System.out.println("���� �̸� : " + originalFileName);
				
				idx = originalFileName.indexOf('.');
				initail = originalFileName.substring(idx, originalFileName.length());
				originalFileName = originalFileName.substring(0, idx);
				originalFileName += System.currentTimeMillis();
				originalFileName += initail;
				
				list.add(originalFileName);
				
				fileSize = mf.getSize();
				System.out.println("���� ������ : " + fileSize);
				
				String safeFile = temDir + originalFileName;
				System.out.println("���� ��� + �̸� : " + safeFile);
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
		
		//������ ����
		user.setProfile(user.getProfile().replace("[", ""));
		user.setProfile(user.getProfile().replace("]", ""));
		String[] filelist = user.getProfile().split(", ");
		
		//���ɻ� ��������
		int[] interestNo = new int[3];
		interestNo[0] = user.getFirstInterest();
		interestNo[1] = user.getSecondInterest();
		interestNo[2] = user.getThirdInterest();
		
		List<String> interestList = userService.getInterestByUser(interestNo);
		
		//�������� �� �̹��� ���� ��������
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
		
		//���� ��/��  - ��/�� ���� Ȯ��
		List<String> location = new ArrayList<String>();
		location.add(user.getAddress().split(" ")[0]);
		location.add(user.getAddress().split(" ")[1]);
		
		//�� ��ȣ ���� Ȯ��
		List<String> phone = new ArrayList<String>();
		phone.add(user.getPhone().split("-")[0]);
		phone.add(user.getPhone().split("-")[1]);
		phone.add(user.getPhone().split("-")[2]);
		
		//������ ���� ����
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
		System.out.println("user/updateUserResult POST ������ user���� : " + user);
		
		//===========================������ ������ �����ϰų� �������� �ʾ��� �� ������ ���� ���ε�(����)===========================
		String temDir = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\userprofile\\";
		
		List<MultipartFile> fileList  = multipartHttpServletRequest.getFiles("file");
		System.out.println("���� ���ϵ� : " + fileList);
		
		//���ο� ������ ������ ������� �ʾ��� ��
		if(fileList.get(0).getOriginalFilename() == "") {
			String[] profile = new String[3];
			String profileRe = "";
			for(int i = 0; i<=2; i++) {
				profile[i] = request.getParameter("profile"+(i+1));
				System.out.println("���� ������ ���� : "+profile[i]);
				if(profile[i] != "") {
					profileRe = profileRe + profile[i] + ", ";
				}
			}
			user.setProfile(profileRe);
		//���ο� ������ ������ ������� ��
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
			
	
			//	================ File�̸� setting==================
			for(MultipartFile mf : fileList) {
				System.out.println("�� ���� : " + mf);
				originalFileName = mf.getOriginalFilename();
				System.out.println("���� �̸� : " + originalFileName);
				
				idx = originalFileName.indexOf('.');
				initail = originalFileName.substring(idx, originalFileName.length());
				originalFileName = originalFileName.substring(0, idx);
				originalFileName += System.currentTimeMillis();
				originalFileName += initail;
				
				list.add(originalFileName);
				
				fileSize = mf.getSize();
				System.out.println("���� ������ : " + fileSize);
				
				String safeFile = temDir + originalFileName;
				System.out.println("���� ��� + �̸� : " + safeFile);
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
		
		//������ ����
		reUser.setProfile(reUser.getProfile().replace("[", ""));
		reUser.setProfile(reUser.getProfile().replace("]", ""));
		String[] filelist = reUser.getProfile().split(", ");
		
		//���ɻ� ��������
		int[] interestNo = new int[3];
		interestNo[0] = reUser.getFirstInterest();
		interestNo[1] = reUser.getSecondInterest();
		interestNo[2] = reUser.getThirdInterest();
		
		List<String> interestList = userService.getInterestByUser(interestNo);
		
		//�������� �� �̹��� ���� ��������
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
		
		System.out.println("/user/addType POST ������ user : " + user);
		
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

		// Business logic ����
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
		modelAndView.addObject("reason", "������ �����Ǿ����ϴ�. �ٽ� �α������ּ���.");
		modelAndView.setViewName("redirect:/index.jsp");
		return modelAndView;
	}

	
	
}
