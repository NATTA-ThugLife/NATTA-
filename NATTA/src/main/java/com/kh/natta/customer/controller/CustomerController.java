package com.kh.natta.customer.controller;

import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customer.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;
	
	@Autowired
	private JavaMailSender mailSender;

	// 로그인 페이지
	@RequestMapping(value = "login.na", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "join/login";
	}

	// 로그인
	@RequestMapping(value = "customerLogin.na")
	public ModelAndView customerLogin(String customerId, String password, ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer customer = new Customer(customerId, password);
		Customer loginCustomer = service.loginCustomer(customer);
		// System.out.println(loginCustomer);
		if (loginCustomer != null) {
			session.setAttribute("loginCustomer", loginCustomer);
			mv.setViewName("main/mainPage");
		} else {
			mv.addObject("msg", "올바른 아이디와 비밀번호를 입력해주세요.");
			mv.setViewName("join/login");
		}
		return mv;
	}

	// 로그아웃 페이지
	@RequestMapping(value = "customerLogout.na", method = RequestMethod.GET)
	public String customerLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "main/mainPage";
	}

	// 회원가입 페이지
	@RequestMapping(value = "customerJoinView.na", method = RequestMethod.GET)
	public String enrollView() {
		return "join/customerjoin";
	}

	// 가입
	@RequestMapping(value = "customerRegister.na", method = RequestMethod.POST)
	public String customerRegister(Model model, Customer customer, String post, String address, String address2) {
		customer.setAddress(post + "," + address + "," + address2);
		// System.out.println(customer);
		int result = service.registerCustomer(customer);
		// System.out.println(result);
		if (result > 0) {
			model.addAttribute("msg","회원 가입 성공");
			model.addAttribute("url","login.na");			
			return "common/Alert";			
		} else {
			model.addAttribute("msg", "회원 가입 실패");
			return "join/customerjoin";
		}
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "dupId.na", method = RequestMethod.GET)
	public String idDuplicateCheck(String customerId) {
		boolean isUsable = service.checkIdDup(customerId) == 0 ? true : false;
		return isUsable + "";
	}

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "dupEmail.na", method = RequestMethod.GET)
	public String emailDuplicateCheck(String email) {
		//System.out.println(email);
		boolean isUsable = service.checkEmailDup(email) == 0 ? true : false;
		//System.out.println(isUsable);
		return isUsable + "";
	}

	/*
	/ * //회원가입할때 회원/아티스트 선택 옵션 
	 * @RequestMapping(value = "joinOption.na", method = RequestMethod.GET) public
	 * String joinOption(Locale locale, Model model) { return "join/joinOption"; }
	 */

	// 아이디 찾기 페이지
	@RequestMapping(value = "findId.na", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {
		return "join/findId";
	}

    // 아이디 찾기 (이메일 인증)
	@ResponseBody
	@RequestMapping(value = "findIdEmail.na")
	public String findIdEmail(String customerName, String email) {
		Customer customer = new Customer();
		customer.setCustomerName(customerName);
		customer.setEmail(email);
		//System.out.println("email인증"+customerName);
		//System.out.println("email인증"+email);
		Customer findCustomer = service.findIdEmail(customer);
		System.out.println("email인증"+findCustomer);
		if(findCustomer != null) {
		    return findCustomer.getCustomerId();
		}else {
			return"fail";
		}
	}
	
	//아이디 찾기 (폰번호 인증)
	@ResponseBody
	@RequestMapping(value = "findIdPhone.na")
	public String findIdPhone(String customerName, String phone) {
		Customer customer = new Customer();
		customer.setCustomerName(customerName);
		customer.setPhone(phone);
		//System.out.println("phone인증"+customerName);
		//System.out.println("phone인증"+phone);		
		Customer findCustomer = service.findIdPhone(customer);
		System.out.println("phone인증"+findCustomer);
		if(findCustomer != null) {
		    return findCustomer.getCustomerId();
		}else {
			return"fail";
		}
	}	
	
	// 비번 찾기 페이지
	@RequestMapping(value = "findPwd.na", method = RequestMethod.GET)
	public String finPwdView() {
		return "join/findPwd";
	}
	

	// 비번 찾기 이메일 전송
	@RequestMapping(value = "mailSending.na", method = RequestMethod.POST)
	public String findPwd(Model model,String customerId, String customerName, String email) {
		Customer customer = new Customer();
		customer.setCustomerId(customerId);
		customer.setCustomerName(customerName);
		customer.setEmail(email);
		
		Customer findCustomerPwd = service.findPwdEmail(customer);
	    //System.out.println(findCustomerPwd);
		
		if(findCustomerPwd != null) {		
		String tomail = findCustomerPwd.getEmail(); // 받는 사람 이메일
		//System.out.println(tomail);
		String title = "회원님의 비밀번호입니다."; // 제목
		String content = findCustomerPwd.getCustomerId()+"님의 비밀번호는 "+findCustomerPwd.getPassword()+"입니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom("thugkinghansol@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
			// System.out.println(messageHelper);
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		model.addAttribute("msg","이메일이 전송되었습니다.");
		model.addAttribute("url","join/login");			
		return "common/Alert";
	} else {
		model.addAttribute("msg","올바른 정보를 입력해주세요.");
		model.addAttribute("url","join/findPwd");			
		return "common/Alert";
	}
}
		
	
}
