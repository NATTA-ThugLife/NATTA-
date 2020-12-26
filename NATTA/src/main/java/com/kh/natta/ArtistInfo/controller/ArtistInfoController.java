package com.kh.natta.ArtistInfo.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.natta.ArtistInfo.domain.ArtistFollow;
import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.service.ArtistInfoService;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artist.service.ArtistService;
import com.kh.natta.artistWork.domain.ArtistWork;
import com.kh.natta.chat.domain.Chat;
import com.kh.natta.chat.domain.ChattingRoom;
import com.kh.natta.chat.service.ChatService;
import com.kh.natta.common.PageInfo;
import com.kh.natta.common.Pagination;
import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customerInfo.domain.Review;
import com.kh.natta.customerInfo.service.CustomerInfoService;
import com.kh.natta.reservation.domain.Reservation;

@Controller
public class ArtistInfoController {
	@Autowired
	private ArtistInfoService infoService;
	
	@Autowired
	private ArtistService aService;

	@Autowired
	private ChatService chatService;
	
	@Autowired
	private CustomerInfoService service;
	
	// 아티스트 상세페이지로 이동
	@RequestMapping(value="artistInfoPage.na", method=RequestMethod.GET)
	public String ArtistInfoPage(String artistId, Model model,HttpServletRequest request) {
		 
		HttpSession session = request.getSession();
		if( session.getAttribute("loginCustomer") != null) {
			Customer customer = (Customer)session.getAttribute("loginCustomer");
			String customerId = customer.getCustomerId();
			ArtistFollow arf = new ArtistFollow(customerId, artistId);
			ArtistFollow af = infoService.selectFollowing(arf); 
			if(af != null ) {
			  model.addAttribute("follow", af); 
			}
		}
		Artist artist = infoService.selectOneArtist(artistId);
		ArtistInfo infoPage = infoService.selectOneArtistInfo(artistId);
		ArrayList<ArtistInfoPrice> priceList = infoService.selectListArtistPrice(artistId);
		ArrayList<ArtistWork> workList = infoService.selectListArtistWork(artistId);
		ArrayList<ArtistFollow> aFollow = infoService.selectArtistFollow(artistId);
//		ArrayList<Review> aReview = infoService.selectListReview(artistId, pi);
//		System.out.println("피아이리스트"+pi);
//		System.out.println("리뷰리스트"+aReview);
//			model.addAttribute("aReview", aReview);
//			model.addAttribute("pi", pi);
			model.addAttribute("artist", artist);
			model.addAttribute("priceList", priceList);
			model.addAttribute("workList", workList);
			model.addAttribute("artistInfo", infoPage);
			model.addAttribute("followList", aFollow);
			// 세션id 값이랑 해당 상세페이지 아티스트 정보랑 유효성검사 채크할 때 사용하려고 넘겼음.
			model.addAttribute("artistPageId",artistId);
			return "Artist-info/artistPage";
		}
	
	@ResponseBody
	@RequestMapping(value="ArtistReviewList.na", method=RequestMethod.POST)
	public HashMap<String, Object> getReviewList(HttpServletResponse response, String artistId
												,@RequestParam(value="page", required=false) Integer page) throws Exception {
		  int currentPage = (page != null) ? page : 1; 
		  int listCount = infoService.getListReviewCount(artistId);
		  System.out.println("아티스트아이디" + artistId);
		  System.out.println("아티스트리뷰갯수"+listCount);
		  
		  PageInfo pi = Pagination.getPageInfo(currentPage, listCount);		
		  ArrayList<Review> aReview = infoService.selectListReview(artistId, pi);
		  System.out.println(pi);
		  for( Review r : aReview ) {
			  r.setReviewContents(URLEncoder.encode(r.getReviewContents(),"utf-8"));
			  System.out.println(r);
		  }
		  HashMap<String, Object> reviewMap = new HashMap<String, Object>();
		  reviewMap.put("pi", pi);
		  reviewMap.put("aReview", aReview);
		  return reviewMap;
	}
	
	
	
