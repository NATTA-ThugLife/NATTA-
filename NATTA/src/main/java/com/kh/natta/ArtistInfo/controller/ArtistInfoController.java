package com.kh.natta.ArtistInfo.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.service.ArtistInfoService;

@Controller
public class ArtistInfoController {
	@Autowired
	private ArtistInfoService infoService;
	
	// 아티스트 페이지 이동 
	@RequestMapping(value="artistPage.na", method=RequestMethod.GET)
	public String ArtistInfo(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ArrayList<String> artist = new ArrayList<String>();
		artist.add("TEST1");
		session.setAttribute("loginUser", "test1");
		model.addAttribute("artist",artist);
		return "/Artist-info/artistPage";
	}
	
	
	
	//아티스트 소개 등록
	@RequestMapping(value="InsertArtistInfo.na",method=RequestMethod.POST)
	public String artistInfoInsert(ArtistInfo artistInfo, Model model, HttpServletRequest request,
									@RequestParam(name="uploadFile",required=false) MultipartFile uploadFile) {
		System.out.println(uploadFile);
		System.out.println(artistInfo);
		  if(!uploadFile.getOriginalFilename().equals("")) { 
			  String reProfileName = saveFile(uploadFile, request); 
			  if( reProfileName != null) {
				  artistInfo.setMyProfile(uploadFile.getOriginalFilename());
				  artistInfo.setMyReProfile(reProfileName); 
			  } 
		  }
		int result = 0;
		String path = null;
		result = infoService.registerArtistInfo(artistInfo);
		if( result > 0 ) {
			path ="redirect:artistPage.na";
		}else {
			System.out.println("힝헹힝");
		}
		return path;
	}
	// 파일 세이브띠
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
//		String root = "C:\\Users\\Nyeonmo\\git\\NATTA-\\NATTA\\src\\main\\webapp\\resources\\images";
		String savePath = root + "\\artistProfile";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String ProFileName = file.getOriginalFilename();
	    String reProFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
								+ ProFileName.substring(ProFileName.lastIndexOf(".")+1);
	    
	    String filePath = folder + "\\" + reProFileName;
	    
	    try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return reProFileName;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
