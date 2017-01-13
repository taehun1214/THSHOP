package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.CartandBuy;
import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface SellerDAO {

	// 태훈 코드
	public abstract int insertSeller(SellerVO vo);
	public abstract SellerVO selectCheckID(String s_id);
	public abstract boolean isValidUser(String s_id, String s_pw);
	public abstract boolean isAccConf(String s_id, String s_pw);
	
	// 용훈 코드
	public abstract List<ProductVO> selectAllProduct();
	public abstract List<ProductVO> selectProductBySid(String s_id);
	public abstract ProductVO selectItemByPno(int p_no);
	public abstract List<OptionVO> selectOpByPno(int p_no);
	public abstract List<ImageVO> selectImgByPno(int p_no);
	public abstract int updateLogo(SellerVO sVo, String s_id);
	public abstract SellerVO selectSellerInfo(String s_id);
	public abstract int updateInfo(SellerVO sVo, String s_id);
	public abstract List<ProductVO> selectAllProductByPcate1(String p_cate1);
	public abstract List<ProductVO> selectAllProductByPcate2(String p_cate2);
	
	// 관리자 페이지 관련
		// 리스트를 받아오기 위한 select문
		public abstract List<SellerVO> select();

		// 전체 페이지수를 계산하기 위해서
		public abstract int getNumOfRecords();

		// paging 처리를 위한 select문
		public abstract List<SellerVO> select(PageCriteria cri);

		// 검색 기능을 위한 select문
		public abstract List<SellerVO> listSearch(SearchPageCriteria cri);

		// 검색 후 paging 처리를 위한 전체 페이지 계산
		public abstract int listSearchCount(SearchPageCriteria cri);

		// db에서 미승인된 판매자 회원 뽑아옴
		public abstract List<SellerVO> selectAccess();

		// 판매자 승인 처리
		public abstract int update(int sno);
		
		// ---------------------------여기까지
		
		// 판매자 마이페이지 관련
		// 주문 요청 내역 갯수
		public abstract List<CartandBuy> selectBySellerOrderCount(String s_id);
		// 주문 요청 내역 (5건)
		public abstract List<CartandBuy> selectBySellerOrder(String s_id);
		// 전체 주문 요청 내역
		public abstract List<CartandBuy> selectBySellerAllOrder(String s_id);
		// 판매물 승인 요청 갯수
		public abstract List<ProductVO> selectByProductAccCount(String s_id);
		// 판매 완료 내역 (5건)
		public abstract List<CartandBuy> selectBySellerComplete(String s_id);
		// 전체 판매 완료 내역
		public abstract List<CartandBuy> selectBySellerAllComplete(String s_id);
		
		public abstract List<ProductVO> selectByProdcutAccList(String s_id);
		
		public abstract List<ProductVO> selectByProductAccAllList(String s_id);
		//-----------------------------여기까지
		public abstract int updateSellerInfo(SellerVO vo);
		
		public abstract int deleteSeller(String s_id);
		
		
		//판매자 아이디 찾기
		public abstract SellerVO findId(SellerVO vo);
		//판매자 비밀번호 재설정을 위한 인증
		public abstract SellerVO findPw(SellerVO vo);
		
		//판매자 비밀번호 재설정
		public abstract int updatepw(SellerVO vo);
} // end interface SellerDAO
