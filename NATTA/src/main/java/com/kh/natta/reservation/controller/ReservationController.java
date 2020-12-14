package com.kh.natta.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.service.ArtistInfoService;
import com.kh.natta.artist.service.ArtistService;

@Controller
public class ReservationController {

	@Autowired
	private ArtistInfoService infoService;
	
		@RequestMapping(value="reservation.na",method=RequestMethod.GET)
		public  String reservation(String artistId, Model model) {
			ArtistInfo infoPage = infoService.selectOneArtist(artistId);
			
			model.addAttribute("artistInfo",infoPage);
			return "Reservation/reservation";
		}
		
		
		
		
		
}
