package com.projection.domain;

public class Seat {
	private Integer id;
	private Integer containPeople;
	private Integer state = 0;
	private String remark;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getContainPeople() {
		return containPeople;
	}
	public void setContainPeople(Integer containPeople) {
		this.containPeople = containPeople;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Seat [id=" + id + ", containPeople=" + containPeople + ", state=" + state + ", remark=" + remark + "]";
	}
	

}
