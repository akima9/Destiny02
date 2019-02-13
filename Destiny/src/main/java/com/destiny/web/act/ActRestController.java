package com.destiny.web.act;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.destiny.common.Search;
import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;
import com.destiny.service.meeting.MeetingService;

@RestController
@RequestMapping("/act/*")
public class ActRestController {
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public ActRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="json/getAdviceistByAndroid/{currentPage}", method=RequestMethod.GET)
	public List<Community> getAdviceistByAndroid(@PathVariable int currentPage) throws Exception{
		System.out.println("act/json/getAdviceistByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		
		search.setPageSize(pageSize);
		
		System.out.println(":: search : "+search);
		
		Map<String, Object> map = communityService.getLoveAdviceList(search);
		
		System.out.println("MAP : "+map);
		
		List<Community> list = (List<Community>)map.get("list");
		return list;
	}
	
	@RequestMapping(value="json/getInfoListByAndroid/{currentPage}", method=RequestMethod.GET)
	public List<Community> getInfoListByAndroid(@PathVariable int currentPage) throws Exception{
		System.out.println("act/json/getInfoListByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		search.setPageSize(pageSize);
		System.out.println(":: search : "+search);

		Map<String, Object> map = communityService.getCommunityList(search);
		
		System.out.println("MAP : "+map);
		
		List<Community> list = (List<Community>)map.get("list");
		return list;
	}
	
	@RequestMapping(value="json/getNoticeListByAndroid/{currentPage}", method=RequestMethod.GET)
	public List<Community> getNoticeListByAndroid(@PathVariable int currentPage) throws Exception{
		System.out.println("act/json/getNoticeListByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		search.setPageSize(pageSize);
		System.out.println(":: search : "+search);

		Map<String, Object> map = communityService.getNoticeList(search);
		
		System.out.println("MAP : "+map);
		
		List<Community> list = (List<Community>)map.get("list");
		return list;
	}
	
	@RequestMapping(value="json/getMeetingByAndroid/{meetingNo}", method=RequestMethod.GET)
	public Meeting getMeeting(@PathVariable int meetingNo) throws Exception{
		System.out.println("json/getMeeting/"+meetingNo);
		Meeting meeting = meetingService.getMeeting(meetingNo);
		System.out.println("�ȵ���̵�� ���޵Ǵ� meeting : " + meeting);
		return meeting;
	}
	
	@RequestMapping(value="json/inquiry/{propose}", method=RequestMethod.GET)
	public Map<String, Object> inquiry(@PathVariable("propose") String propose, HttpSession users) throws Exception{
		
		System.out.println("act/inquiry/"+ propose);
		
		String host = "smtp.naver.com";
		String subject = "�������� ����";
		String fromName = "������";
		String from = "ABC";
		String to1 = "pischa@naver.com";
		
		//String user = "pischa@naver.com";
		String password = "tls3507fma";
		
		//HttpSession users = 
		//String content = propose;
		String userId = ((User)users.getAttribute("me")).getUserId();
		String userEmail = ((User)users.getAttribute("me")).getEmail();
		System.out.println(userId);
		System.out.println(userEmail);
		try {
			
			System.out.println("sendEmail try ����. email : " + to1);
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.user", 587);
			props.put("mail.smtp.auth", "true");
			System.out.println("Properties ����  : " + props.toString());
			
			Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(to1,password);
					}
			});
			
			System.out.println("session ���� " + session.toString());
			
			Message msg = new MimeMessage(session);
			
			
			msg.setFrom(new InternetAddress(to1));
			
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to1));
			msg.setSubject("Inquiry Mail");
			//msg.setText(content);
			msg.setContent(	/*"<div style=\"border: solid 1px black;inline-size: fit-content;border-radius: 30px;\">"+*/
							"<img style=\"width:30%;height: 300px; margin-left: 5%;\" src=\"https://i.imgur.com/mWJS8jQ.png\">"+
							"<hr/>"+
							"<h1 style=\"margin-left: 5%;\">���� ������ ���� �Ǿ����ϴ�.</h1><br/>"+
							"<h1 style=\"margin-left: 5%;\"> '"+propose+"' </h1>"+
							"<a style=\"margin-bottom:5px; margin-left: 5%; font-size: 20px;\" href='http://127.0.0.1:8080/'> �亯�ϱ� </a>", 
			           		"text/html;charset=utf-8");
			
			System.out.println("msg ���� : " + msg.toString());
			
			Transport.send(msg);
			
		} catch(MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "ok");
		
		return map;
	}
}
