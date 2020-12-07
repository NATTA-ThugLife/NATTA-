package com.kh.natta.customer.controller;

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
	@RequestMapping(value="customereLogin.na", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView customerLogin(String customerId, String password, ModelAndView mv, HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		Customer customer = new Customer(customerId,password);
		Customer loginCustomer = service.loginCustomer(customer);
		if(loginCustomer != null) {
			session.setAttribute("loginCustomer", loginCustomer);
			mv.setViewName("home");
		}else {	
			mv.addObject("msg","로그인 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	// 로그아웃
	@RequestMapping(value="customereLogout.na",method=RequestMethod.GET)
	public String customerLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main.na";
	}
	// 회원가입 페이지 뷰
	@RequestMapping(value="customereJoinView.na",method=RequestMethod.GET)
	public String enrollView() {
		return "customer/customerjoin";
	}
	
	// 가입버튼
	@RequestMapping(value="customerRegister.na",method={RequestMethod.GET, RequestMethod.POST})
	public String customerRegister(Model model, Customer customer,String post, String address) {
		customer.setAddress(post+","+address);
		int result = service.registerCustomer(customer);
		//System.out.println(result);
		if(result > 0) {
			return "redirect:home.na";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
			return "common/errorPage";
		}
	}
	// 마이페이지 뷰
//	@RequestMapping(value="myInfo.na",method=RequestMethod.GET)
//	public String myInfoView() {
//		return "customer/customerMyPage";
//	}
	
	// 회원 정보 수정
	@RequestMapping(value="customerModify.na",method=RequestMethod.POST)
	public String modifyCustomer(@ModelAttribute Customer customer,
								@RequestParam("post") String post,
								@RequestParam("address1") String address,
								Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		customer.setAddress(post+","+address);
		int result = service.modifyCustomer(customer);
		if(result>0) {
			session.setAttribute("loginCustomer", customer);
			return "redirect:home.na";
		}else {
			model.addAttribute("msg","정보 수정 실패!");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="customerDelete.na",method=RequestMethod.GET)
	public String deleteCustomer(String customerId,HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int result = service.deleteCustomer(customerId);
		if(result>0) {
			session.invalidate();
			model.addAttribute("msg", "회원 탈퇴 성공");
			return "redirect:home.na";
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패!");
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
	
}
