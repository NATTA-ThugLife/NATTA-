package com.kh.natta.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.natta.qna.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qService;
	
	@RequestMapping(value="qna.na",method=RequestMethod.GET)
	public  String qnaListView() {
		return "qna/qnaListView";
	}
	
	@RequestMapping(value="qnaDetailView.na",method=RequestMethod.GET)
	public  String qnaDetailView() {
		return "qna/qnaDetailView";
	}
	
	@RequestMapping(value="qnaUpdateForm.na",method=RequestMethod.GET)
	public  String qnaUpdateForm() {
		return "qna/qnaUpdateForm";
	}
	
	@RequestMapping(value="qnaWriteForm.na",method=RequestMethod.GET)
	public  String qnaWriteForm() {
		return "qna/qnaWriteForm";
	}
}
