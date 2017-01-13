package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface ProductDAO {

	public abstract int insertProduct(ProductVO pVo);
	public abstract int selectProductNo(String s_id);
	public abstract int insertOption(OptionVO oVo);
	public abstract int insertImage(ImageVO iVo);
	public abstract int deleteOptionByPno(int p_no);
	public abstract int deleteImageByPno(int p_no);
	public abstract int deleteProductByPno(int p_no);
	public abstract ProductVO selectProductByPno(int p_no);
	public abstract List<OptionVO> selectOptionByPno(int p_no);
	public abstract List<ImageVO> selectImageByPno(int p_no);
	public abstract int updateProductByPno(ProductVO pVo);
	
	// 상품 카테고리 검색 추가 by 김태훈
	public abstract List<ProductVO> selectProductCate(String p_cate2);
	
	// 전체 검색을 위한 select문
	public abstract List<ProductVO> select();

	public abstract List<ProductVO> selectAcc();


	// 페이징 처리가 되는 select문
	public abstract List<ProductVO> select(PageCriteria cri);
	// 페이징 처리를 위한 전체 페이지수 검색
	public abstract int getNumOfRecords();
	// 검색 기능이 되는 select문
	public abstract List<ProductVO> select(SearchPageCriteria cri);
	// 검색후 페이징 처리를 위한 전체 페이지수 검색
	public abstract int listSearchCount(SearchPageCriteria cri);
	
	// 승인 처리
	public abstract int update(int pno);
	
	// 검색
	public abstract List<ProductVO> selectSearch(String p_name);
	
} // end interface ProductDAO
