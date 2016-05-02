package com.projection.service;

import java.util.List;

import com.projection.domain.Message;
import com.projection.service.Base.BaseService;

public class MessageService extends BaseService {
	
	public List<Message> getAll() {
		return messageDao.getAll();
	}

	public Integer save(Message message) {
		return messageDao.save(message);
	}

	public void update(Message message) {
		messageDao.update(message);
	}

	public Message get(Integer id) {
		return messageDao.get(id);
	}

	public void delete(Message message) {
		messageDao.delete(message);
	}

}
