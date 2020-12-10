package com.kh.natta.chat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.chat.domain.Chat;
import com.kh.natta.chat.domain.ChattingRoom;
import com.kh.natta.chat.store.ChatStore;
@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatStore store;
	
	@Override
	public ChattingRoom checkChattingRoom(ChattingRoom chattingRoom) {
		return store.checkChattingRoom(chattingRoom);
	}

	@Override
	public int insertChattingRoom(ChattingRoom chattingRoom) {
		return store.insertChattingRoom(chattingRoom);
	}

	@Override
	public ArrayList<Chat> viewChatContent(int roomCode) {
		return store.viewChatContent(roomCode);
	}
	
	@Override
	public ArrayList<Chat> selectListChattingRoom(String loginUser) {
		return store.selectListChattingRoom(loginUser);
	}
	
	@Override
	public int insertChat(Chat chat) {
		return store.insertChat(chat);
	}

	@Override
	public ArrayList<Chat> chataddList(Chat chat) {
		return store.chataddList(chat);
	}



	
}
