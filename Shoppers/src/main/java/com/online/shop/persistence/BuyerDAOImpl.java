package com.online.shop.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.CartandBuy;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

@Repository
public class BuyerDAOImpl implements BuyerDAO{
	
	private static final String NAMESPACE = "com.online.shop.BuyerMapper";
	private static final String NAMESPACES = "com.online.shop.ShopMapper";
	private static final String NAMESPACEM = "com.online.shop.MypageMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입
	@Override
	public int insert(BuyerVO vo) {
		int result =  sqlSession.insert(NAMESPACE+".buyer-insert", vo);
		return result;
	}
	
	// 회원가입 ID 중복검사 AJAX에 쓰임
	@Override
	public BuyerVO select(String b_id) {
		BuyerVO vo =sqlSession.selectOne(NAMESPACE+".select-by-b_id", b_id);
		return vo;
	}
	
	// 로그인
	@Override
	public boolean isValidUser(String b_id, String b_pw) {
		Map<String, String> map = new HashMap<>();
		map.put("b_id", b_id);
		map.put("b_pw", b_pw);
		int result = sqlSession.selectOne(NAMESPACE+".buyer-login", map);
		if (result == 1) {
			return true;
		} else{
			return false;
		}
	}
	
	@Override
	public List<BuyerVO> select() {
		List<BuyerVO> list = sqlSession.selectList(NAMESPACES + ".buyerSelectAll");
		
		return list;
	}
	
	
	@Override
	public int getNumOfRecords() {
		return sqlSession.selectOne(NAMESPACES + ".totalCount");
	}
	
	@Override
	public List<BuyerVO> select(PageCriteria cri) {
		return sqlSession.selectList(NAMESPACES + ".listPage", cri);
	}
	
	@Override
	public List<BuyerVO> listSearch(SearchPageCriteria crit) {
		List<BuyerVO> list = sqlSession.selectList(NAMESPACES + ".listSearch", crit);
		
			return list;
	} 
	
	@Override
	public int listSearchCount(SearchPageCriteria crit) {		
		return sqlSession.selectOne(NAMESPACES + ".listSearchCount", crit);
	}
	
	// 구매자 마이페이지
	@Override
	public List<CartandBuy> selectBybuymain2(String b_id) {
		return sqlSession.selectList(NAMESPACEM + ".selectBybuymain2", b_id);
	}
	
	// 구매 완료
	@Override
	public List<CartandBuy> selectBybuyComplete(String b_id) {
		return sqlSession.selectList(NAMESPACEM + ".selectBybuyComplete", b_id);
	}
	
	// 구매내역
	@Override
	public List<CartandBuy> selectBybuymain(String b_id) {
		return sqlSession.selectList(NAMESPACEM + ".selectBybuymain", b_id);
	}

	// 구매 내역 조회 (페이징)
	@Override
	public List<CartandBuy> selectBybuymainPage(PageCriteria cri, String b_id) {
		return sqlSession.selectList(NAMESPACEM + ".selectBybuymain2page", b_id);
	}

	// 구매 완료 내역 조회
	@Override
	public List<CartandBuy> selectBybuyCompleteMain(String b_id) {
		return sqlSession.selectList(NAMESPACEM + ".selectBybuyCompleteMain", b_id);
	}
	
	// 전체 구매 내역 조회
	@Override
	public List<CartandBuy> selectByOrderMain(String b_id) {
		return sqlSession.selectList(NAMESPACEM + ".selectByOrderMain", b_id);
	}
	
	// 전체 완료 내역 조회
	@Override
	public List<CartandBuy> selectByBuyCompleteMain2(String b_id) {
		return sqlSession.selectList(NAMESPACEM + ".selectByBuyCompleteMain2", b_id);
	}
	
	
	@Override
	public int updateBuyerInfo(BuyerVO vo) {
		System.out.println("imple vo");
		int result = sqlSession.update(NAMESPACEM+".update-buyerInfo", vo);
		System.out.println("imple 결과:"+result);
		return result;
	}
	
	@Override
	public int deleteBuyer(String b_id) {
		return sqlSession.delete(NAMESPACE+".delete-buyer", b_id);
	}
	
	@Override
	public BuyerVO findId(BuyerVO vo) {
		System.out.println("findId");
		BuyerVO result = sqlSession.selectOne(NAMESPACE+".buyer-find-id", vo);
		System.out.println(result.getB_id());
		return  result;
	}
	
	@Override
	public BuyerVO findPw(BuyerVO vo) {
		return sqlSession.selectOne(NAMESPACE+".buyer-find-pw", vo);
	}
	
	@Override
	public int updatepw(BuyerVO vo) {
		return sqlSession.update(NAMESPACE+".update-buyer-pw", vo);
	}
}
