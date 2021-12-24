package com.tigerlogistics.multiplicantin.tll.DAO;

import java.util.List;

import com.tigerlogistics.multiplicantin.tll.model.StockOut;

public interface StockOutDAO {

	List<StockOut> selectByCustomerId(Integer customerId);

}
