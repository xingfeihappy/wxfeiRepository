package com.projection.domain;

import java.util.Date;

public class Dishes {
	private Integer id;
	private String name;
	private Double price;
	private DishesType type;
	private String description;
	private byte[] photo;
	private Date updateTime;
	private int valid = 1;
	public Dishes(){
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public DishesType getType() {
		return type;
	}

	public void setType(DishesType type) {
		this.type = type;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public int getValid() {
		return valid;
	}

	public void setValid(int valid) {
		this.valid = valid;
	}

	@Override
	public String toString() {
		return "Dishes [id=" + id + ", name=" + name + ", price=" + price + ", type=" + type.getType() + ", description="
				+ description + ", updateTime=" + updateTime + ", valid=" + valid
				+ "]";
	}
	
	
	
	
}
