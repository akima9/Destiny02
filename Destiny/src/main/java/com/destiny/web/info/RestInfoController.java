package com.destiny.web.info;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.destiny.service.community.CommunityService;

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

	@RequestMapping(value="json/imgUpload")
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("RestInfoController/info/json/imgUpload 실행======================");
		
		/*response.setContentType("text/html;charset=utf-8");*/
		PrintWriter out = response.getWriter();
		
		//업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("imageUpload");
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
		file.transferTo(f);
		out.println("imageUpload/"+strFilename);
		out.close();
		
		JSONObject jobj = new JSONObject();
		jobj.put("url", filepath);
		response.setContentType("application/json");
		out.print(jobj.toJSONString());
		System.out.println("jobj.toJSONString() : "+jobj.toJSONString());
	}
	
	/*@Autowired
	@Qualifier("jsonView")
	MappingJackson2JsonView jsonView;
	
	@RequestMapping(value="json/imgUpload")
	public ModelAndView profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("RestInfoController/info/json/imgUpload 실행======================");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setView(jsonView);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("imageUpload");
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
		file.transferTo(f);
		
		out.println("imageUpload/"+strFilename);
		out.close();
		
		JSONObject jobj = new JSONObject();
		jobj.put("url", filepath);
		modelAndView.addObject("result",jobj);
		response.setContentType("application/json");
		out.print(jobj.toJSONString());
		System.out.println("jobj.toJSONString() : "+jobj.toJSONString());
		return modelAndView;
		
		
	}*/
}
