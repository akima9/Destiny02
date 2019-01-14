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

import com.destiny.service.domain.User;
import com.destiny.service.user.UserService;



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
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public ModelAndView login(@ModelAttribute("user") User user , HttpSession session, HttpServletRequest request) throws Exception{
		
		System.out.println("/user/login : POST");
		System.out.println("userId : " + user.getUserId());
		System.out.println("password : " + user.getPassword());
		
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		session.setAttribute("me", dbUser);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index.jsp");
		
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

		if( user.getPassword().equals(dbUser.getPassword())){
			
			if(loginList.contains(user.getUserId())) {

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
			
			} else {
				System.out.println("�̹� �α��ε� ȸ���Դϴ�.");
				modelAndView.addObject("result", "Fail");
			}
			
		} else {
			modelAndView.addObject("result", "Fail");
		}
		//====================================================================================================
		
		//=========================================�⼮üũ ���� ���� part===========================================
		int numAttendCount = dbUser.getAttendCount();
		Date lastLoginDate = dbUser.getLastLoginDay();
		System.out.println(dbUser.getUserId() + "�� ������ �α��� ���� : " + lastLoginDate);
		
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());

		System.out.println("���� ��¥(sql) : " + sqlDate);
		
		LocalDate lastLoginDateLocal = new Date(lastLoginDate.getTime()).toLocalDate();
		LocalDate sqlDateLocal = new Date(sqlDate.getTime()).toLocalDate();
		
		if(lastLoginDateLocal.isBefore(sqlDateLocal)) {
			System.out.println("�ٸ��� �����Դϴ�. ������ ���� : " + lastLoginDate + " ���� ���� : " + sqlDate);
			
			dbUser.setLastLoginDay(sqlDate);
			numAttendCount++;
			dbUser.setAttendCount(numAttendCount);
			
			userService.attendLogin(dbUser);
		} else {
			System.out.println("������ �����Դϴ�. ������ ���� : " + lastLoginDate+ " ���� ���� : " + sqlDate);
		}
		//=======================================================================================================
		
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
		
		loginList.remove(userId);
		
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
		
		
		
		//===========================������ ���� ���ε�(����)===========================
		String temDir = "C:\\Users\\Bit\\git\\Destiny\\Destiny\\WebContent\\resources\\images\\userprofile\\";
		
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
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/userInfo/loginView.jsp");

		userService.addUser(user);
		
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
		

		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/updateUser.jsp");
		modelAndView.addObject("user", user);
		modelAndView.addObject("location", location);
		modelAndView.addObject("phone", phone);

		
		return modelAndView;
	}
}
