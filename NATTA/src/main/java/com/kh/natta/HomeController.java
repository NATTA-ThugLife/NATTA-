package com.kh.natta;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.service.ArtistInfoService;
import com.kh.natta.artistWork.domain.ArtistWork;
import com.kh.natta.artistWork.service.ArtistWorkService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ArtistInfoService infoService;
	@Autowired
	private ArtistWorkService awService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "main.na", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		ArrayList<ArtistInfo> artistInfo = infoService.selectListArtistInfo();
		System.out.println(artistInfo);
		model.addAttribute("artistInfo",artistInfo);
		return "/main/mainPage";
	}
	
}
