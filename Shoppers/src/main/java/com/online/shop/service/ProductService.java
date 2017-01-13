package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

// CRUD: Create, Read, Update, Delete
public interface ProductService {

	// 새 상품 등록
	// 상품 정보 등록 기능
	public abstract int createProduct(ProductVO pVo);
	// 상품 번호 추출 기능
	public abstract int readProductNo(String s_id);
	// 옵션 정보 등록 기능
	public abstract int createOption(OptionVO oVo);
	// 이미지 정보 등록 기능
	public abstract int createImage(ImageVO iVo);
	// 상품 정보 삭제 기능
	public abstract int deleteOptionByPno(int p_no);
	public abstract int deleteImageByPno(int p_no);
	public abstract int deleteProductByPno(int p_no);
	// 상품 정보 수정 기능 중  - 불러오기
	public abstract ProductVO readProductByPno(int p_no);
	public abstract List<OptionVO> readOptionByPno(int p_no);
	public abstract List<ImageVO> readImageByPno(int p_no);
	// 상품 정보 수정 기능 중  - 업데이트
	public abstract int updateProductByPno(ProductVO pVo);
	
	// 카테고리 검색 추가 by 김태훈
	public abstract List<ProductVO> selectCate2(String p_cate2);
	
	// 관리자페이지 관련
		// 판매물 목록을 불러오는 service
			public abstract List<ProductVO> read();

			public abstract List<ProductVO> selectAcc();

			// 판매물 목록을 페이징 처리를 위한 service
			public abstract List<ProductVO> read(PageCriteria cri);
			// 판매물 목록의 총 갯수를 세는 service
			public abstract int getNumOfRecords ();
			// 판매물 검색 처리를 위한 service
			public abstract List<ProductVO> listSearchCriteria(SearchPageCriteria cri);
			// 판매물 검색 목록의 갯수를 세는 service
			public abstract int listSearchCount(SearchPageCriteria cri);
			// 승인 요청 처리 service
			public abstract int productAcc(int pno);
			
			// 검색
			public abstract List<ProductVO> selectSearch(String p_name);
		
		
	
} // end interface ProductService
