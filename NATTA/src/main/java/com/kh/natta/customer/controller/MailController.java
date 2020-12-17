/*
 * package com.kh.natta.customer.controller;
 * 
 * import java.util.Random;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.servlet.mvc.support.RedirectAttributes;
 * 
 * import com.kh.natta.customer.service.MailService;
 * 
 * @Controller public class MailController { private MailService mailService;
 * 
 * public void setMailService(MailService mailService) { this.mailService =
 * mailService; }
 * 
 * // 비밀번호 찾기
 * 
 * @RequestMapping(value = "sendPwdEmail.na", method = RequestMethod.POST)
 * public String sendMailPassword(HttpSession session, @RequestParam String
 * id, @RequestParam String email, RedirectAttributes ra) {
 * 
 * User user = userService.findAccount(email); if (user != null) { int ran = new
 * Random().nextInt(100000) + 10000; // 10000 ~ 99999 String password =
 * String.valueOf(ran); userService.updateInfo(user.getNo(), "password",
 * password); // 해당 유저의 DB정보 변경
 * 
 * String subject = "임시 비밀번호 발급 안내 입니다."; StringBuilder sb = new
 * StringBuilder(); sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
 * mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
 * ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다."); }
 * else { ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다."); }
 * return "redirect:/find/password"; } }
 */