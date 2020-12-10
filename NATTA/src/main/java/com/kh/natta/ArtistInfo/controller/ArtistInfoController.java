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
import org.springframework.web.servlet.ModelAndView;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.service.ArtistInfoService;

@Controller
public class ArtistInfoController {
	@Autowired
	private ArtistInfoService infoService;
	
	// 아티스트 상세페이지로 이동
	@RequestMapping(value="artistInfoPage.na", method=RequestMethod.GET)
	public String ArtistInfoPage(String artistId, Model model) {
		ArtistInfo infoPage = infoService.selectOneArtist(artistId);
			model.addAttribute("artistInfo", infoPage);
			return "Artist-info/artistPage";
		}

	
	
	
	// 아티스트 소개 입력
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
			path ="main/mainPage";
		}else {
			System.out.println("ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ");
		}
		return path;
	}
	// 프로필사진 등록
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
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
	
	
	
	
	
	// ArtistInfo 에 등록되어있는 전체 아티스트 정보 가져옴
	@RequestMapping(value="artistList.na", method=RequestMethod.GET)
	public ModelAndView artistList(ModelAndView mv) {
		ArrayList<ArtistInfo> aList = infoService.selectListArtist();
		if( !aList.isEmpty() ) {
			mv.addObject("aList", aList );
			mv.setViewName("Artist-info/artistListView");
		} else {
			mv.addObject("msg", "아티스트없잖아?");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
