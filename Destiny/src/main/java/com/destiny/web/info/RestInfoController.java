package com.destiny.web.info;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;
import com.destiny.service.domain.User;

@RestController
@RequestMapping("/info/*")
public class RestInfoController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	//setter Method 구현 않음

	public RestInfoController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	/*profileUpload : start*/
	@RequestMapping(value="json/imgUpload")
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("RestInfoController/info/json/imgUpload 실행======================");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//업로드할 폴더 경로
		/*String realFolder = request.getSession().getServletContext().getRealPath("imageUpload");*/
		String realFolder = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\uploadImg";
		System.out.println("realFolder : "+realFolder);
		UUID uuid = UUID.randomUUID();
		
		//업로드할 파일 이름
		String orgFilename = file.getOriginalFilename();
		String strFilename = uuid.toString() + orgFilename;
		
		System.out.println("원본 파일명 : "+orgFilename);
		System.out.println("저장할 파일명 : "+strFilename);
		
		String filepath = realFolder +"\\"+ strFilename;
		System.out.println("파일경로 : "+filepath);
		
		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f); // 지정한 파일에 저장
		
		out.print("http://127.0.0.1:8080/resources/images/uploadImg/"+strFilename);
		out.close();
	}
	/*profileUpload : end*/
	
	/*likeRestaurantInfo : start*/
	@RequestMapping(value="/json/likeRestaurantInfo/{communityNo}", method=RequestMethod.POST)
	public Map<String, Object> likeRestaurantInfo(@PathVariable("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount, HttpSession session ) throws Exception{
				
		System.out.println("likeRestaurantInfo() 실행================");
		
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		System.out.println("comminityNo?? : " + communityNo);
		
		likeCount.setLikeCountId(userId);
		likeCount.setLikeCountCommunityNo(communityNo);
		communityService.checkId(likeCount);
		
		System.out.println("여기는 아이디체크! : " + communityService.checkId(likeCount));
		
		
		if(communityService.checkId(likeCount) != null) {
			String likeCountCheck = communityService.checkId(likeCount).getLikeCountCheck();
			likeCount.setLikeCountCheck(likeCountCheck);
			System.out.println("====likeCheckId가 null이 아닙니다.=====");
			
			if(communityService.checkId(likeCount).getLikeCountCheck().equals("Y")) {
				System.out.println("====likeCheckId가 null이 아닙니다. ( Y)=====");
				likeCount.setLikeCountCheck("N");
				communityService.updateLikeCount(likeCount);
				System.out.println("====Like(-)=====");
				communityService.subLikeCommunity(communityNo); //-1 / LIKECOUNT_CHECK = 'N'
				
			}else if(communityService.checkId(likeCount).getLikeCountCheck().equals("N")) {
				System.out.println("====likeCheckId가 null이 아닙니다. (N)=====");
				likeCount.setLikeCountCheck("Y");
				communityService.updateLikeCount(likeCount);
				System.out.println("====Like(+)=====");
				communityService.addLikeCommunity(communityNo); //+1 /LIKECOUNT_CHECK = 'Y'
				
			}
			
		}else if(communityService.checkId(likeCount) == null) {
			System.out.println("====likeCheckId가 null입니다.=====");
			communityService.addLikeCount(likeCount);
			System.out.println("====addLike null=====");
			communityService.addLikeCommunity(communityNo); //+1
		}
		
		Community community = communityService.getCommunity(communityNo);
		
		System.out.println("community2 : "+community);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("community", community);
		
		return map;
	}
	/*likeRestaurantInfo : end*/
}
