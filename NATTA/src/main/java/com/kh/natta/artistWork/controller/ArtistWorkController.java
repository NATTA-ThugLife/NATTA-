package com.kh.natta.artistWork.controller;

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

import com.google.gson.Gson;
import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artistWork.domain.ArtistWork;
import com.kh.natta.artistWork.service.ArtistWorkService;

@Controller
public class ArtistWorkController {

	@Autowired
	private ArtistWorkService awService;
	
	// AJAX ) 해당 아티스트의 price 테이블에 등록되어있는  style 가져옴
	@RequestMapping(value="artistStyle.na", method=RequestMethod.POST)
	public void artistIdCheck(HttpServletResponse response, String artistId) throws Exception {
		ArrayList<ArtistInfoPrice> styleList = awService.selectArtistStyle(artistId);
		if( !styleList.isEmpty()) {
			for( ArtistInfoPrice p : styleList ) {
				System.out.println("확인확인확인~~"+p);
				p.setpStyle(URLEncoder.encode(p.getpStyle(), "utf-8"));
			}
		}
		Gson gson = new Gson();
		gson.toJson( styleList,response.getWriter() );
	}

	
	
	// 아티스트 작품등록
	@RequestMapping(value="InsertArtistWork.na",method=RequestMethod.POST)
	public String artistInfoInsert(ArtistWork work, Model model, HttpServletRequest request,
									@RequestParam(name="uploadFile",required=false) MultipartFile uploadFile) {
		  System.out.println(work);
		  System.out.println(uploadFile);
		  if(!uploadFile.getOriginalFilename().equals("")) { 
			  String reProfileName = saveFile(uploadFile, request); 
			  if( reProfileName != null) {
				  work.setWorkImgPath(uploadFile.getOriginalFilename());
				  work.setWorkReImgPath(reProfileName); 
			  } 
		  }
		int result = awService.insertArtistWork(work);
		if( result > 0 ) {
			model.addAttribute("msg","작품등록이 완료되었습니다 >_<");
			model.addAttribute("artistWork", work);
			model.addAttribute("url", "artistInfoPage.na?artistId="+work.getArtistId());
			return "common/Alert";
		}else {
			model.addAttribute("msg","작품등록에 실패하였습니다. "
					+ "스타일 및 사진을 반드시 기재해주세요.");
			model.addAttribute("url", "artistInfoPage.na?artistId="+work.getArtistId());
			return "common/Alert";
		}
	}
	// 프로필사진 등록
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources/artistInfoFile");
		String savePath = root + "\\WorkFile";
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
	
	
	/*
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
		String root = request.getSession().getServletContext().getRealPath("resources");
		String deletePath = root + "\\artistProfile";
		File deleteProfile = new File(deletePath + "\\" + fileName);
		if( deleteProfile.exists() ) {
			deleteProfile.delete();
		}
	}	
	*/
	
	
	
	
	
	
	
	
	
	
}
