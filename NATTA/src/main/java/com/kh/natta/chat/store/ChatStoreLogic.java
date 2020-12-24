package com.kh.natta.chat.store;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.chat.domain.Chat;
import com.kh.natta.chat.domain.ChattingRoom;
import com.kh.natta.chat.domain.ImgPath;

@Repository
public class ChatStoreLogic implements ChatStore{
	@Autowired
	private SqlSession session;
	
	@Override
	public ChattingRoom checkChattingRoom(ChattingRoom chattingRoom) {
		return session.selectOne("chatMapper.checkChattingRoom",chattingRoom);
	}

	@Override
	public int insertChattingRoom(ChattingRoom chattingRoom) {
		return session.insert("chatMapper.insertChattingRoom", chattingRoom);
	}

	@Override
	public ArrayList<Chat> viewChatContent(int roomCode) {
		return (ArrayList)session.selectList("chatMapper.viewChat", roomCode);
	}

	@Override
	public ArrayList<Chat> selectListChattingRoom(String userId) {
		return (ArrayList)session.selectList("chatMapper.selectListChattingRoom" , userId);
	}

	@Override
	public int insertChat(Chat chat) {
		return session.insert("chatMapper.insertChat",chat);
	}

	@Override
	public ArrayList<Chat> chataddList(Chat chat) {
		return (ArrayList)session.selectList("chatMapper.chataddList",chat);
	}

	@Override
	public ImgPath selectCustomerImg(String userId) {
		return session.selectOne("chatMapper.selectCustomerImg",userId);
	}

	@Override
	public ImgPath selectArtistImg(String userId) {
		return session.selectOne("chatMapper.selectArtistImg",userId);
	}

	

}
