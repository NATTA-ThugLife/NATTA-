package com.kh.natta.qna.controller;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.customer.domain.Customer;
import com.kh.natta.qna.domain.Pagination;
import com.kh.natta.qna.domain.Paging;
import com.kh.natta.qna.domain.Qna;
import com.kh.natta.qna.domain.QnaComment;
import com.kh.natta.qna.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qService;
	
	//qna 목록
	@RequestMapping(value="qna.na",method=RequestMethod.GET)
		public ModelAndView qnaListView(ModelAndView mv,@RequestParam(value="page", required=false) Integer page) {
			
			int currentPage = (page !=null) ? page : 1;
			int listCount = qService.getListCount();
			Paging pi = Pagination.getPaging(currentPage, listCount);
			ArrayList<Qna> qList = qService.selectList(pi);
				mv.addObject("qList",qList);
				mv.addObject("pi",pi);
				mv.setViewName("qna/qnaListView");
			return mv;
	}
	
	//qna 상세 보기
	@RequestMapping(value="qnaDetailView.na",method=RequestMethod.GET)
		public ModelAndView qnaDetailView(ModelAndView mv, int qnaCode, Integer page){	
			int currentPage = page != null ? page : 1;
			// 조회수 증가
			qService.addReadCount(qnaCode);
			// 게시글 상세 조회
			Qna Qna = qService.selectQna(qnaCode);
			if(Qna != null) {
				mv.addObject("Qna",Qna).addObject("currentPage", currentPage).setViewName("qna/qnaDetailView");				
			}else {
				mv.addObject("msg","게시글 상세조회 실패!");
				mv.setViewName("common/errorPage");
			}
			return mv;
	}
	
	//qna 작성 페이지
		@RequestMapping(value="qnaWriteForm.na",method=RequestMethod.GET)
		public  String qnaWriteForm() {
			return "qna/qnaWriteForm";
		}		
		
	//qna 작성
		@RequestMapping(value="qnaInsert.na", method=RequestMethod.POST)
		public String QnaInsert(Qna Qna, Model model, HttpServletRequest request) {
			int result = 0;
			String path = null;
			result = qService.registerQna(Qna);
			if(result>0) {
				model.addAttribute("msg","Qna가 등록되었습니다.");
				model.addAttribute("url","qna.na");			
				return "common/Alert";
			}else {
				model.addAttribute("msg","보드 등록 실패!");
				path = "common/errorPage";
			}
			return path;
		}
	
	//qna 수정 페이지
	@RequestMapping(value="qnaUpdateForm.na",method=RequestMethod.GET)
		public ModelAndView qnaUpdateForm(ModelAndView mv, @RequestParam("qnaCode") int qnaCode, @RequestParam("page") Integer page) {
		Qna qna = qService.selectQna(qnaCode);
		mv.addObject("Qna",qna);
		mv.addObject("currentPage",page);
		mv.setViewName("qna/qnaUpdateForm");
		return mv;
	}
	
	//qna 수정
	@RequestMapping(value="qnaUpdate.na", method=RequestMethod.POST)
	public ModelAndView QnaUpdate(ModelAndView mv, @ModelAttribute Qna Qna,
			HttpServletRequest request,
			@RequestParam("page") Integer page) {
		//System.out.println(Qna);
		int result = qService.modifyQna(Qna);
		if(result > 0) {
			mv.addObject("msg","Qna가 수정되었습니다.").addObject("url","qna.na").setViewName("common/Alert");
		}else {
			mv.addObject("msg","게시글 수정 실패")
			.setViewName("common/errorPage");
		}
		return mv;
	}

	//qna 삭제
	@RequestMapping(value="qnaDelete.na", method=RequestMethod.GET)
	public String QnaDelete(int qnaCode, HttpServletRequest request, Model model) {			
		Qna Qna = qService.selectQna(qnaCode);			
		int result = qService.deleteQna(qnaCode);
		if(result>0) {
			model.addAttribute("msg","Qna가 삭제되었습니다.");
			model.addAttribute("url","qna.na");			
			return "common/Alert";
		}else
			model.addAttribute("msh", "게시글 삭제 실패..");
		return "common/errorPage";
	}

	//qna 댓글 작성
	@ResponseBody
	@RequestMapping(value="addQnaComment.na", method=RequestMethod.POST)
	public String addQnaComment(QnaComment QnaComment, HttpSession session) {		
		//System.out.println(QnaComment);
		Customer loginCustomer= (Customer)session.getAttribute("loginCustomer"); // 로그인 하지 않으면 Exception 발생
		//System.out.println(loginCustomer.getCustomerId());
		String QcWriter = loginCustomer.getCustomerId();
		
		/*
		 * Artist loginArtist= (Artist)session.getAttribute("loginArtist"); String
		 * QcWriter = loginArtist.getArtistId();
		 */	 
		
		QnaComment.setQcWriter(QcWriter);
		//System.out.println(QnaComment);
		int result = qService.insertQnaComment(QnaComment);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//댓글 전체 조회
	@RequestMapping(value="QnaCommentList.na", method=RequestMethod.GET)
	public void getQnaCommentList(HttpServletResponse response, int qnaCode) throws Exception{
		//System.out.println("조회"+qnaCode);
		ArrayList<QnaComment> qcList = qService.selectQnaCommentList(qnaCode);
		//System.out.println(qcList);
		for(QnaComment qc : qcList) {
			qc.setQcContents(URLEncoder.encode(qc.getQcContents(),"utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create(); 
		gson.toJson(qcList, response.getWriter());
		PrintWriter out = response.getWriter();
		
	}
	
	

}
