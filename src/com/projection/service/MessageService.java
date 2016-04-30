package com.projection.service;

import java.util.List;

import com.projection.domain.Message;
import com.projection.service.Base.BaseService;

public class MessageService extends BaseService{

	public Message get(Integer id) {
		return messageDao.get(id);
	}

	public List<Message> getAll() {
		return messageDao.getAll();
	}

	public void delete(Message message) {
		messageDao.delete(message);
		
	}

}
