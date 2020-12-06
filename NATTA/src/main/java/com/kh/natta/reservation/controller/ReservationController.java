package com.kh.natta.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReservationController {

		@RequestMapping(value="reservation.na",method=RequestMethod.GET)
		public  String reservation() {
			return "Reservation/reservation";
		}
}
