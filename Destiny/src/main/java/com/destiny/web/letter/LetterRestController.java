package com.destiny.web.letter;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.destiny.service.domain.Letter;
import com.destiny.service.domain.User;
import com.destiny.service.letter.LetterService;
import com.destiny.service.user.UserService;

@Controller
@RequestMapping("/letterRest/*")
public class LetterRestController {
	//Field
		@Autowired
		@Qualifier("letterServiceImpl")
		private LetterService letterService;
		
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		
		public LetterRestController() {
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		@RequestMapping( value="letterRest/sendLetter", method=RequestMethod.POST)
		public int sendLetter(@RequestBody Letter letter, HttpSession session, Model model) throws Exception{
			
			System.out.println("/userRest/sendLetter : POST");
			System.out.println("찍어보자 레터 : "+letter);
			int result = 0;
			if(userService.getUser(letter.getReceiverId()) == null) {
				//result ="입력한 수신자 아이디가 존재하지 않습니다.";
				result = 2;
			} else {
			
				User senderUser = (User) session.getAttribute("me");
				
				letter.setSenderId(senderUser.getUserId());
				
				//=================================user별 letter meta-data생성============================================
				String letterMetaDataTitle = letter.getLetterTitle()+System.currentTimeMillis();
				
				String temDirText = "C:\\Users\\Bitcamp\\git\\Destiny02\\Destiny\\WebContent\\letterDetail\\"+letterMetaDataTitle+".txt";
				File sendLetter = new File(temDirText);
				
				//FileWriter fw = new FileWriter(detailProduct, true);
				BufferedWriter fw = new BufferedWriter(new FileWriter(sendLetter, true));
				fw.write(letter.getLetterDetail());
				fw.flush();
				fw.close();
				
				letter.setLetterDetail(letterMetaDataTitle);
				//===================================================================================================
				
				System.out.println(letter);
				
				//==============================================DB 운용===============================================
				letterService.sendLetter(letter);
				//===================================================================================================
				//model.addAttribute("reason", "쪽지가 정상적으로 전송되었습니다.");
				result = 1;	}
			
			return result;
		}
}
