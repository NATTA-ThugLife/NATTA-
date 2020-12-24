package com.kh.natta.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.notice.domain.Notice;
import com.kh.natta.notice.domain.Search;
import com.kh.natta.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;

	//공지사항 리스트
	@RequestMapping(value="notice.na",method=RequestMethod.GET)
	public ModelAndView noticeList(ModelAndView mv) {
		ArrayList<Notice> nList = nService.selectList();
		//System.out.println(nList);
			mv.addObject("nList",nList);
			mv.setViewName("notice/noticeListView");
		
		return mv;	
	}

	//공지글 상세 보기
	@RequestMapping(value="noticeDetailView.na",method=RequestMethod.GET)
	public String noticeDetail(int noticeCode, Model model, HttpServletRequest request) {
		nService.addReadCount(noticeCode);
		HttpSession session = request.getSession();
		Customer Customer = (Customer)session.getAttribute("loginCustomer");
		Notice notice = nService.selectOne(noticeCode);
		if(notice!=null && Customer !=null) {
			model.addAttribute("notice",notice);
			return "notice/noticeDetailView";
		}else {
			model.addAttribute("msg","공지사항 상세조회 실패");
			return "common/errorPage";
		}
	}
	
	//공지 작성 페이지
		@RequestMapping(value="noticeWriteForm.na",method=RequestMethod.GET)
		public  String noticeWriteForm() {
			return "notice/noticeWriteForm";
		}
    //공지 작성
		@RequestMapping(value="noticeWrite.na",method=RequestMethod.POST)
		public String noticeInsert(Notice notice, Model model, HttpServletRequest request, HttpSession session) {
			int result = 0;
			String path = null;
			Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
			String noticeWriter = loginCustomer.getCustomerId();
			notice.setNoticeWriter(noticeWriter);
			//System.out.println(loginCustomer);
			//System.out.println(notice);
			result = nService.registerNotice(notice);			
			if(result>0) {
				model.addAttribute("msg","공지 글이 등록되었습니다.");
				model.addAttribute("url","notice.na");			
				return "common/Alert";
			}else {
				model.addAttribute("msg","공지사항 등록 실패!");
				path = "common/errorPage";
			}
			return path;
		}

	//공지 수정 페이지
	@RequestMapping(value = "noticeUpdateForm.na", method = RequestMethod.GET)
	public ModelAndView qnaUpdateForm(ModelAndView mv, @RequestParam("noticeCode") int noticeCode) {
		Notice notice = nService.selectOne(noticeCode);
		mv.addObject("Notice", notice);
		mv.setViewName("notice/noticeUpdateForm");
		return mv;	 
	}
	
	//공지 수정	
	@RequestMapping(value="noticeUpdate.na", method=RequestMethod.POST)
	public ModelAndView NoticeUpdate(ModelAndView mv, @ModelAttribute Notice notice,
			HttpServletRequest request) {
		int result = nService.modifyNotice(notice);
		if(result > 0) {
			mv.addObject("msg","공지 글이 수정되었습니다.").addObject("url","notice.na").setViewName("common/Alert");
		}else {
			mv.addObject("msg","게시글 수정 실패")
			.setViewName("common/errorPage");
		}
		return mv;
	}

	//공지 삭제
	@RequestMapping(value="noticeDelete.na",method=RequestMethod.GET)
	public String noticeDelete(int noticeCode, Model model, HttpServletRequest request) {
		Notice notice = nService.selectOne(noticeCode);
		int result = nService.deleteNotice(noticeCode);
		if(result>0) {
			model.addAttribute("msg","공지 글이 삭제되었습니다.");
			model.addAttribute("url","notice.na");			
			return "common/Alert";
		}else {
			model.addAttribute("msg","공지사항 삭제 실패");
			return "common/errorPage";
		}
	}	
	
	//공지 검색
	@RequestMapping(value="noticeSearch.na",method=RequestMethod.GET)
	public String customSearch(Search search, Model model) {
		ArrayList<Notice> searchList = nService.selectListSearch(search);
		System.out.println(searchList);
		System.out.println(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("List",searchList);
			model.addAttribute("search",search);
			return "notice/noticeListView";
		}else {
			return "notice/noticeListView";
		}
	}


}
