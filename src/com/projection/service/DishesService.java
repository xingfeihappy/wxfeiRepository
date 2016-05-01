package com.projection.service;

import java.util.List;

import com.projection.domain.Dishes;
import com.projection.service.Base.BaseService;

public class DishesService extends BaseService{

	public List<Dishes> getAll() {
		List<Dishes> dishes = dishesDao.getAll();
		for(Dishes dish : dishes){
			if(dish.getValid() == 0){
				dishes.remove(dish);
			}
		}
		return dishesDao.getAll();
	}

	public Dishes get(Integer id) {
		return dishesDao.get(id);
	}

	public Integer save(Dishes dishes) {
		return dishesDao.save(dishes);
	}

	public void update(Dishes dishes) {
		dishesDao.update(dishes);
	}

	public void deleteDishes(Dishes dishes) {
		dishes.setValid(0);
		dishesDao.update(dishes);
		
	}

}
