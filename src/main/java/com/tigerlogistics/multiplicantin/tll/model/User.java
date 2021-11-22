package com.tigerlogistics.multiplicantin.tll.model;

public class User {

	private int userId;
	private String userName;
	private String password;
	private String state;
	private String city;
	private String area;
	private String address;
	private String sex;
	private String phoneNo;
	
	public User() {
		
	}
	
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", state=" + state
				+ ", city=" + city + ", area=" + area + ", address=" + address + ", sex=" + sex + ", phoneNo=" + phoneNo
				+ "]";
	}


	public User(int userId, String userName, String password, String state, String city, String area, String address,
			String sex, String phoneNo) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.state = state;
		this.city = city;
		this.area = area;
		this.address = address;
		this.sex = sex;
		this.phoneNo = phoneNo;
	}


	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
}
