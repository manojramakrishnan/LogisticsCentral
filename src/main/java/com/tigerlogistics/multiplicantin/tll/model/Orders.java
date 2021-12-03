package com.tigerlogistics.multiplicantin.tll.model;

public class Orders {

	private Integer orderId;
	private String orderName;
	private String orderType;
	private Integer senderId;
	private String senderName;
	private String senderProvince;
	private String senderCity;
	private String senderArea;
	private String senderAddress;
	private String senderPhone;
	private Integer receiverId;
	private String receiverName;
	private String receiverProvince;
	private String receiverCity;
	private String receiverArea;
	private String receiverAddress;
	private String receiverPhone;
	private String managerId;
	private String deliveryId;
	private String initialTime;
	private String liveTime;
	private String status;
	private String price;
	private String volume;
	private String transInfo;

	public Orders() {
		
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public Integer getSenderId() {
		return senderId;
	}

	public void setSenderId(Integer senderId) {
		this.senderId = senderId;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderProvince() {
		return senderProvince;
	}

	public void setSenderProvince(String senderProvince) {
		this.senderProvince = senderProvince;
	}

	public String getSenderCity() {
		return senderCity;
	}

	public void setSenderCity(String senderCity) {
		this.senderCity = senderCity;
	}

	public String getSenderArea() {
		return senderArea;
	}

	public void setSenderArea(String senderArea) {
		this.senderArea = senderArea;
	}

	public String getSenderAddress() {
		return senderAddress;
	}

	public void setSenderAddress(String senderAddress) {
		this.senderAddress = senderAddress;
	}

	public String getSenderPhone() {
		return senderPhone;
	}

	public void setSenderPhone(String senderPhone) {
		this.senderPhone = senderPhone;
	}

	public Integer getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(Integer receiverId) {
		this.receiverId = receiverId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverProvince() {
		return receiverProvince;
	}

	public void setReceiverProvince(String receiverProvince) {
		this.receiverProvince = receiverProvince;
	}

	public String getReceiverCity() {
		return receiverCity;
	}

	public void setReceiverCity(String receiverCity) {
		this.receiverCity = receiverCity;
	}

	public String getReceiverArea() {
		return receiverArea;
	}

	public void setReceiverArea(String receiverArea) {
		this.receiverArea = receiverArea;
	}

	public String getReceiverAddress() {
		return receiverAddress;
	}

	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getDeliveryId() {
		return deliveryId;
	}

	public void setDeliveryId(String deliveryId) {
		this.deliveryId = deliveryId;
	}

	public String getInitialTime() {
		return initialTime;
	}

	public void setInitialTime(String initialTime) {
		this.initialTime = initialTime;
	}

	public String getLiveTime() {
		return liveTime;
	}

	public void setLiveTime(String liveTime) {
		this.liveTime = liveTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getTransInfo() {
		return transInfo;
	}

	public void setTransInfo(String transInfo) {
		this.transInfo = transInfo;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderName=" + orderName + ", orderType=" + orderType + ", senderId="
				+ senderId + ", senderName=" + senderName + ", senderProvince=" + senderProvince + ", senderCity="
				+ senderCity + ", senderArea=" + senderArea + ", senderAddress=" + senderAddress + ", senderPhone="
				+ senderPhone + ", receiverId=" + receiverId + ", receiverName=" + receiverName + ", receiverProvince="
				+ receiverProvince + ", receiverCity=" + receiverCity + ", receiverArea=" + receiverArea
				+ ", receiverAddress=" + receiverAddress + ", receiverPhone=" + receiverPhone + ", managerId="
				+ managerId + ", deliveryId=" + deliveryId + ", initialTime=" + initialTime + ", liveTime=" + liveTime
				+ ", status=" + status + ", price=" + price + ", volume=" + volume + ", transInfo=" + transInfo + "]";
	}

	public Orders(Integer orderId, String orderName, String orderType, Integer senderId, String senderName,
			String senderProvince, String senderCity, String senderArea, String senderAddress, String senderPhone,
			Integer receiverId, String receiverName, String receiverProvince, String receiverCity, String receiverArea,
			String receiverAddress, String receiverPhone, String managerId, String deliveryId, String initialTime,
			String liveTime, String status, String price, String volume, String transInfo) {
		super();
		this.orderId = orderId;
		this.orderName = orderName;
		this.orderType = orderType;
		this.senderId = senderId;
		this.senderName = senderName;
		this.senderProvince = senderProvince;
		this.senderCity = senderCity;
		this.senderArea = senderArea;
		this.senderAddress = senderAddress;
		this.senderPhone = senderPhone;
		this.receiverId = receiverId;
		this.receiverName = receiverName;
		this.receiverProvince = receiverProvince;
		this.receiverCity = receiverCity;
		this.receiverArea = receiverArea;
		this.receiverAddress = receiverAddress;
		this.receiverPhone = receiverPhone;
		this.managerId = managerId;
		this.deliveryId = deliveryId;
		this.initialTime = initialTime;
		this.liveTime = liveTime;
		this.status = status;
		this.price = price;
		this.volume = volume;
		this.transInfo = transInfo;
	}
	
}	