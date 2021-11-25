package com.tigerlogistics.multiplicantin.tll.model;

public class Location {

	private Integer locationId;
	private String city;
	private String state;
	
	@Override
	public String toString() {
		return "Location [locationId=" + locationId + ", city=" + city + ", state=" + state + "]";
	}

	public Location(Integer locationId, String city, String state) {
		super();
		this.locationId = locationId;
		this.city = city;
		this.state = state;
	}

	public Integer getLocationId() {
		return locationId;
	}

	public void setLocationId(Integer locationId) {
		this.locationId = locationId;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Location() {
		
	}
}
