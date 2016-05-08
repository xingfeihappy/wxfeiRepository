package com.projection.action.car;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.util.Constant;

public class CarAction extends BaseAction {

	private Integer fromIndex;
	private Dishes dishes;
	private Double total;

	public String seeCar() {
		@SuppressWarnings("unchecked")
		Map<Dishes, Integer> dishesMap = (Map<Dishes, Integer>) ctx.getSession().get(Constant.CAR);
		total = 0.0;
		if (dishesMap != null) {
			for (Entry<Dishes, Integer> e : dishesMap.entrySet()) {
				total += e.getKey().getPrice() * e.getValue();
			}
		}
		return SUCCESS;
	}

	public String addCar() {
		try {
			dishes = dishesService.get(dishes.getId());
			@SuppressWarnings("unchecked")
			Map<Dishes, Integer> dishesMap = (Map<Dishes, Integer>) ctx.getSession().get(Constant.CAR);
			if (dishesMap == null) {
				dishesMap = new HashMap<>();
				dishesMap.put(dishes, 1);
				ctx.getSession().put(Constant.CAR, dishesMap);
			} else {
				if (dishesMap.containsKey(dishes)) {
					dishesMap.put(dishes, dishesMap.get(dishes) + 1);
				} else {
					dishesMap.put(dishes, 1);
				}
				ctx.getSession().put(Constant.CAR, dishesMap);
			}
			System.out.println(ctx.getSession().get(Constant.CAR));
			if (fromIndex == 1) {
				return "fromIndex";
			}
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public String minusCar() {
		try {
			dishes = dishesService.get(dishes.getId());
			@SuppressWarnings("unchecked")
			Map<Dishes, Integer> dishesMap = (Map<Dishes, Integer>) ctx.getSession().get(Constant.CAR);
			if (dishesMap == null) {
				return "fromIndex";
			} else {
				if(dishesMap.containsKey(dishes)){
					if(dishesMap.get(dishes) == 1){
						dishesMap.remove(dishes);
					}else{
						dishesMap.put(dishes, dishesMap.get(dishes) - 1);
					}
					ctx.getSession().put(Constant.CAR, dishesMap);
				}else{
					return "fromIndex";
				}
			}
			System.out.println(ctx.getSession().get(Constant.CAR));
			if (fromIndex == 1) {
				return "fromIndex";
			}
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public String deleteFromCar() {
		@SuppressWarnings("unchecked")
		Map<Dishes, Integer> dishesMap = (Map<Dishes, Integer>) ctx.getSession().get(Constant.CAR);
		if (dishesMap != null) {
			dishesMap.remove(dishes);
		}
		return SUCCESS;
	}

	// private Dishes containsKey(Map<Dishes, Integer> m, Dishes dishes) {
	// for (Dishes d : m.keySet()) {
	// if (d.getId() == dishes.getId()) {
	// return d;
	// }
	// }
	// return null;
	// }
	//
	// private Integer remove(Map<Dishes, Integer> m, Dishes dishes) {
	// for (Dishes d : m.keySet()) {
	// if (d.getId() == dishes.getId()) {
	// return m.remove(d);
	// }
	// }
	// return 0;
	// }

	public Dishes getDishes() {
		return dishes;
	}

	public void setDishes(Dishes dishes) {
		this.dishes = dishes;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Integer getFromIndex() {
		return fromIndex;
	}

	public void setFromIndex(Integer fromIndex) {
		this.fromIndex = fromIndex;
	}

}
