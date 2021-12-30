package com.tigerlogistics.multiplicantin.tll.model;

public class Goods {

	private Integer id;
	private String name;
	private String rype;
	private String size;
	private String value;
	
	public Goods() {
		
	}
	
	public Goods(Integer id, String name, String rype, String size, String value) {
		super();
		this.id = id;
		this.name = name;
		this.rype = rype;
		this.size = size;
		this.value = value;
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


	public String getRype() {
		return rype;
	}


	public void setRype(String rype) {
		this.rype = rype;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}


	public String getValue() {
		return value;
	}


	public void setValue(String value) {
		this.value = value;
	}


	@Override
	public String toString() {
		return "Goods [id=" + id + ", name=" + name + ", rype=" + rype + ", size=" + size + ", value=" + value + "]";
	}
	
}
