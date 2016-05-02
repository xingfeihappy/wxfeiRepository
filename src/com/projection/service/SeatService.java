package com.projection.service;

import java.util.List;

import com.projection.domain.Seat;
import com.projection.service.Base.BaseService;

public class SeatService extends BaseService {

	public List<Seat> getAll() {
		return seatDao.getAll();
	}

	public Integer save(Seat seat) {
		return seatDao.save(seat);
	}

	public void update(Seat seat) {
		seatDao.update(seat);
	}

	public Seat get(Integer id) {
		return seatDao.get(id);
	}

	/**
	 * we think that seat should not be deleted or even set as invalid
	 */
	@Deprecated
	public void delete(Seat seat) {
		seatDao.delete(seat);
	}

}
