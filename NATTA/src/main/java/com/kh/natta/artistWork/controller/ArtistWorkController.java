package com.kh.natta.artistWork.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
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
		System.out.println(artistId);
		System.out.println(styleList);
		if( !styleList.isEmpty()) {
			for( ArtistInfoPrice p : styleList ) {
				p.setpStyle(URLEncoder.encode(p.getpStyle(), "utf-8"));
			}
		}
		Gson gson = new Gson();
		gson.toJson( styleList,response.getWriter() );
	}

	// 작품 수정 때 작품정보 불러오기
	@RequestMapping(value="selectArtistWork.na", method=RequestMethod.POST)
	public void selectArtistWork(HttpServletResponse response, int workCode) throws Exception {
		ArtistWork work = awService.selectArtistWork(workCode);
		if( work != null ) {
			work.setWorkReImgPath(URLEncoder.encode(work.getWorkReImgPath(), "utf-8"));
			work.setWorkImgPath(URLEncoder.encode(work.getWorkImgPath(), "utf-8"));
			work.setWorkInfo(URLEncoder.encode(work.getWorkInfo(), "utf-8"));
		}
		Gson gson = new Gson();
		gson.toJson( work ,response.getWriter() );
	}	
	
	
	
	
	
	// 아티스트 작품등록
	@RequestMapping(value="InsertArtistWork.na",method=RequestMethod.POST)
	public String artistWorkInsert(ArtistWork work, Model model, HttpServletRequest request,
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
	// 작품 등록
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
//	uploadFile workStyle workInfo artistId
	
	// 작품 삭제
	@RequestMapping(value="deleteArtistWork.na", method=RequestMethod.GET)
	public String artistWorkDelete(ArtistWork work, int workCode, HttpServletRequest request, Model model) {
		if( work.getWorkImgPath() != null ) {
			deleteWork(work.getWorkReImgPath(), request);
		}
		int result = awService.deleteArtistWork(workCode);
		if ( result > 0 ) {
			model.addAttribute("msg","선택하신 작품이 삭제되었습니다.");
			model.addAttribute("url", "artistInfoPage.na?artistId="+work.getArtistId());
			return "common/Alert";
		} else {
			model.addAttribute("msg","게시물 삭제에 실패헀습니다.");
			model.addAttribute("url", "artistInfoPage.na?artistId="+work.getArtistId());
			return "common/Alert";
		}
	}
	// 수정시 파일삭제 메소드
	public void deleteWork(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources/artistInfoFile");
		String deletePath = root + "\\WorkFile";
		File deleteWork = new File(deletePath + "\\" + fileName);
		if( deleteWork.exists() ) {
			deleteWork.delete();
		}
	}	
	
	
	
	
	
	// artistWork 수정
	@RequestMapping(value="updateArtistWork.na",method=RequestMethod.POST)
	public String artistWorkUpdate(Model model, ArtistWork work, HttpServletRequest request,
										@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile) {
		System.out.println(work);
		System.out.println(reloadFile);
		if( reloadFile != null && !reloadFile.isEmpty() ) {
			if( work.getWorkImgPath() != null ) {
				deleteWork(work.getWorkReImgPath(), request);
			}
			String renameFileName = saveFile(reloadFile, request);
			if( renameFileName != null ) {
				work.setWorkImgPath(reloadFile.getOriginalFilename());
				work.setWorkReImgPath(renameFileName);
			}
		}
		int result = awService.updateArtistWork(work);
		if( result > 0 ) {
			model.addAttribute("msg","선택하신 작품이 수정되었습니다.");
			model.addAttribute("url", "artistInfoPage.na?artistId="+work.getArtistId());
			return "common/Alert";
		} else {
			model.addAttribute("msg","작품을 수정하지 못하였습니다.");
			model.addAttribute("url", "artistInfoPage.na?artistId="+work.getArtistId());
			return "common/Alert";
		}
	}


	
	
	
	
	
	
	
	
	
}
