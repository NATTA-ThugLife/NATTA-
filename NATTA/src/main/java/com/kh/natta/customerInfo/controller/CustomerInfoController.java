package com.kh.natta.customerInfo.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customer.service.CustomerService;
import com.kh.natta.customerInfo.domain.Following;
import com.kh.natta.customerInfo.domain.Review;
import com.kh.natta.customerInfo.service.CustomerInfoService;
import com.kh.natta.reservation.domain.Reservation;


@Controller
public class CustomerInfoController {

	@Autowired
	private CustomerInfoService service;
	
	@Autowired
	private CustomerService cService;
	
	@RequestMapping(value="/customerInfo.na" , method = RequestMethod.GET)
	public String customerInfoView(String customerId, Model model) {
		ArrayList<Following> fList = service.selectListFollowing(customerId);
		ArrayList<Review> rList = service.selectListReview(customerId);
		ArrayList<Reservation> resList = service.selectListReservation(customerId);
		model.addAttribute("resList",resList);
		model.addAttribute("fList",fList);
		model.addAttribute("rList",rList);
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
			if(customer.getPassword().isEmpty()) {
				customer.setPassword(dupPwd);
			}
			Customer updateCustomer = cService.loginCustomer(customer);
			session.setAttribute("loginCustomer", updateCustomer);
		}
		return "redirect:customerInfo.na";
	}
	
	// 파일 저장
		public String saveFile(MultipartFile file, HttpServletRequest request, String customerId) {
			String root = request.getSession().getServletContext().getRealPath("resources");
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
		
		@ResponseBody
		@RequestMapping(value="/dupReview.na" , method = RequestMethod.POST)
		public String dupPwd(int reservationCode) {
			
			Review check = service.dupReview(reservationCode);
			
			if(check == null) {
				return "success";
			}else {
				return "fail";
			}
			
		}
		@ResponseBody
		@RequestMapping(value="/deletefollow.na", method= RequestMethod.POST)
		public String deleteFollow(Following following) {
			int result = service.deleteFollowing(following);
			if(result > 0 ) {
				return following.getArtistId();
			}else {
				return null;
			}
		}
		
		@RequestMapping(value="/modifyReview.na", method = RequestMethod.POST)
		public String modifyReview(Review review, String originFile, MultipartFile uploadFile, HttpServletRequest request) {
			HttpSession session = request.getSession();
			Customer customer = (Customer)session.getAttribute("loginCustomer");
			String customerId = customer.getCustomerId();
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				deleteReviewFile(originFile, customerId, request,review.getReviewCode());
				String renameFileName = saveReviewFile(uploadFile,request,customerId, review.getReviewCode());
				review.setReviewPhoto(renameFileName);
			}else {
				review.setReviewPhoto(originFile);
			}
			int result = service.modifyReview(review);
			return "redirect:/customerInfo.na?customerId="+customerId;
		}

		@RequestMapping(value="/insertReview.na",method = RequestMethod.POST)
		public String insertReview(Review review, HttpServletRequest request,MultipartFile uploadFile) {
			HttpSession session = request.getSession();
			Customer customer = (Customer)session.getAttribute("loginCustomer");
			String customerId = customer.getCustomerId();
			review.setCustomerId(customerId);
			review.setReviewCode(review.getReservationCode());
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				String renameFileName = saveReviewFile(uploadFile,request,customerId, review.getReservationCode());
				review.setReviewPhoto(renameFileName);
			}
			System.out.println(review);
			int result = service.insertReview(review);
			return "redirect:/customerInfo.na?customerId="+customerId;
		}
		
		
		// 파일 저장
		public String saveReviewFile(MultipartFile file, HttpServletRequest request, String customerId, int reviewCode) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\review\\" + customerId + "\\" + reviewCode;
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
		

		
		public void deleteReviewFile(String fileName,String customerId, HttpServletRequest request , int reviewCode) {
		      String root = request.getSession().getServletContext().getRealPath("resources");
		      String savePath = root + "\\review\\" + customerId + "\\" + reviewCode;
		      
		      File file = new File(savePath + "\\" + fileName);
		      if (file.exists()) {
		         file.delete();
		      }
		   }
		
		public void deleteFolder(String customerId,HttpServletRequest request,int reviewCode) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String deletePath = root + "\\review\\" + customerId + "\\" + reviewCode;
			File folder = new File(deletePath);
			folder.delete();
		}
		
		@ResponseBody
		@RequestMapping(value = "/deleteReview.na", method = RequestMethod.POST)
		public int deleteReview(int reviewCode, String reviewPhoto, String customerId, HttpServletRequest request) {
			deleteReviewFile(reviewPhoto, customerId, request, reviewCode);
			deleteFolder(customerId,request,reviewCode);
			int result = service.deleteReview(reviewCode);
			
			if(result > 0) {
				return reviewCode;
			}else {
				return 0;
			}
		}
		
		@RequestMapping(value ="/deleteResvertion.na" , method = RequestMethod.POST)
		public String deleteResvertion(int reservationCode, HttpServletRequest request) {
			Reservation reservation = service.selectOneReservation(reservationCode);
			HttpSession session = request.getSession();
			Customer customer = (Customer)session.getAttribute("loginCustomer");
			String customerId = customer.getCustomerId();
			deleteReservationFile(reservation.getRenameFilename(), request);
		    int result = service.deleteResvertion(reservationCode);
			return "redirect:/customerInfo.na?customerId="+customerId;
		}
		
		
		public void deleteReservationFile(String fileName, HttpServletRequest request ) {
		      String root = request.getSession().getServletContext().getRealPath("resources");
		      String savePath = root + "\\images\\ruploadFiles";
		      
		      File file = new File(savePath + "\\" + fileName);
		      if (file.exists()) {
		         file.delete();
		      }
		   }
}
