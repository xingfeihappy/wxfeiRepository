package com.projection.action.test;
import java.util.HashMap;
import java.util.Map;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.domain.Order;

public class TestClass extends BaseAction {
	public String execute() {
		order();
		
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
}
