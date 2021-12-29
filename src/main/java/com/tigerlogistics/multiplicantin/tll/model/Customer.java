package com.tigerlogistics.multiplicantin.tll.model;

public class Customer {

	private Integer id;
	private String personIncharge;
	private String name;
	private String email;
	private String address;
	private String tel;
	
	@Override
	public String toString() {
		return "Customer [id=" + id + ", personIncharge=" + personIncharge + ", name=" + name + ", email=" + email
				+ ", address=" + address + ", tel=" + tel + "]";
	}
	
	public Customer(Integer id, String personIncharge, String name, String email, String address, String tel) {
		super();
		this.id = id;
		this.personIncharge = personIncharge;
		this.name = name;
		this.email = email;
		this.address = address;
		this.tel = tel;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPersonIncharge() {
		return personIncharge;
	}
	public void setPersonIncharge(String personIncharge) {
		this.personIncharge = personIncharge;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Customer() {
		
	}
}
