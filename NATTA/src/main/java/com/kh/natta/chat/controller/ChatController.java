package com.kh.natta.chat.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.chat.domain.Chat;
import com.kh.natta.chat.domain.ChattingRoom;
import com.kh.natta.chat.service.ChatService;
import com.kh.natta.customer.domain.Customer;

@Controller
public class ChatController {
	
	
	@Autowired
	private ChatService service;
	
	// 테스트용
	@RequestMapping(value="/chat.na",method = RequestMethod.GET)
	public String ChatView(Model model,HttpServletRequest request) {
		ArrayList<String> artists = new ArrayList<String>();
		HttpSession session = request.getSession();
		String loginUser = null;
		
		if(session.getAttribute("loginCustomer") != null) {
			Customer customer = (Customer)session.getAttribute("loginCustomer");
			 loginUser = customer.getCustomerId();
		}else {
			Artist artist = (Artist)session.getAttribute("loginArtist");
			 loginUser = artist.getArtistId();
		}
		
		artists.add("TEST1");
		artists.add("TEST2");
		artists.add("TEST3");
		model.addAttribute("loginUser",loginUser);
		model.addAttribute("artist",artists);
		return"chat/ChatTest";
	}
	
	// 테스트용 아티스트 로그인
	@RequestMapping(value="/artistChat.na",method=RequestMethod.GET)
	public String ArtistChatView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Artist artist = (Artist)session.getAttribute("loginArtist");
		String loginUser = artist.getArtistId();
		ArrayList<Chat> roomList = service.selectListChattingRoom(loginUser);
		model.addAttribute("roomList",roomList);
		return "chat/ChattingArtist";
	}
	
	
	@RequestMapping(value="/chatting.na",method=RequestMethod.GET)
	public String Chatting(Model model,ChattingRoom chattingRoom,HttpServletRequest request) {
		
		// 현재 로그인한 유저 set
		HttpSession session = request.getSession();
		String loginUser = null;
		if(session.getAttribute("loginCustomer") != null) {
			Customer customer = (Customer)session.getAttribute("loginCustomer");
			 loginUser = customer.getCustomerId();
		}else {
			Artist artist = (Artist)session.getAttribute("loginArtist");
			 loginUser = artist.getArtistId();
		}
		//채팅방 만들때 loginUser를 너무 많이 사용해서 수정을 위해서는 너무 많은 시간과 노력이 필요.. 그냥 loginUser세션 하나를 추가하는것으로 타협..
		session.setAttribute("loginUser", loginUser);
		//채팅방 체크를 위해서  set
		chattingRoom.setCustomerId(loginUser);
		// 채팅방이 있는지 없는지 체크
		if(chattingRoom.getArtistId() != null) {
		ChattingRoom check = service.checkChattingRoom(chattingRoom);
		// 채팅방들을 가져와서 jsp에 넣기위한 List
		ArrayList<Chat> chatList = null;
		if(check == null) {
			// 채팅방이 없을때
			int result = service.insertChattingRoom(chattingRoom);
				if(result>0) {
					// 방생성
					int roomCode = service.checkChattingRoom(chattingRoom).getRoomCode();
					// 새로운 채팅방 생겼습니다 insert
					Chat chat = new Chat();
					chat.setSender(loginUser);
					
					// 로그인한 사람이 같은사람인지 아닌지 확인 db에서 받는사람 보내는사람 구별을 안해놓음
					if(!loginUser.equals(chattingRoom.getArtistId())){
						chat.setReciver(chattingRoom.getArtistId());
					}else {
						chat.setReciver(chattingRoom.getCustomerId());
					}
					
					chat.setChatContent("새로운 채팅방이 생성되었습니다.");
					chat.setRoomCode(roomCode);
					int create = service.insertChat(chat);
					if(create > 0) {
						chatList = service.viewChatContent(roomCode);
						model.addAttribute("chatList",chatList);
						model.addAttribute("roomCode",roomCode);
					}
				}
		}else {
			// 채팅방이 있을때 이전에 모든 내용을 가져옴
			chatList = service.viewChatContent(check.getRoomCode());
			model.addAttribute("chatList",chatList);
			model.addAttribute("roomCode",check.getRoomCode());
			
		}
		}else {
			
		}
		return "chat/ChattingTest";
	}
	
	@RequestMapping(value="selectListChattingRoom.na", method = RequestMethod.GET)
	public void selectListChattingRoom(String loginUser, HttpServletResponse response) throws JsonIOException, IOException{
		
		ArrayList<Chat> roomList = service.selectListChattingRoom(loginUser);
		//GSON
		
		if(!roomList.isEmpty()) {
			for(Chat c : roomList ) {
				c.setChatContent(URLEncoder.encode(c.getChatContent(),"utf-8"));
			}
		}
		
		Gson gson = new Gson();
		gson.toJson(roomList, response.getWriter());

	}
	
	@ResponseBody
	@RequestMapping(value="insertChat.na", method = RequestMethod.POST)
	public String insertChat(Chat chat, HttpServletRequest request, MultipartFile uploadFile) {
		
		//파일 등록
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile,request,chat.getRoomCode());
			if(renameFileName != null) {
				chat.setChatImgPath(renameFileName);
			}
		}
		int result = service.insertChat(chat);
		if(result > 0) {
			return "success";
		}else {
			return "fail";	
		}
	}
	
	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request, int roomCode) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 채팅 폴더 만들기 잊지말기
		String savePath = root + "\\chat\\" + roomCode;
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return renameFileName;
	}
	
	
	
	@RequestMapping(value = "chatList.na", method = RequestMethod.GET)
	public void addList(int roomCode , String lastChatTime , HttpServletResponse response) throws Exception {
		
		if(roomCode != 0) {
		// 마지막 채팅 기록
		Chat chat = new Chat();
		chat.setRoomCode(roomCode);
		chat.setChatChatDateFormat(lastChatTime);
		// 마기막 채팅기록 이후를 가져옴
		ArrayList<Chat> addList = service.chataddList(chat);
		// DB에서 가져온 값을 JSON 형태로 바꿔주어야함
		// 그전에 DB데이터에 한글이 있으면 인코딩 해줘야함
		if(!addList.isEmpty()) {
		for(Chat c : addList ) {
			c.setChatContent(URLEncoder.encode(c.getChatContent(),"utf-8"));
		}
		//GSON
		Gson gson = new Gson();
		gson.toJson(addList, response.getWriter());
		}else {
			Gson gson = new Gson();
			gson.toJson("nodata", response.getWriter());
		}
	}
	}
}
