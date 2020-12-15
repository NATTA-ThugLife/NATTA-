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
	
	//로그인 페이지
		@RequestMapping(value = "login.na", method = RequestMethod.GET)
		public String login(Locale locale, Model model) {
			return "join/login";
		}
		
	//로그인
	@RequestMapping(value="customerLogin.na")
	public ModelAndView customerLogin(String customerId, String password, ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer customer = new Customer(customerId,password);
		Customer loginCustomer = service.loginCustomer(customer);
		//System.out.println(loginCustomer);
		if(loginCustomer != null) {
			session.setAttribute("loginCustomer", loginCustomer);
			mv.setViewName("main/mainPage");
		}else {	
			mv.addObject("msg","로그인 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//로그아웃 페이지
	  @RequestMapping(value="customerLogout.na",method=RequestMethod.GET)
	  public String customerLogout(HttpServletRequest request) { 
		  HttpSession session = request.getSession();
		  session.invalidate();
		  return "main/mainPage"; 
	  }	 
	
	// 회원가입 페이지
	@RequestMapping(value="customerJoinView.na",method=RequestMethod.GET)
	public String enrollView() {
		return "join/customerjoin";
	}	
	
	// 가입
	@RequestMapping(value="customerRegister.na",method=RequestMethod.POST)
	public String customerRegister(Model model, Customer customer,String post, String address, String address2) {
		customer.setAddress(post+","+address+","+address2);
        //System.out.println(customer);
		int result = service.registerCustomer(customer);
		//System.out.println(result);
		if(result > 0) {			
			return "redirect:login.na";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
			return "common/errorPage";
		}
	}
	
	 //아이디 중복검사	  
	  @ResponseBody	  
	  @RequestMapping(value="dupId.na", method=RequestMethod.GET) public String
	  idDuplicateCheck(String customerId) { boolean isUsable =
	  service.checkIdDup(customerId) == 0 ? true : false; return isUsable+""; }
	 
	  
	/*
	 * //회원가입할때 회원/아티스트 선택 옵션
	 * @RequestMapping(value = "joinOption.na", method = RequestMethod.GET) public
	 * String joinOption(Locale locale, Model model) { return "join/joinOption"; }
	 */
	
	//아이디 찾기 페이지
	@RequestMapping(value = "findId.na", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {
		return "join/findId";
	}
	
	//아이디 찾기	
	  @RequestMapping(value="findCustomerId.na")
	  public ModelAndView findCustomerId(String customerName, String email, ModelAndView mv, HttpServletRequest request) { 
		  HttpSession session = request.getSession();
	  Customer customer = new Customer(); 
	  customer.setCustomerName(customerName);
	  customer.setEmail(email); 
	  //System.out.println(customerName);
	  //System.out.println(email);
	  Customer findCustomer = service.findIdEmail(customer);
	  if(findCustomer != null) { 
		  mv.addObject("findCustomer", findCustomer);
		  mv.setViewName("join/foundId"); 
	  }else {
		  mv.addObject("msg","로그인 실패!");
		  mv.setViewName("common/errorPage"); 
	  } return mv;
	  }


//	//비번 찾기 페이지
//	@RequestMapping(value = "findPwd.na", method = RequestMethod.GET)
//	public String findPwd(Locale locale, Model model) {
//		return "join/findPwd";
//	}
//	
//	//비번 찾기 본인 인증
//	@RequestMapping(value="findPwdCerti.na", method = RequestMethod.POST)
//	  public ModelAndView findPwdCerti(String customerId, String customerName, String email, ModelAndView mv, HttpServletRequest request) { 
//		  HttpSession session = request.getSession();
//	  Customer customer = new Customer(); 
//	  customer.setCustomerId(customerId);
//	  customer.setCustomerName(customerName);
//	  customer.setEmail(email); 
//		/*
//		 * System.out.println(customerId); System.out.println(customerName);
//		 * System.out.println(email);
//		 */
//	  Customer findCustomerPwd = service.findPwdEmail(customer);
//	  if(findCustomerPwd != null) { 
//		  mv.addObject("findCustomerPwd", findCustomerPwd);
//		  mv.setViewName("join/findPwdCerti"); 
//	  }else {
//		  mv.addObject("msg","로그인 실패!");
//		  mv.setViewName("common/errorPage"); 
//	  } return mv;
//	  }
//	
//	//비번 변경
//	@RequestMapping(value = "findPwd.na", method = RequestMethod.GET)
//	public String changePwd(Locale locale, Model model) {
//		return "join/changePwd";
//	}
	
	
	
	
}
