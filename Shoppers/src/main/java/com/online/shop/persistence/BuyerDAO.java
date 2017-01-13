package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.CartandBuy;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface BuyerDAO {
	// 회원 가입
	public abstract int insert(BuyerVO vo);
	// 중복 아이디 체크
	public abstract BuyerVO select(String b_id);
	// 로그인
	public abstract boolean isValidUser(String b_id, String b_pw);
	// 관리자 페이지
	public abstract List<BuyerVO> select();
	
	public abstract int getNumOfRecords();
	
	public abstract List<BuyerVO> select(PageCriteria cri) ;
	
	public abstract List<BuyerVO> listSearch(SearchPageCriteria crit);
	
	public int listSearchCount(SearchPageCriteria crit);
	//----------------------------여기까지
	
	// 구매자 마이페이지
	public abstract List<CartandBuy> selectBybuymain2(String b_id);
	
	public abstract List<CartandBuy> selectBybuyComplete(String b_id);
	
	public abstract List<CartandBuy> selectBybuymain(String b_id);
	
	public abstract List<CartandBuy> selectBybuymainPage(PageCriteria cri, String b_id);
	
	public abstract List<CartandBuy> selectBybuyCompleteMain(String b_id);
	
	public abstract List<CartandBuy> selectByOrderMain(String b_id);
	
	public abstract List<CartandBuy> selectByBuyCompleteMain2(String b_id);
	// --------------------
	
	//구매자 마이페이지 정보수정
	public abstract int updateBuyerInfo(BuyerVO vo);
	
	//구매자 회원 탈퇴
	public abstract int deleteBuyer(String b_id);
	
	//구매자 아이디 찾기
	public abstract BuyerVO findId(BuyerVO vo);
	//구매자 비밀번호 재설정을 위한 인증
	public abstract BuyerVO findPw(BuyerVO vo);
	
	//구매자 비밀번호 재설정
	public abstract int updatepw(BuyerVO vo);
}
