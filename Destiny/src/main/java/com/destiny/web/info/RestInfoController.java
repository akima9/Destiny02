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
	//setter Method ���� ����

	public RestInfoController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	/*@RequestMapping(value="json/imgUpload")
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("RestInfoController/info/json/imgUpload ����======================");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//���ε��� ���� ���
		String realFolder = request.getSession().getServletContext().getRealPath("imageUpload");
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
		file.transferTo(f);
		out.println("imageUpload/"+strFilename);
		out.close();
		
		JSONObject jobj = new JSONObject();
		jobj.put("url", filepath);
		response.setContentType("application/json");
		out.print(jobj.toJSONString());
		System.out.println("jobj.toJSONString() : "+jobj.toJSONString());
	}*/
	
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
		out.print("/resources/images/uploadImg/"+strFilename);
		out.close();
	}
}
