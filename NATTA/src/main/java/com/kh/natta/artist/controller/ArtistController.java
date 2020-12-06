package com.kh.natta.artist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artist.service.ArtistService;

@Controller
public class ArtistController {
	
	@Autowired
	private ArtistService service;
	
	@RequestMapping(value="artistLogin.na", method=RequestMethod.POST)
	public ModelAndView artistLogin(String artistId, String password, ModelAndView mv, HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		Artist artist = new Artist(artistId,password);
		Artist loginArtist = service.loginArtist(artist);
		if(loginArtist != null) {
			session.setAttribute("loginArtist", loginArtist);
			mv.setViewName("home");
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
		return "redirect:home.na";
	}
	// 회원가입 페이지 뷰
	@RequestMapping(value="artistEnrollView.na",method=RequestMethod.GET)
	public String enrollView() {
		return "artist/artistjoin";
	}
	
	@RequestMapping(value="artistRegister.na",method=RequestMethod.POST)
	public String artistRegister(Model model, Artist artist,String post, String address1, String address2) {
		
		artist.setAddress(post+","+address1+","+address2);
		int result = service.registerArtist(artist);
		System.out.println(result);
		if(result > 0) {
			return "redirect:home.na";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
			return "common/errorPage";
		}
	}
	// 마이페이지 뷰
//	@RequestMapping(value="myInfo.na",method=RequestMethod.GET)
//	public String myInfoView() {
//		return "artist/artistMyPage";
//	}
	
	// 아티스트 정보 수정
	@RequestMapping(value="artistModify.na",method=RequestMethod.POST)
	public String modifyMember(@ModelAttribute Artist artist,
								@RequestParam("post") String post,
								@RequestParam("address1") String address1,
								@RequestParam("address2") String address2,
								Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		artist.setAddress(post+","+address1+","+address2);
		int result = service.modifyArtist(artist);
		if(result>0) {
			session.setAttribute("loginUser", artist);
			return "redirect:home.na";
		}else {
			model.addAttribute("msg","정보 수정 실패!");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="artistDelete.na",method=RequestMethod.GET)
	public String deleteArtist(String artistId,HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		int result = service.deleteArtist(artistId);
		if(result>0) {
			session.invalidate();
			model.addAttribute("msg", "회원 탈퇴 성공");
			return "redirect:home.na";
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패!");
			return "common/errorPage";
		}
	}
	
	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value="dupId.kh", method=RequestMethod.GET)
	public String idDuplicateCheck(String userId) {
		boolean isUsable = service.checkIdDup(userId) == 0 ? true : false;
		return isUsable+"";
	}

}
