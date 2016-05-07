package com.projection.action.car;

import java.util.HashMap;
import java.util.Map;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.util.Constant;

public class CarAction extends BaseAction {

	private Integer amount;
	private Dishes dishes;

	public String addCar() {
		try {
			dishes = dishesService.get(dishes.getId());
			@SuppressWarnings("unchecked")
			Map<Dishes, Integer> dishesMap = (Map<Dishes, Integer>) ctx.getSession().get(Constant.CAR);
			if (dishesMap == null) {
				dishesMap = new HashMap<>();
				dishesMap.put(dishes, amount);
				ctx.getSession().put(Constant.CAR, dishesMap);
			} else {
				Dishes dish = containsKey(dishesMap, dishes);
				if (dish != null) {
					dishesMap.put(dish, dishesMap.get(dish) + amount);
				} else {
					dishesMap.put(dishes, amount);
				}
				ctx.getSession().put(Constant.CAR, dishesMap);
			}
			System.out.println(ctx.getSession().get(Constant.CAR));
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	
	public String deleteFromCar(){
		@SuppressWarnings("unchecked")
		Map<Dishes, Integer> dishesMap = (Map<Dishes, Integer>) ctx.getSession().get(Constant.CAR);
		if(dishesMap != null){
			remove(dishesMap, dishes);
		}
		return SUCCESS;
	}
	
	private Dishes containsKey(Map<Dishes, Integer> m, Dishes dishes) {
		for(Dishes d : m.keySet()){
			if(d.getId() == dishes.getId()){
				return d;
			}
		}
		return null;
	}
	
	private Integer remove(Map<Dishes, Integer> m, Dishes dishes) {
		for(Dishes d : m.keySet()){
			if(d.getId() == dishes.getId()){
				return m.remove(d);
			}
		}
		return 0;
	}

	public Dishes getDishes() {
		return dishes;
	}

	public void setDishes(Dishes dishes) {
		this.dishes = dishes;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

}
