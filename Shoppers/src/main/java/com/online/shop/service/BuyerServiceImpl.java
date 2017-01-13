package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.CartandBuy;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;
import com.online.shop.persistence.BuyerDAO;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	@Autowired // 스프링 프레임워크에서 관리하는 DAO 빈 객체를 주입
	private BuyerDAO dao;
	
	@Override
	public int insert(BuyerVO vo) {
		return dao.insert(vo);
	}
	
	@Override
	public BuyerVO read(String b_id) {
		return dao.select(b_id);
	}
	
	@Override
	public boolean isValidUser(String b_id, String b_pw) {
		return dao.isValidUser(b_id, b_pw);
	}
	
	@Override
	public List<BuyerVO> read() {
		return dao.select();
	}
	
	@Override
	public int getNumOfRecords() {
		return dao.getNumOfRecords();
	}
	
	@Override
	public List<BuyerVO> read(PageCriteria cri) {
		return dao.select(cri);
	}

	@Override
	public int listSearchCount(SearchPageCriteria cri) {
		return dao.listSearchCount(cri);
	}
	
	@Override
	public List<BuyerVO> listSearchCriteria(SearchPageCriteria cri) {
		return dao.listSearch(cri);
	}
	
	@Override
	public List<CartandBuy> readM(String b_id) {
		return dao.selectBybuymain2(b_id);
	}
	
	@Override
	public List<CartandBuy> complete(String b_id) {
		return dao.selectBybuyComplete(b_id);
	}
	
	@Override
	public List<CartandBuy> readmain(String b_id) {
		return dao.selectBybuymain(b_id);
	}
	
	@Override
	public List<CartandBuy> readmainPage(PageCriteria cri, String b_id) {
		return dao.selectBybuymainPage(cri, b_id);
	}
	
	
	@Override
	public List<CartandBuy> readCompleteMain(String b_id) {
		return dao.selectBybuyCompleteMain(b_id);
	}
	
	@Override
	public List<CartandBuy> readordermain(String b_id) {
		return dao.selectByOrderMain(b_id);
	}
	
	@Override
	public List<CartandBuy> readCompleteMain2(String b_id) {
		return dao.selectByBuyCompleteMain2(b_id);
	}

	@Override
	public int updateBuyerInfo(BuyerVO vo) {
		return dao.updateBuyerInfo(vo);
	}
	
	@Override
	public int deletebuyer(String b_id) {
		return dao.deleteBuyer(b_id);
	}
	
	@Override
	public BuyerVO findId(BuyerVO vo) {
		return dao.findId(vo);
	}
	
	@Override
	public BuyerVO findPw(BuyerVO vo) {
		return dao.findPw(vo);
	}
	
	@Override
	public int updatePw(BuyerVO vo) {
		return dao.updatepw(vo);
	}
	
}
