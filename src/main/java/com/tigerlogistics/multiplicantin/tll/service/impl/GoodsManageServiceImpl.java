package com.tigerlogistics.multiplicantin.tll.service.impl;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerlogistics.multiplicantin.tll.DAO.GoodsDAO;
import com.tigerlogistics.multiplicantin.tll.DAO.StockOutDAO;
import com.tigerlogistics.multiplicantin.tll.exception.GoodsManageServiceException;
import com.tigerlogistics.multiplicantin.tll.model.Goods;
import com.tigerlogistics.multiplicantin.tll.model.StockOut;
import com.tigerlogistics.multiplicantin.tll.service.GoodsManageService;

@Service("goodsManageService")
public class GoodsManageServiceImpl implements GoodsManageService {

	@Autowired
	private GoodsDAO goodsDAO;
	
	@Autowired
	private StockOutDAO stockOutDAO;
	
	
	@Override
	public boolean addGoods(Goods goods) throws GoodsManageServiceException {
		// TODO Auto-generated method stub
		if(goods != null) {
			if(goodsCheck(goods)) {
				try {
					if(null == goodsDAO.selectByName(goods.getName())) {
						goodsDAO.insert(goods);
						return true;
					}
				}
				catch(PersistenceException e) {
					
				}
			}
		}
		
		return false;
	}

	private boolean goodsCheck(Goods goods) {
		// TODO Auto-generated method stub
		return goods.getName() != null && goods.getRype() != null && goods.getSize() != null && goods.getValue() != null;
	}

	@Override
	public boolean updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		if(goods != null) {
			if(goodsCheck(goods)) {
				try {
					if(null == goodsDAO.selectByName(goods.getName())) {
						goodsDAO.update(goods);
						return true;
					}
				}
				catch(PersistenceException e) {
					
				}
			}
		}
		return false;
	}

	@Override
	public boolean deletegoods(Integer goodsId) {
		// TODO Auto-generated method stub
		try {
			List<StockOut> records = stockOutDAO.selectByGoodsId(goodsId); 
			if(records != null && records.size()>0) {
				return false;
			}
			else {
				goodsDAO.deleteById(goodsId);
			}
		}
		catch(PersistenceException e) {
			
		}
		return true;
	}

}
