package com.tigerlogistics.multiplicantin.tll.exception;

public class GoodsManageServiceException extends BusinessException {
	
	public GoodsManageServiceException() {
		super();
		
	}
	public GoodsManageServiceException (Exception e, String exception) {
		super(e, exception);
		
	}
	
	public GoodsManageServiceException(Exception e) {
		super(e);
	}

}
