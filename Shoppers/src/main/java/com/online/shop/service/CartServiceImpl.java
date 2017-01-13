package com.online.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.CartVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	public CartDAO dao;
	
	@Override
	public int insertCart(CartVO vo) {
		return dao.insertCart(vo);
	}
	@Override
	public List<CartVO> read(String b_id) {
		return dao.selectAll(b_id);
	}
	@Override
	public int deleteCart(int c_no) {
		return dao.deleteCart(c_no);
	}
	@Override
	public int updateBuyCnt(int c_no, int buy_cnt) {
		return dao.updateCount(c_no, buy_cnt);
	}
	@Override
	public CartVO readCart(int c_no) {
		return dao.selectCart(c_no);
	}
	@Override
	public int updateBuyNo(int buy_no, int c_no) {
		return dao.updateBuyNO(buy_no, c_no);
	}
	@Override
	public ProductVO cartImageByPno(int p_no) {
		return dao.cartImageByPno(p_no);
	}
	@Override
	public int selectMaxCNO() {
		return dao.selectMaxCNoForDirectOrder();
	}
	
	@Override
	public List<CartVO> selectCartBuyer(CartVO vo) {
		return dao.selectCartBuyer(vo);
	}

}
