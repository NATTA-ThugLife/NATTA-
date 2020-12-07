package com.kh.natta;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	@RequestMapping(value = "login.na", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "join/login";
	}
	
	@RequestMapping(value = "joinOption.na", method = RequestMethod.GET)
	public String joinOption(Locale locale, Model model) {
		return "join/joinOption";
	}
	
	@RequestMapping(value = "find.na", method = RequestMethod.GET)
	public String find(Locale locale, Model model) {
		return "join/find";
	}

}
