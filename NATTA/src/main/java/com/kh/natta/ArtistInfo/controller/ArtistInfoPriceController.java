package com.kh.natta.ArtistInfo.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.service.ArtistInfoPriceService;

@Controller
public class ArtistInfoPriceController {
	@Autowired
	private ArtistInfoPriceService ifpService;
	
	
	
	// AJAX) 아티스트 타투스타일 가격정보 가져옴
	@RequestMapping(value="artistPriceChecking.na",method=RequestMethod.POST)
	public void selectPrice(HttpServletResponse response, String artistId, String pStyle) throws Exception {
		ArtistInfoPrice ap = new ArtistInfoPrice(pStyle, artistId);
		System.out.println("호에에에에에에엥?"+ap);
		ArtistInfoPrice checkAp = ifpService.selectStylePrice(ap);
		System.out.println(artistId + pStyle);
		
		System.out.println(checkAp);
		if (checkAp != null) {
			checkAp.setpStyle(URLEncoder.encode(checkAp.getpStyle(), "utf-8"));
		}
		Gson gson = new Gson();
		gson.toJson(checkAp, response.getWriter());
	}
	
	
	// 가격정보 수정
	@RequestMapping(value="updateArtistPrice.na", method=RequestMethod.POST)
	public String updatePrice(ArtistInfoPrice price, Model model) {
		System.out.println("updatePrice 정보 : "+price);
		int result = ifpService.updateArtistPrice(price);
		if( result > 0 ) {
			model.addAttribute("msg","가격 정보수정이 완료되었습니다 >_<");
			model.addAttribute("url", "artistInfoPage.na?artistId="+price.getArtistId());
//			return "redirect:artistInfoPage.na?artistId="+price.getArtistId();
			return "common/Alert";
		} else {
			System.out.println("도랐냐");
			return "ㅜㅜ";
		}
	}
	
	
	// 가격정보 등록
	@RequestMapping(value="insertArtistPrice.na", method=RequestMethod.POST)
	public String insertPrice(ArtistInfoPrice price, Model model) {
		System.out.println("insertPrice 정보 : "+price);
		int result = ifpService.insertArtistPrice(price);
		if( result > 0 ) {
			return "redirect:artistInfoPage.na?artistId="+price.getArtistId();
		} else {
			System.out.println("도랐냐");
			return "ㅋㅋ";
		}
	}
	
	
	
	
	
	
	
}
