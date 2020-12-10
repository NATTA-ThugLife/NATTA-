package com.kh.natta.customer.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	// 로그인
	@RequestMapping(value="customerLogin.na")
	public ModelAndView customerLogin(String customerId, String password, ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer customer = new Customer(customerId,password);
		Customer loginCustomer = service.loginCustomer(customer);
		System.out.println(loginCustomer);
		if(loginCustomer != null) {
			session.setAttribute("loginCustomer", loginCustomer);
			mv.setViewName("main/mainPage");
		}else {	
			mv.addObject("msg","로그인 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	// 로그아웃
	  @RequestMapping(value="customerLogout.na",method=RequestMethod.GET)
	  public String customerLogout(HttpServletRequest request) { 
		  HttpSession session = request.getSession(); session.invalidate();
		  return "main/mainPage"; 
	  }
	 
	
	// 회원가입 페이지 뷰
	@RequestMapping(value="customereJoinView.na",method=RequestMethod.GET)
	public String enrollView() {
		return "join/customerjoin";
	}
	
	// 가입버튼
	@RequestMapping(value="customerRegister.na",method=RequestMethod.POST)
	public String customerRegister(Model model, Customer customer,String post, String address) {
		customer.setAddress(post+","+address);
		System.out.println(customer);
		int result = service.registerCustomer(customer);
		//System.out.println(result);
		if(result > 0) {			
			return "redirect:main.na";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
			return "common/errorPage";
		}
	}
	
	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value="dupId.na", method=RequestMethod.GET)
	public String idDuplicateCheck(String customerId) {
		boolean isUsable = service.checkIdDup(customerId) == 0 ? true : false;
		return isUsable+""; 
	}
	
	@RequestMapping(value = "login.na", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "join/login";
	}
	
	@RequestMapping(value = "joinOption.na", method = RequestMethod.GET)
	public String joinOption(Locale locale, Model model) {
		return "join/joinOption";
	}
	
	@RequestMapping(value = "find.na", method = RequestMethod.GET)
	public String find(Locale locale, Model model) {
		return "join/find";
	}
	
}
