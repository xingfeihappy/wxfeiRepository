package com.projection.service;

import java.util.ArrayList;
import java.util.List;

import com.projection.domain.Seat;
import com.projection.service.Base.BaseService;

public class SeatService extends BaseService {

	public List<Seat> getAll() {
		List<Seat> seats = seatDao.getAll();
		List<Seat> result = new ArrayList<>();
		for (Seat seat : seats) {
			if (seat.getValid() == 1) {
				result.add(seat);
			}
		}
		return result;
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
