package com.projection.service;


import java.util.List;

import com.projection.domain.Log;
import com.projection.service.Base.BaseService;


public class LogService extends BaseService{
	public Integer save(Log log){
		return logDao.save(log);
	}

	public List<Log> getAll() {
		return logDao.getAll();
	}

	public Log get(Integer id) {
		return logDao.get(id);
	}

	public void delete(Log log) {
		logDao.delete(log);
		
	}
	

}
