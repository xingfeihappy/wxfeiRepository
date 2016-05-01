package com.projection.domain;

import java.util.Date;
import java.util.Set;
public class Order {
	private Integer id;
	private String codes;
	private User user;
	private Seat seat;
	private Integer foodNum;
	private Double totalMoney;
	private Date dinnerTime;
	private String state;
	private Set<Dishes> dishesSet;
	
	public Order(){
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCodes() {
		return codes;
	}

	public void setCodes(String codes) {
		this.codes = codes;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(Integer foodNum) {
		this.foodNum = foodNum;
	}

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public Date getDinnerTime() {
		return dinnerTime;
	}

	public void setDinnerTime(Date dinnerTime) {
		this.dinnerTime = dinnerTime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Seat getSeat() {
		return seat;
	}

	public void setSeat(Seat seat) {
		this.seat = seat;
	}

	public Set<Dishes> getDishesSet() {
		return dishesSet;
	}

	public void setDishesSet(Set<Dishes> dishesSet) {
		this.dishesSet = dishesSet;
	}
	
}