	// 아티스트 예약목록 출력 
	@RequestMapping(value="artistReservationList.na",method=RequestMethod.POST)
	public void artistReList(HttpServletResponse response, String artistId) throws Exception {
		ArrayList<Reservation> rList = infoService.selectReList(artistId);
		if( !rList.isEmpty() ) {
			for( Reservation r : rList ) {
				r.setArtistName(URLEncoder.encode(r.getArtistName(),"utf-8"));
				r.setAddress(URLEncoder.encode(r.getAddress(),"utf-8"));
				r.setOriginalFilename(URLEncoder.encode(r.getOriginalFilename(),"utf-8"));
				r.setRenameFilename(URLEncoder.encode(r.getRenameFilename(),"utf-8"));
				r.setRequest(URLEncoder.encode(r.getRequest(),"utf-8"));
				r.setStyle(URLEncoder.encode(r.getStyle(),"utf-8"));
				r.setPart(URLEncoder.encode(r.getPart(),"utf-8"));
				r.setShopName(URLEncoder.encode(r.getShopName(),"utf-8"));
			}
		}
		Gson gson = new Gson(); 
		gson.toJson(rList,response.getWriter()); 
	}
	
	// 예약 상태 변경
	@ResponseBody
	@RequestMapping(value="updateStatus.na",method=RequestMethod.POST)
	public String updateStatus(HttpServletResponse response, int reservationCode, int status){
		int result = infoService.updateStatus(reservationCode);
		
		
		
		if ( result > 0 ) {
			Reservation reservation = service.selectOneReservation(reservationCode);
			ChattingRoom customerRoom = new ChattingRoom();
	    	customerRoom.setArtistId("admin");
	    	customerRoom.setCustomerId(reservation.getCustomerId());
	    	ChattingRoom checkCustomer = chatService.checkChattingRoom(customerRoom);
			
	    	ChattingRoom artistRoom = new ChattingRoom();
	    	artistRoom.setArtistId(reservation.getArtistId());
	    	artistRoom.setCustomerId("admin");
	    	
	    	ChattingRoom checkArtist = chatService.checkChattingRoom(artistRoom);
	    	Chat chat = new Chat();
			chat.setRoomCode(checkCustomer.getRoomCode());
			chat.setSender("admin");
			chat.setReciver(checkCustomer.getCustomerId());
			
			
			Chat chat1 = new Chat();
			chat1.setRoomCode(checkArtist.getRoomCode());
			chat1.setSender("admin");
			chat1.setReciver(checkArtist.getArtistId());
			
			
			
			if( status == 0 ) {
				chat.setChatContent(reservation.getArtistId() + "님에게 신청한 예약이 확정되었습니다.");
				chat1.setChatContent(reservation.getCustomerId() + "님의 예약을 확정 하였습니다.");
				chatService.insertChat(chat);
				chatService.insertChat(chat1);
				return "0";
			} else  {
				chat.setChatContent(reservation.getArtistId() + "님에게 신청한 타투가 완료 되었습니다. <br> 더 좋은 서비스를 위해 리뷰를 입력해주세요~");
				chat1.setChatContent(reservation.getCustomerId() + "님의 타투가 완료 되었습니다.");
				chatService.insertChat(chat);
				chatService.insertChat(chat1);
				return "1";
			} 
		} else {
			return "fail";
		}
	}
	// 예약 취소
	@ResponseBody
	@RequestMapping(value="deleteStatus.na",method=RequestMethod.POST)
	public String deleteStatus(HttpServletResponse response, int reservationCode) {
		Reservation reservation = service.selectOneReservation(reservationCode);
		
		int result = infoService.deleteStatus(reservationCode);
		
		
		
		if( result > 0 ) {
			
			ChattingRoom customerRoom = new ChattingRoom();
	    	customerRoom.setArtistId("admin");
	    	customerRoom.setCustomerId(reservation.getCustomerId());
	    	ChattingRoom checkCustomer = chatService.checkChattingRoom(customerRoom);
			
	    	ChattingRoom artistRoom = new ChattingRoom();
	    	artistRoom.setArtistId(reservation.getArtistId());
	    	artistRoom.setCustomerId("admin");
	    	ChattingRoom checkArtist = chatService.checkChattingRoom(artistRoom);
	    	
				Chat chat = new Chat();
				chat.setRoomCode(checkCustomer.getRoomCode());
				chat.setChatContent(reservation.getArtistId() + "님이  예약을 취소 하였습니다.");
				chat.setSender("admin");
				chat.setReciver(checkCustomer.getCustomerId());
				chatService.insertChat(chat);
				
				chat = new Chat();
				chat.setRoomCode(checkArtist.getRoomCode());
				chat.setChatContent(reservation.getCustomerId() + "님의 예약을 취소 하였습니다.");
				chat.setSender("admin");
				chat.setReciver(checkArtist.getArtistId());
				chatService.insertChat(chat);
				
			return "success";
		}else {
			return "fail";
		}
	}
	// 팔로우 삭제
	@ResponseBody
	@RequestMapping(value="deleteFollowing.na", method=RequestMethod.POST)
	public String goodByeFollow(ArtistFollow af) {
		int result = infoService.deleteArtistFollow(af);
		if ( result > 0 ) {
			return af.getCustomerId();
		} else {
			return "fail";
		}
	}
	
	
	//  아티스트 정보 DB에 artistId 존재유무 확인
	@RequestMapping(value="artistChecking.na", method=RequestMethod.POST)
	public void artistIdCheck(HttpServletResponse response, String artistId) throws Exception {
		ArtistInfo artistCheck = infoService.selectOneArtistInfo(artistId);
		if(artistCheck != null) {
			artistCheck.setMyInfo(URLEncoder.encode(artistCheck.getMyInfo(), "utf-8"));
			artistCheck.setName(URLEncoder.encode(artistCheck.getName(), "utf-8"));
			artistCheck.setMyProfile(URLEncoder.encode(artistCheck.getMyProfile(), "utf-8"));
			artistCheck.setMyReProfile(URLEncoder.encode(artistCheck.getMyReProfile(), "utf-8"));
		}
		Gson gson = new Gson();
		gson.toJson(artistCheck,response.getWriter());
	}
	
