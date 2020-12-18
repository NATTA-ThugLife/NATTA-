package com.kh.natta.artist.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artist.service.ArtistService;
import com.kh.natta.artist.domain.Artist;

@Controller
public class ArtistController {
	
	@Autowired
	private ArtistService service;
	
	//로그인
	@RequestMapping(value="artistLogin.na")
	public ModelAndView artistLogin(String artistId, String password, ModelAndView mv, HttpServletRequest request) {		
		HttpSession session = request.getSession();
		Artist artist = new Artist(artistId,password);
		Artist loginArtist = service.loginArtist(artist);
		//System.out.println(loginArtist);
		if(loginArtist != null) {
			session.setAttribute("loginArtist", loginArtist);
			mv.setViewName("main/mainPage");
		}else {	
			mv.addObject("msg","로그인 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 로그아웃
	@RequestMapping(value="artistLogout.na",method=RequestMethod.GET)
	public String artistLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "main/mainPage";
	}
	
	//회원가입 페이지
	@RequestMapping(value="artistJoinView.na",method={RequestMethod.GET, RequestMethod.POST})
	public String enrollView() {
		return "join/artistjoin";
	}
	
	//아티스트 가입
	@RequestMapping(value="artistRegister.na",method=RequestMethod.POST)
	public String artistRegister(Model model, Artist artist,String post, String workAddress, String address2, String orginalFileName, 
			@RequestParam(name="uploadFile",required=false)MultipartFile uploadFile, HttpServletRequest request) {
		artist.setWorkAddress(post+","+workAddress+","+address2);		
		if (!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile, request);
			if (renameFileName != null) {
				artist.setBusinessNo(uploadFile.getOriginalFilename());
			}
		}
	
		int result = 0;
		String path = null;
		result = service.registerArtist(artist);
		if(result > 0) {
			path ="join/login";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
		}
		return path;

	}

	// 사업자등록증 사진 파일 등록
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\businessNo";
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

		String filePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return renameFileName;
	}

	
	  //아이디 중복검사	  
	  @ResponseBody	  
	  @RequestMapping(value="artistdupId.na", method=RequestMethod.GET)
	  public String idDuplicateCheck2(String artistId) { 
		  boolean isUsable = service.checkIdDup(artistId) == 0 ? true : false; 
	      //System.out.println(isUsable);
	      return isUsable+""; 
	  }	
	  
	  
	  // 이메일 중복 체크
		@ResponseBody
		@RequestMapping(value = "artistdupEmail.na", method = RequestMethod.GET)
		public String emailDuplicateCheck(String email2) {		
			//System.out.println(email2);
			boolean isUsable = service.checkEmailDup(email2) == 0 ? true : false;
			//System.out.println(isUsable);
			return isUsable + "";
		}

}
