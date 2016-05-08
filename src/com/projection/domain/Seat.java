package com.projection.domain;

public class Seat {
	private Integer id;
	private Integer containPeople;
	private Integer state = 0; //0:可用 1:不可用
	private String remark;
	private Integer valid = 1;
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
	public Integer getValid() {
		return valid;
	}
	public void setValid(Integer valid) {
		this.valid = valid;
	}
	

}
