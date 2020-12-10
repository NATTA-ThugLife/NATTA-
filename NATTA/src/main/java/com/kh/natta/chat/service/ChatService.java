package com.kh.natta.chat.service;

import java.util.ArrayList;

import com.kh.natta.chat.domain.Chat;
import com.kh.natta.chat.domain.ChattingRoom;

public interface ChatService {
	/**
	 * 채팅방 찾는 메소드
	 * 
	 * @param chattingRoom
	 * @return
	 */
	public ChattingRoom checkChattingRoom(ChattingRoom chattingRoom);

	/**
	 * 채팅방이 없으면 채팅방을 생성하는 메소드
	 * 
	 * @param chattingRoom
	 * @return
	 */
	public int insertChattingRoom(ChattingRoom chattingRoom);

	/**
	 * 
	 * 채팅방 콘텐츠를 가져오는 메소드
	 * 
	 * @param roomCode
	 * @return
	 */
	public ArrayList<Chat> viewChatContent(int roomCode);
	
	/**
	 * 로그인한 사람의 채팅방 리스트
	 * @return
	 */
	public ArrayList<Chat> selectListChattingRoom(String loginUser);
		 
	/**
	 * 채팅방 새로 생성되면 새로운 채팅방 생성 입력
	 * @return
	 */
	public int insertChat(Chat chat);
	
	/**
	 * 채팅방 마지막 시간이후 추가된 데이터 가져오기
	 * @param roomCode
	 * @param lastChatTime
	 * @return
	 */
	public ArrayList<Chat> chataddList(Chat chat);
}
