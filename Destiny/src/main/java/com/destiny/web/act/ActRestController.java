package com.destiny.web.act;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/act/*")
public class ActRestController {

	public ActRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="json/inquiry/{propose}", method=RequestMethod.GET)
	public Map<String, Object> inquiry(@PathVariable("propose") String propose) throws Exception{
		
		System.out.println("act/inquiry/"+ propose);
		
		String host = "smtp.naver.com";
		String subject = "�������� ����";
		String fromName = "������";
		String from = "ABC";
		String to1 = "pischa@naver.com";
		
		//String user = "pischa@naver.com";
		String password = "sunnydays15358";
		
		String content = "������ ���� ���ǻ����� �����Ǿ����ϴ�. ["+propose+"]";
		
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
			msg.setText(content);
			
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
