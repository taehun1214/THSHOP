package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.CartandBuy;
import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

// CRUD: Create, Read, Update, Delete
public interface SellerService {

	// 태훈
	public abstract int createSeller(SellerVO vo);
	public abstract SellerVO readCheckID(String s_id);
	public abstract boolean isValidUser(String s_id, String s_pw);
	public abstract boolean isAccConf(String s_id, String s_pw);
	
	// 용훈
	// 전체 상품 정보 검색
	public abstract List<ProductVO> readAllProduct();
	// 판매자별 상품 정보 검색
	public abstract List<ProductVO> readProductBySid(String s_id);
	// 해당 상품 번호로 상세 페이지 리턴
	public abstract ProductVO readItemByPno(int p_no);
	// 해당 상품명과 판매자명으로 상세 페이지에 옵션 객체 리턴
	public abstract List<OptionVO> readOpByPno(int p_no);
	// 해당 상품명과 판매자명으로 상세 페이지에 이미지 객체 리턴
	public abstract List<ImageVO> readImgByPno(int p_no);
	// 판매자의 로고 이미지를 추가하는 기능
	public abstract int updateLogo(SellerVO sVo, String s_id);
	// 판매자 아이디에 의한 판매자 정보 호출
	public abstract SellerVO readSellerInfo(String s_id);
	// 판매자의 정보를 추가하는 기능
	public abstract int updateInfo(SellerVO sVo, String s_id);
	// 상위 카테고리로 상품 리스트 받아오기
	public abstract List<ProductVO> readAllProductByPcate1(String p_cate1);
	// 하위 카테고리로 상품 리스트 받아오기
	public abstract List<ProductVO> readAllProductByPcate2(String p_cate2);
	
	// 관리자 페이지 관련
		// 판매자 목록을 불러오기 위한 service
		public abstract List<SellerVO> read();

		// 판매자 목록 페이징 처리를 위한 service
		public abstract List<SellerVO> read(PageCriteria cri);

		// 판매자 목록 총 갯수를 세기 위한 service
		public abstract int getNumOfRecords();

		// 판매자 목록 검색을 위한 service
		public abstract List<SellerVO> listSearchCriteria(SearchPageCriteria cri);

		// 판매자 목록 검색 페이지수를 세기 위한 service
		public abstract int listSearchCount(SearchPageCriteria cri);

		// 미승인 판매자 검색
		public abstract List<SellerVO> searchAccess();

		// 판매자 승인 업데이트
		public abstract int updateAcc(int sno);
		// -------------------------------------여기까지
		
		// 판매자 마이페이지
		// 주문 요청 갯수
		public abstract List<CartandBuy> orderCount(String s_id);
		// 주문 요청 내역 5건
		public abstract List<CartandBuy> orderList(String s_id);
		// 전체 주문 요청 내역
		public abstract List<CartandBuy> orderAllList(String s_id);
		// 판매물 승인 갯수
		public abstract List<ProductVO> accCount(String s_id);
		// 판매 완료 내역 5건
		public abstract List<CartandBuy> completeList(String s_id);
		// 전체 판매 내역
		public abstract List<CartandBuy> completAllList(String s_id);
		
		public abstract List<ProductVO> accList(String s_id);
		
		public abstract List<ProductVO> accAllList(String s_id);
		
		public abstract int updateSellerInfo(SellerVO vo);
		
		public abstract int deleteSeller(String s_id);
		
		//판매자 아이디 찾기
		public abstract SellerVO findId(SellerVO vo);
		//판매자 비밀번호 찾기
		public abstract SellerVO findPw(SellerVO vo);
		//판매자 비밀번호 재설정
		public abstract int updatePw(SellerVO vo);
	
} // end interface SellerService
