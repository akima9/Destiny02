package com.destiny.web.info;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

@RestController
@RequestMapping("/info/*")
public class RestInfoController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	//setter Method ���� ����

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
		
		System.out.println("RestInfoController/info/json/imgUpload ����======================");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//���ε��� ���� ���
		/*String realFolder = request.getSession().getServletContext().getRealPath("imageUpload");*/
		String realFolder = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\uploadImg";
		System.out.println("realFolder : "+realFolder);
		UUID uuid = UUID.randomUUID();
		
		//���ε��� ���� �̸�
		String orgFilename = file.getOriginalFilename();
		String strFilename = uuid.toString() + orgFilename;
		
		System.out.println("���� ���ϸ� : "+orgFilename);
		System.out.println("������ ���ϸ� : "+strFilename);
		
		String filepath = realFolder +"\\"+ strFilename;
		System.out.println("���ϰ�� : "+filepath);
		
		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f); // ������ ���Ͽ� ����
		
		/*File str = new File(strFilename);
		if (str.isFile()) {
			System.out.println("������ �����մϴ�."+str);
		}
		else {
			System.out.println("������ �������� �ʽ��ϴ�."+str);
		}*/
		
		out.print("/resources/images/uploadImg/"+strFilename);
		out.close();
	}
	/*profileUpload : end*/
	
	/*likeRestaurantInfo : start*/
	@RequestMapping(value="/json/likeRestaurantInfo/{communityNo}", method=RequestMethod.POST)
	public Map<String, Object> likeRestaurantInfo(@PathVariable("communityNo") int communityNo) throws Exception{
		
		System.out.println("likeRestaurantInfo() ����================");
		
		communityService.likeCommunity(communityNo);
		
		Community community = communityService.getCommunity(communityNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("community", community);
		
		System.out.println(community);
		
		
		
		/*ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);*/
		return map;
	}
	/*likeRestaurantInfo : end*/
}
