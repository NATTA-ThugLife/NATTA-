package com.kh.natta.customer.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	// mailSending 코드
	@RequestMapping(value = "mainMail.na",method = RequestMethod.POST)
	public String mailSending(HttpServletRequest request,String email,Model model) {

		String setfrom = "thugkinghansol@gmail.com";
		String tomail = email; // 받는 사람 이메일
		String title = "안녕하세요 타투사이트 NATTA입니다."; // 제목
		String content = "2020년 KH정보교육원 F반 터그라이프(오서연,서이석,안정민,윤현모)입니다. 다들 수고하셨습니다!"; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		model.addAttribute("msg","이메일이 전송되었습니다.");
		model.addAttribute("url","main.na");			
		return "common/Alert";
	}
}