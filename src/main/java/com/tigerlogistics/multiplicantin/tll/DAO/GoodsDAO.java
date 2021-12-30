package com.tigerlogistics.multiplicantin.tll.DAO;

import com.tigerlogistics.multiplicantin.tll.model.Goods;

public interface GoodsDAO {

	void insert(Goods goods);

	Goods selectByName(String name);

	void update(Goods goods);

	void deleteById(Integer goodsId);

}
