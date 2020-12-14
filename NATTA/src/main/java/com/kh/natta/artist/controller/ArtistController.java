package com.kh.natta.artist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artist.service.ArtistService;

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
		System.out.println(loginArtist);
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
	// 회원가입 페이지 뷰
	@RequestMapping(value="artistJoinView.na",method={RequestMethod.GET, RequestMethod.POST})
	public String enrollView() {
		return "join/artistjoin";
	}
	
	//가입
	@RequestMapping(value="artistRegister.na",method=RequestMethod.POST)
	public String artistRegister(Model model, Artist artist,String post, String workAddress) {
		artist.setWorkAddress(post+","+workAddress);
		//System.out.println(artist);
		int result = service.registerArtist(artist);
		//System.out.println(result);
		if(result > 0) {
			return "redirect:main.na";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
			return "common/errorPage";
		}
	}	
	
	  // 아이디 중복검사	  
	  @ResponseBody	  
	  @RequestMapping(value="artistdupId.na", method=RequestMethod.GET)
	  public String idDuplicateCheck(String artistId) { boolean isUsable =
	  service.checkIdDup(artistId) == 0 ? true : false; return isUsable+""; 
	  }	 

}
