package com.kh.natta.customerInfo.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customer.service.CustomerService;
import com.kh.natta.customerInfo.service.CustomerInfoService;


@Controller
public class CustomerInfoController {

	@Autowired
	private CustomerInfoService service;
	
	@Autowired
	private CustomerService cService;
	
	@RequestMapping(value="/customerInfo.na" , method = RequestMethod.GET)
	public String customerInfoView(String customerId) {
		return "Customer-info/customerPage";
	}
	
	@RequestMapping(value="/modifyCustomerInfo.na" , method = RequestMethod.POST)
	public String modifyCustomerInfo(Customer customer,String dupPwd,  String post, String address1, String address2,String orginalFileName, MultipartFile uploadFile, HttpServletRequest request) {
		
		customer.setAddress(post+","+address1+","+address2);
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile,request,customer.getCustomerId());
			if(renameFileName != null) {
				deleteFile(orginalFileName, customer.getCustomerId(), request);
				customer.setCustomerProfile(renameFileName);
			}
		}
		
		int result = service.modifyCustomerModify(customer);
		if(result > 0 ) {
			HttpSession session = request.getSession();
			System.out.println("비밀번호 변경 안됨" + customer);
			if(customer.getPassword().isEmpty()) {
				customer.setPassword(dupPwd);
			}
			Customer updateCustomer = cService.loginCustomer(customer);
			System.out.println("비밀번호 다시 세팅" + customer);
			System.out.println("수정된 후 다시 로그인 : " + updateCustomer);
			session.setAttribute("loginCustomer", updateCustomer);
		}
		return "redirect:customerInfo.na";
	}
	
	// 파일 저장
		public String saveFile(MultipartFile file, HttpServletRequest request, String customerId) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			// 채팅 폴더 만들기 잊지말기
			String savePath = root + "\\customerProfile\\" + customerId;
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdir();
			}
			
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originalFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			
			String filePath = folder + "\\" + renameFileName;
			
			try {
				file.transferTo(new File(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return renameFileName;
		}
		

		
		public void deleteFile(String fileName,String customerId, HttpServletRequest request ) {
		      String root = request.getSession().getServletContext().getRealPath("resources");
		      String savePath = root + "\\customerProfile\\" + customerId;
		      
		      File file = new File(savePath + "\\" + fileName);
		      if (file.exists()) {
		         file.delete();
		      }
		   }
		
		@ResponseBody
		@RequestMapping(value="/dupPwd.na" , method = RequestMethod.POST)
		public String dupPwd(String dupPwd,String customerId) {
			Customer customer = new Customer();
			customer.setPassword(dupPwd);
			customer.setCustomerId(customerId);
			Customer check = service.dupPwd(customer);
			if(check != null) {
				return "success";
			}else {
				return "fail";
			}
		}
}
