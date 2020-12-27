package com.kh.natta.reservation.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.service.ArtistInfoService;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artist.service.ArtistService;
import com.kh.natta.chat.domain.Chat;
import com.kh.natta.chat.domain.ChattingRoom;
import com.kh.natta.chat.service.ChatService;
import com.kh.natta.reservation.domain.Reservation;
import com.kh.natta.reservation.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired
	private ArtistInfoService infoService;
	@Autowired
	private ReservationService rService;
	@Autowired
	private ChatService cService;
		
		
		
		@RequestMapping(value="reservation.na",method=RequestMethod.GET)
		public  String reservation(String artistId,String img,Model model,HttpServletResponse response) throws Exception {
			ArtistInfo infoPage = infoService.selectOneArtistInfo(artistId);
			Artist artist = rService.selectOneArtist(artistId);
			ArrayList<ArtistInfoPrice> priceList = infoService.selectListArtistPrice(artistId);	
			ArrayList<Reservation> date = rService.selectListDate(artistId);
			System.out.println("아티스트작품"+img);
			ArrayList<String> reservedList = new ArrayList<String>();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			try {
			for ( Reservation reserve : date) {
				int year = reserve.getReservationDate().getYear()+1900;
				int month = reserve.getReservationDate().getMonth()+1;
				int day = reserve.getReservationDate().getDate();
				String rDate = year + "-" + month + "-" + day;
				reservedList.add(rDate);
			}
			}catch(IndexOutOfBoundsException e){
				System.out.println(e);
			}
			System.out.println(reservedList);
			model.addAttribute("reservationDate", reservedList.toArray(new String[reservedList.size()]));
			model.addAttribute("priceList",priceList);
			model.addAttribute("artist",artist);
			model.addAttribute("artistInfo",infoPage);
			model.addAttribute("work",img);
			return "Reservation/reservation";
		}
		
		
		
		// 예약 등록
		@RequestMapping(value="reservation.na",method=RequestMethod.POST)
		public String reservationInsert(Reservation reservation,String tattooSize,Model model,HttpServletRequest request,
										@RequestParam(name="upload",required=false)MultipartFile uploadFile) throws InterruptedException{
			String size = tattooSize.substring(tattooSize.indexOf(",")+1,tattooSize.length());
			
			reservation.setTattooSize(size);
			System.out.println("예약전"+reservation);
			System.out.println(uploadFile);
			if(uploadFile != null) {
			if(!uploadFile.getOriginalFilename().equals("")) {
				String renameFilename = saveFile(uploadFile,request);
				if(renameFilename != null) {
					reservation.setOriginalFilename(uploadFile.getOriginalFilename());
					reservation.setRenameFilename(renameFilename);
				}
			}
			}
			
			int result = 0;
			String path = null;
			result = rService.insertReservation(reservation);
			if(result>0) {
				// 예약완료시 예약 완료 메세지 보내기
				ChattingRoom artistRoom = new ChattingRoom();
				artistRoom.setCustomerId("admin");
				artistRoom.setArtistId(reservation.getArtistId());
				ChattingRoom customerRoom = new ChattingRoom();
				customerRoom.setArtistId("admin");
				customerRoom.setCustomerId(reservation.getCustomerId());
				ChattingRoom checkArtist = cService.checkChattingRoom(artistRoom);
				if(checkArtist == null) {
					cService.insertChattingRoom(artistRoom);
					checkArtist = cService.checkChattingRoom(artistRoom);
					Chat chat = new Chat();
					chat.setRoomCode(checkArtist.getRoomCode());
					chat.setChatContent("새로운 채팅방이 생성되었습니다.");
					chat.setSender("admin");
					chat.setReciver(checkArtist.getArtistId());
					cService.insertChat(chat);
					Thread.sleep(1000);
					chat.setChatContent(reservation.getCustomerId() + "님의 예약이 신청되었습니다.<br>예약 날짜 :"+reservation.getReservationDate()+" <br> 예약 시간 : " + reservation.getReservationTime());
					cService.insertChat(chat);
				}else {
					Chat chat = new Chat();
					chat.setRoomCode(checkArtist.getRoomCode());
					chat.setSender("admin");
					chat.setReciver(checkArtist.getArtistId());
					chat.setChatContent(reservation.getCustomerId() + "님의 예약이 신청되었습니다.<br>예약 날짜 :"+reservation.getReservationDate()+" <br> 예약 시간 : " + reservation.getReservationTime());
					cService.insertChat(chat);
					
				}
				
				ChattingRoom checkCustomer = cService.checkChattingRoom(customerRoom);
				if(checkCustomer == null) {
					cService.insertChattingRoom(customerRoom);
					checkCustomer = cService.checkChattingRoom(customerRoom);
					Chat chat = new Chat();
					chat.setRoomCode(checkCustomer.getRoomCode());
					chat.setChatContent("새로운 채팅방이 생성되었습니다.");
					chat.setSender("admin");
					chat.setReciver(checkCustomer.getCustomerId());
					cService.insertChat(chat);
					Thread.sleep(1000);
					chat.setChatContent(reservation.getArtistId() + "님에게 예약이 신청되었습니다.<br>예약 날짜 :"+reservation.getReservationDate()+" <br> 예약 시간 : " + reservation.getReservationTime());
					cService.insertChat(chat);
				}else {
					Chat chat = new Chat();
					chat.setRoomCode(checkCustomer.getRoomCode());
					chat.setChatContent(reservation.getArtistId() + "님에게 예약이 신청되었습니다.<br>예약 날짜 :"+reservation.getReservationDate()+" <br> 예약 시간 : " + reservation.getReservationTime());
					chat.setSender("admin");
					chat.setReciver(checkCustomer.getCustomerId());
					cService.insertChat(chat);
				}
				
				
				path="redirect:main.na";
			}else {
				model.addAttribute("msg","예약 등록 실패!");
				path="common/errorPage";
			}
			return path;
		}
		
		// 예약 도안 등록
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			
			// 파일 저장 경로
			String root = request.getSession().getServletContext().getRealPath("resources/images");
			String savePath = root + "\\ruploadFiles";
			// 저장 폴더 선택
			File folder = new File(savePath);
			
			// 만약 폴더가 없을 경우 자동 생성
			if(!folder.exists()) {
				folder.mkdir();
			}
			// 파일명을 rename하는 과정이 필요함. rename할땐 "년월시분초.확장자"로 변경 필요
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originalFilename = file.getOriginalFilename();
			String renameFilename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
										+ originalFilename.substring(originalFilename.lastIndexOf(".")+1);
			
			String filePath = folder + "\\" + renameFilename;
			// 파일 저장
			try {
				file.transferTo(new File(filePath));			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return renameFilename;
		}
		// 사이즈리스트
		@ResponseBody
		@RequestMapping(value="reservationSizeList.na",method=RequestMethod.POST)
		public void reservationSizeList(String artistId,String pStyle, HttpServletResponse response)throws Exception{
			ArtistInfoPrice size = new ArtistInfoPrice();
			size.setArtistId(artistId);
			size.setpStyle(pStyle);
			ArrayList<ArtistInfoPrice> sizeList = rService.selectListSize(size);
			
			Gson gson = new Gson();
			gson.toJson(sizeList,response.getWriter());
			
		}
		// 날자별 예약가능시간
		@ResponseBody
		@RequestMapping(value="reservationTime.na",method=RequestMethod.POST)
		public void reservationTimeList(String artistId, java.sql.Date reservationDate,HttpServletResponse response)throws Exception {
			
			Reservation time = new Reservation();
			time.setArtistId(artistId);
			time.setReservationDate(reservationDate);
			
			
			ArrayList<Reservation> tList = rService.selectListTime(time);
			Gson gson = new Gson();
			gson.toJson(tList,response.getWriter());
		}
		
		
		
		
		
}
