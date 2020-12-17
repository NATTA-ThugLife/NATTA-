package com.kh.natta.ArtistInfo.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.service.ArtistInfoService;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artistWork.domain.ArtistWork;

@Controller
public class ArtistInfoController {
	@Autowired
	private ArtistInfoService infoService;

	
	// 아티스트 상세페이지로 이동
	@RequestMapping(value="artistInfoPage.na", method=RequestMethod.GET)
	public String ArtistInfoPage(String artistId, Model model) {
		Artist artist = infoService.selectOneArtist(artistId);
		ArtistInfo infoPage = infoService.selectOneArtistInfo(artistId);
		ArrayList<ArtistInfoPrice> priceList = infoService.selectListArtistPrice(artistId);
		ArrayList<ArtistWork> workList = infoService.selectListArtistWork(artistId);
			model.addAttribute("artist", artist);
			model.addAttribute("priceList", priceList);
			model.addAttribute("workList", workList);
			model.addAttribute("artistInfo", infoPage);
			// 세션id 값이랑 해당 상세페이지 아티스트 정보랑 유효성검사 채크용
			model.addAttribute("artistPageId",artistId);
			return "Artist-info/artistPage";
		}
	
	// AJAX ) 아티스트 정보 DB에 artistId 존재유무 확인
	@RequestMapping(value="artistChecking.na", method=RequestMethod.POST)
	public void artistIdCheck(HttpServletResponse response, String artistId) throws Exception {
		ArtistInfo artistCheck = infoService.selectOneArtistInfo(artistId);
		System.out.println(artistCheck);
		if(artistCheck != null) {
			artistCheck.setMyInfo(URLEncoder.encode(artistCheck.getMyInfo(), "utf-8"));
			artistCheck.setName(URLEncoder.encode(artistCheck.getName(), "utf-8"));
			artistCheck.setMyProfile(URLEncoder.encode(artistCheck.getMyProfile(), "utf-8"));
			artistCheck.setMyReProfile(URLEncoder.encode(artistCheck.getMyReProfile(), "utf-8"));
		}
		Gson gson = new Gson();
		gson.toJson(artistCheck,response.getWriter());
	}
	
	
	// 아티스트 소개 입력
	@RequestMapping(value="InsertArtistInfo.na",method=RequestMethod.POST)
	public String artistInfoInsert(ArtistInfo artistInfo, Model model, HttpServletRequest request,
									@RequestParam(name="uploadFile",required=false) MultipartFile uploadFile) {
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
		String root = request.getSession().getServletContext().getRealPath("resources/artistInfoFile");
		String savePath = root + "\\Profile";
		File folder = new File(savePath);
		System.out.println(folder);
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
			mv.addObject("aList", aList );
			mv.setViewName("Artist-info/artistListView");
		return mv;
	}
	
	// artistInfo 수정
	@RequestMapping(value="UpdateArtistInfo.na",method=RequestMethod.POST)
	public String artistInfoUpdate(Model model, ArtistInfo artistInfo, HttpServletRequest request,
										@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile) {
		if( reloadFile != null && !reloadFile.isEmpty() ) {
			if( artistInfo.getMyProfile() != null ) {
				deleteProfile(artistInfo.getMyReProfile(), request);
			}
			String renameFileName = saveFile(reloadFile, request);
			if( renameFileName != null ) {
				artistInfo.setMyProfile(reloadFile.getOriginalFilename());
				artistInfo.setMyReProfile(renameFileName);
			}
		}
		int result = infoService.updateArtistInfo(artistInfo);
		if( result > 0 ) {
			return "redirect:artistInfoPage.na?artistId="+ artistInfo.getArtistId();
		} else {
			model.addAttribute("msg","상세정보 업데이트 실패");
			return "common/errorPage";
		}
	}
	// 수정시 파일삭제 메소드
	public void deleteProfile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources/artistInfoFile");
		String deletePath = root + "\\Profile";
		File deleteProfile = new File(deletePath + "\\" + fileName);
		if( deleteProfile.exists() ) {
			deleteProfile.delete();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