	// 팔로잉 
	@ResponseBody
	@RequestMapping(value="InsertArtistFollow.na", method=RequestMethod.POST)
	public String insertFollowing(ArtistFollow af, Model model) {
		int result = infoService.insertArtistFollow(af);
		if ( result > 0 ) {
			return "success";
		} else {
			return "fail";
		}
	}
	// 팔로잉 취소
	@ResponseBody
	@RequestMapping(value="deleteArtistFollow.na", method=RequestMethod.POST)
	public String deleteFollowing(ArtistFollow af, Model model) {
		int result = infoService.deleteArtistFollow(af);
		if ( result > 0 ) {
			return "success";
		} else {
			return "fail";
		}
	}	
	
	
	// 아티스트 소개 입력
	@RequestMapping(value="InsertArtistInfo.na",method=RequestMethod.POST)
	public String artistInfoInsert(ArtistInfo artistInfo, Model model, HttpServletRequest request,
									@RequestParam(name="uploadFile",required=false) MultipartFile uploadFile) {
		  if(!uploadFile.getOriginalFilename().equals("")) { 
			  String reProfileName = saveFile(uploadFile, request); 
			  if( reProfileName != null) {
				  artistInfo.setMyProfile(uploadFile.getOriginalFilename());
				  artistInfo.setMyReProfile(reProfileName); 
			  } 
		  }
		int result = 0;
		String path = null;
		result = infoService.registerArtistInfo(artistInfo);
		if( result > 0 ) {
			path ="main/mainPage";
		}else {
			System.out.println("ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ");
		}
		return path;
	}
	// 프로필사진 등록
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources/artistInfoFile");
		String savePath = root + "\\Profile";
		File folder = new File(savePath);
		System.out.println(folder);
		if(!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String ProFileName = file.getOriginalFilename();
	    String reProFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
								+ ProFileName.substring(ProFileName.lastIndexOf(".")+1);
	    
	    String filePath = folder + "\\" + reProFileName;
	    
	    try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return reProFileName;
	}
	
	
	
