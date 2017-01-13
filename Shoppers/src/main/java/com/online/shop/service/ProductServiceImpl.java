package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;
import com.online.shop.persistence.ProductDAO;

@Service // 스프링 프레임워크에 Service 계층 콤포넌트 bean 객체로 등록
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDao;
	
	@Override
	public int createProduct(ProductVO pVo) {
		
		return productDao.insertProduct(pVo);
	}
	
	@Override
	public int readProductNo(String s_id) {
		
		return productDao.selectProductNo(s_id);
	}

	@Override
	public int createOption(OptionVO oVo) {
		
		return productDao.insertOption(oVo);
	}

	@Override
	public int createImage(ImageVO iVo) {
		
		return productDao.insertImage(iVo);
	}

	@Override
	public int deleteOptionByPno(int p_no) {
		
		return productDao.deleteOptionByPno(p_no);
	}

	@Override
	public int deleteImageByPno(int p_no) {
		
		return productDao.deleteImageByPno(p_no);
	}
	
	@Override
	public int deleteProductByPno(int p_no) {
		
		return productDao.deleteProductByPno(p_no);
	}
	
	@Override
	public ProductVO readProductByPno(int p_no) {
		
		return productDao.selectProductByPno(p_no);
	}
	
	@Override
	public List<OptionVO> readOptionByPno(int p_no) {
		
		return productDao.selectOptionByPno(p_no);
	}
	
	@Override
	public List<ImageVO> readImageByPno(int p_no) {
		
		return productDao.selectImageByPno(p_no);
	}

	@Override
	public int updateProductByPno(ProductVO pVo) {
	
		return productDao.updateProductByPno(pVo);
	}
	
	@Override
	public List<ProductVO> selectCate2(String p_cate2) {
		return productDao.selectProductCate(p_cate2);
	}
	
	// 관리자 페이지 관련 Service
		@Override
		public List<ProductVO> read() {
			return productDao.select();
		}
		
		@Override
		public List<ProductVO> selectAcc() {
			return productDao.selectAcc();
		}

		public int getNumOfRecords() {
			return productDao.getNumOfRecords();
		}
		
		@Override
		public List<ProductVO> read(PageCriteria cri) {
			return productDao.select(cri);
		}
		
		@Override
		public int listSearchCount(SearchPageCriteria cri) {
			return productDao.listSearchCount(cri);
		}
		
		@Override
		public List<ProductVO> listSearchCriteria(SearchPageCriteria cri) {
			return productDao.select(cri);
		}

		// 승인 요청 처리
		@Override
		public int productAcc(int pno) {
			return productDao.update(pno);
		}
		@Override
		public List<ProductVO> selectSearch(String p_name) {
			return productDao.selectSearch(p_name);
		}




} // end class ProductServiceImpl
