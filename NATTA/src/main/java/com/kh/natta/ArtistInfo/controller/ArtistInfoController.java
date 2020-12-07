package com.kh.natta.ArtistInfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ArtistInfoController {

	@RequestMapping(value="artistPage.na", method=RequestMethod.GET)
	public String ArtistInfo() {
		return "/Artist-info/artistPage";
	}
}