	// ArtistInfo 에 등록되어있는 전체 아티스트 정보 가져옴
	@RequestMapping(value="artistList.na", method=RequestMethod.GET)
	public ModelAndView artistList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = ( page != null ) ? page : 1;
		int listCount = infoService.getListCount();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<ArtistInfo> aList = infoService.selectListArtist(pi);
		if( !aList.isEmpty() ) {
			mv.addObject("aList", aList)
				.addObject("pi", pi)
					.setViewName("Artist-info/artistListView");
		} else {
			System.out.println("아이 씼팔");
		}
		return mv;
	}
	
	// artistInfo 수정
	@RequestMapping(value="UpdateArtistInfo.na",method=RequestMethod.POST)
	public String artistInfoUpdate(Model model, ArtistInfo artistInfo, HttpServletRequest request,
										@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile) {
		if( reloadFile != null && !reloadFile.isEmpty() ) {
			if( artistInfo.getMyProfile() != null ) {
				deleteProfile(artistInfo.getMyReProfile(), request);
			}
			String renameFileName = saveFile(reloadFile, request);
			if( renameFileName != null ) {
				artistInfo.setMyProfile(reloadFile.getOriginalFilename());
				artistInfo.setMyReProfile(renameFileName);
			}
		}
		int result = infoService.updateArtistInfo(artistInfo);
		if( result > 0 ) {
			return "redirect:artistInfoPage.na?artistId="+ artistInfo.getArtistId();
		} else {
			model.addAttribute("msg","상세정보 업데이트 실패");
			return "common/errorPage";
		}
	}
	// 수정시 파일삭제 메소드
	public void deleteProfile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources/artistInfoFile");
		String deletePath = root + "\\Profile";
		File deleteProfile = new File(deletePath + "\\" + fileName);
		if( deleteProfile.exists() ) {
			deleteProfile.delete();
		}
	}
	
	//아티스트 정보 수정 페이지
	@RequestMapping(value = "modifyArtistInfo.na")
	public String enrollView(String artistId,Model model) {
		Artist artist = infoService.selectOne(artistId);
		model.addAttribute("loginArtist",artist);
		//System.out.println(artist);
		return "Artist-info/artistMyPage";
	}
	
	//아티스트 정보 수정
	@RequestMapping(value="modifyArtistInfoPage.na" , method = RequestMethod.POST)
	public String modifyCArtistInfo(Artist artist, String dupPwd2, String post, String workAddress, String address2,
			HttpServletRequest request, Model model) {
		artist.setWorkAddress(post + "," + workAddress + "," + address2);
		int result = infoService.modifyArtistInfo(artist);
		//System.out.println(artist);
		if (result > 0) {
			HttpSession session = request.getSession();
			if (artist.getPassword().isEmpty()) {
				artist.setPassword(dupPwd2);
			}
			Artist updateArtist = aService.loginArtist(artist);
			session.setAttribute("loginArtist", updateArtist);
		}
		model.addAttribute("msg","회원 정보가 수정되었습니다.");
		model.addAttribute("url","artistInfoPage.na");			
		return "common/Alert"; 		
		/* return "Artist-info/artistMyPage"; */
	}

	//아티스트 정보수정 비번 체크
	@ResponseBody
	@RequestMapping(value = "dupPwd2.na", method = RequestMethod.POST)
	public String dupPwd2(String dupPwd2, String artistId) {
		Artist artist = new Artist();
		artist.setPassword(dupPwd2);
		artist.setArtistId(artistId);
		Artist check = infoService.dupPwd2(artist);
		if (check != null) {
			return "success";
		} else {
			return "fail";
		}
	}

	//아티스트 회원 탈퇴
	@RequestMapping(value="deleteArtist.na",method=RequestMethod.GET)
	public String deleteArtist(String artistId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int result = infoService.deleteArtist(artistId);
		//System.out.println(artistId);
		if(result>0) {
			session.invalidate(); 
			model.addAttribute("msg","회원 탈퇴 처리되었습니다.");
			model.addAttribute("url","main.na");			
			return "common/Alert"; 
		}else {
			model.addAttribute("msg","회원 탈퇴 실패");
			model.addAttribute("url","artistInfoPage.na");			
			return "common/Alert"; 
		}
	}
	
	
	
	
	
	
	
}
