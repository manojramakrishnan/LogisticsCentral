package com.tigerlogistics.multiplicantin.tll.exception;

public class BusinessException extends Exception{

	public String exceptionDesc;
	
	public String getExceptionDesc() {
		return exceptionDesc;
	}

	public void setExceptionDesc(String exceptionDesc) {
		this.exceptionDesc = exceptionDesc;
	}

	public BusinessException(Exception e) {
		super(e);
	}

	BusinessException(Exception e, String exceptionDesc){
		super(e);
		this.exceptionDesc=exceptionDesc;
	}

	BusinessException(String exceptionDesc){
		this.exceptionDesc=exceptionDesc;
	}
	BusinessException(){
		
	}
	
}
