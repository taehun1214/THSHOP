package com.online.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.BuyVO;
import com.online.shop.domain.CartVO;
import com.online.shop.domain.CartandBuy;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

@Repository
public class AdminDAOImple implements AdminDAO {

	private static final String NAMEPACE = "com.online.shop.AdminMapper";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BuyVO> selectByBuy() {
		return sqlSession.selectList(NAMEPACE+".selectByBuy");
	}
	
	@Override
	public List<CartandBuy> selectBybuymain() {
		return sqlSession.selectList(NAMEPACE+".selectBybuymain");
	}
	
	@Override
	public List<BuyVO> selectByBuy2() {
		return sqlSession.selectList(NAMEPACE+".selectByBuy2");
	}
	
	@Override
	public List<CartandBuy> selectBybuymain2() {
		return sqlSession.selectList(NAMEPACE+".selectBybuymain2");
	}
	
	@Override
	public List<BuyVO> selectByBuyr() {
		return sqlSession.selectList(NAMEPACE+".selectByBuyr");
	}
	
	@Override
	public List<CartandBuy> selectBysubr(PageCriteria cri) {
		return sqlSession.selectList(NAMEPACE+".selectBysubr", cri);
	}
	
	@Override
	public List<BuyVO> selectByBuyf() {
		return sqlSession.selectList(NAMEPACE+".selectByBuyf");
	}
	
	@Override
	public List<CartandBuy> selectBysubf() {
		return sqlSession.selectList(NAMEPACE+".selectBybuysubf");
	}

	
	// 레코드 전체 수를 검색 하는 dao
	@Override
	public int getNumOfRecordsBuyr() {
		return sqlSession.selectOne(NAMEPACE + ".buyrTotalCount");
	}
	
	// 페이징 처리를 수행하는 dao
	@Override
	public List<BuyVO> selectByBuyr(PageCriteria cri) {
		return sqlSession.selectList(NAMEPACE + ".buyrListPage", cri);
	}
	
	// 검색된 레코드 갯수를 세는 dao	
	@Override
	public int getNumOfSearchRecordsBuyr(SearchPageCriteria cri) {
		return sqlSession.selectOne(NAMEPACE + ".buyrListSearchCount", cri);
	}
	
	// 검색 기능을 수행하는 dao
	@Override
	public List<BuyVO> selectByBuyr(SearchPageCriteria cri) {
		return sqlSession.selectList(NAMEPACE + ".buyrListSearch", cri);
	}
	
	@Override
	public int getNumOfRecordsBuyf() {
		return sqlSession.selectOne(NAMEPACE + ".buyfTotalCount");
	}
	
	@Override
	public List<BuyVO> selectByBuyf(PageCriteria cri) {
		return sqlSession.selectList(NAMEPACE + ".buyfListPage", cri);
	}
	
	
	

	@Override
	public List<BuyVO> selectByBuyRequest() {
		return sqlSession.selectList(NAMEPACE+".selectByBuyRequest");
	}
	
	@Override
	public List<BuyVO> selecyByBuyToday(String today) {
		return sqlSession.selectList(NAMEPACE+".selectByBuyToday", today);
	}
	
}
