package com.korea.k2.cart;

import java.util.List;

public interface CartService {
	void insert(CartVO vo);
	void delete(CartVO vo);
	void deleteAll(CartVO vo);
	void update(CartVO vo);
	
	void insertOrderJumunseo(OrderJumunseoVO vo);
	void insertOrderMoney(OrderMoneyVO vo);
	int orderG(OrderMoneyVO vo);
	
	List<CartVO> selectAll(CartVO vo);
	
	List<OrderMoneyVO> Moneyselect(OrderMoneyVO vo);
}
