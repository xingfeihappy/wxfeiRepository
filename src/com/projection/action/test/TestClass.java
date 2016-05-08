package com.projection.action.test;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.chainsaw.Main;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.domain.Order;
import com.projection.service.DishesService;

public class TestClass extends BaseAction {
	public String execute() {
		//order();
		isEqual();
		return null;
	}

	public void order() {
		Order o = orderService.get(1);
		o.setUser(userService.get(1));
		Dishes d1 = dishesService.get(1);
		Dishes d2 = dishesService.get(2);
		Dishes d3 = dishesService.get(3);
		Dishes d4 = dishesService.get(4);
		Map<Dishes, Integer> m = new HashMap<Dishes, Integer>();
		m.put(d1, 1);
		m.put(d2, 2);
		m.put(d3, 3);
		m.put(d4, 4);
		o.setDishesMap(m);

		orderService.save(o);
	}
	
	public void isEqual() {
		Dishes d = new Dishes();
		Dishes dd = dishesService.get(1);
		d.setId(1);
		System.out.println(d.equals(dd));
		Map<Dishes, Integer> m = new HashMap<>();
		m.put(d, 1);
		System.out.println(m.containsKey(dd));
	}

	public static void main(String[] args) {
		Dishes d = new Dishes();
		Dishes d1 = new Dishes();
		d.setId(1);
		d1.setId(1);
		d1.setName("name");
		System.out.println(d.equals(d1));
	}
}
