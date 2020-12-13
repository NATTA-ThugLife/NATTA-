package com.kh.natta.artistWork.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.natta.artistWork.service.ArtistWorkService;

@Controller
public class ArtistWorkController {

	@Autowired
	private ArtistWorkService awService;
	
	
}
