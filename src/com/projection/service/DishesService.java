package com.projection.service;

import java.util.ArrayList;
import java.util.List;

import com.projection.domain.Dishes;
import com.projection.domain.DishesType;
import com.projection.service.Base.BaseService;

public class DishesService extends BaseService {

	public List<Dishes> getAll() {
		List<Dishes> dishes = dishesDao.getAll();
		List<Dishes> result = new ArrayList<>();
		for (Dishes dish : dishes) {
			if (dish.getValid() == 1) {
				result.add(dish);
			}
		}
		return result;
	}
	
	public List<Dishes> getByType(Integer type) {
		List<Dishes> dishes = dishesDao.getAll();
		List<Dishes> result = new ArrayList<>();
		for (Dishes dish : dishes) {
			if (dish.getValid() == 1 && dish.getType().getId() == type) {
				result.add(dish);
			}
		}
		return result;
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

	public void delete(Dishes dishes) {
		dishes.setValid(0);
		dishesDao.update(dishes);
	}
	
	public DishesType getTypeById(Integer id) {
		return dishesTypeDao.get(id);
	}
	
	public List<DishesType> getAllTypes(){
		return dishesTypeDao.getAll();
	}

	public List<Dishes> getListByName(String name) {
		List<Dishes> dishes = dishesDao.getAll();
		List<Dishes> result = new ArrayList<>();
		for (Dishes dish : dishes) {
			if (dish.getName().contains(name)) {
				result.add(dish);
			}
		}
		return result;
	}

	public List<Dishes> getListGroupBy(Integer type) {
		return dishesDao.getListGroupBy(type);
	}

}
