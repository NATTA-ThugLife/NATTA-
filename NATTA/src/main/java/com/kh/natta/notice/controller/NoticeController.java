package com.kh.natta.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.natta.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping(value="notice.na",method=RequestMethod.GET)
	public  String noticeListView() {
		return "notice/noticeListView";
	}
	
	@RequestMapping(value="noticeDetailView.na",method=RequestMethod.GET)
	public  String noticeDetailView() {
		return "notice/noticeDetailView";
	}
	
	@RequestMapping(value="noticeUpdateForm.na",method=RequestMethod.GET)
	public  String noticeUpdateForm() {
		return "notice/noticeUpdateForm";
	}
	
	@RequestMapping(value="noticeWriteForm.na",method=RequestMethod.GET)
	public  String noticeWriteForm() {
		return "notice/noticeWriteForm";
	}
	
	

}
