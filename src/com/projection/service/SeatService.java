package com.projection.service;

import java.util.List;

import com.projection.domain.Seat;
import com.projection.service.Base.BaseService;

public class SeatService extends BaseService{

	public List<Seat> getAll() {
		return seatDao.getAll();
	}

}
