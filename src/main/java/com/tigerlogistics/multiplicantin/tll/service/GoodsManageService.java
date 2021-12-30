package com.tigerlogistics.multiplicantin.tll.service;

import com.tigerlogistics.multiplicantin.tll.exception.GoodsManageServiceException;
import com.tigerlogistics.multiplicantin.tll.model.Goods;

public interface GoodsManageService {

	boolean addGoods(Goods goods) throws GoodsManageServiceException;

	boolean updateGoods(Goods goods);

	boolean deletegoods(Integer goodsId);

}
