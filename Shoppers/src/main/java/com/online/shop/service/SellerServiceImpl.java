package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.CartandBuy;
import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;
import com.online.shop.persistence.SellerDAO;

@Service // 스프링 프레임워크에 Service 계층 콤포넌트 bean 객체로 등록
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerDAO sellerDao;
	
	@Override
	public List<ProductVO> readProductBySid(String s_id) {
		
		return sellerDao.selectProductBySid(s_id);
	}

	@Override
	public ProductVO readItemByPno(int p_no) {
		
		return sellerDao.selectItemByPno(p_no);
	}

	@Override
	public List<OptionVO> readOpByPno(int p_no) {
		
		return sellerDao.selectOpByPno(p_no);
	}

	@Override
	public List<ImageVO> readImgByPno(int p_no) {
		
		return sellerDao.selectImgByPno(p_no);
	}

	@Override
	public int updateLogo(SellerVO sVo, String s_id) {
		
		return sellerDao.updateLogo(sVo, s_id);
	}

	@Override
	public SellerVO readSellerInfo(String s_id) {
		
		return sellerDao.selectSellerInfo(s_id);
	}

	@Override
	public int updateInfo(SellerVO sVo, String s_id) {
		
		return sellerDao.updateInfo(sVo, s_id);
	}
	
	/////////////////////////////////////////////////////////////////////태훈
	@Override
	public int createSeller(SellerVO vo) {
		return sellerDao.insertSeller(vo);
	}

	@Override
	public SellerVO readCheckID(String s_id) {
		return sellerDao.selectCheckID(s_id);
	}

	@Override
	public boolean isValidUser(String s_id, String s_pw) {
		return sellerDao.isValidUser(s_id, s_pw);
	}

	@Override
	public List<ProductVO> readAllProduct() {		
		return sellerDao.selectAllProduct();
	}
	
	//////////////////////////////////////////////////////
	// 관리자 페이지 관련
		@Override
		public List<SellerVO> read() {
			return sellerDao.select();
		}
		
		@Override
		public int getNumOfRecords() {
			return sellerDao.getNumOfRecords();
		}
		
		@Override
		public List<SellerVO> read(PageCriteria cri) {
			return sellerDao.select(cri);
		}
		
		@Override
		public List<SellerVO> listSearchCriteria(SearchPageCriteria cri) {
			return sellerDao.listSearch(cri);
		}
		
		@Override
		public int listSearchCount(SearchPageCriteria cri) {
			return sellerDao.listSearchCount(cri);
		}

		@Override
		public List<SellerVO> searchAccess() {
			return sellerDao.selectAccess();
		}
		
		@Override
		public int updateAcc(int sno) {
			return sellerDao.update(sno);
		}
		//------------------------------------------여기까지
		
		// 판매자 마이 페이지
		// 요청 내역 갯수
		@Override
		public List<CartandBuy> orderCount(String s_id) {
			return sellerDao.selectBySellerOrderCount(s_id);
		}
		
		// 요청 내역 5건
		@Override
		public List<CartandBuy> orderList(String s_id) {
			return sellerDao.selectBySellerOrder(s_id);
		}
		
		// 전체 요청 내역
		@Override
		public List<CartandBuy> orderAllList(String s_id) {
			return sellerDao.selectBySellerAllOrder(s_id);
		}
		
		// 판매물 승인 내역 갯수
		@Override
		public List<ProductVO> accCount(String s_id) {
			return sellerDao.selectByProductAccCount(s_id);
		}
		
		// 판매 완료 5건
		@Override
		public List<CartandBuy> completeList(String s_id) {
			return sellerDao.selectBySellerComplete(s_id);
		}
		
		// 전체 판매 완료 내역
		@Override
		public List<CartandBuy> completAllList(String s_id) {
			return sellerDao.selectBySellerAllComplete(s_id);
		}
		
		@Override
		public List<ProductVO> accList(String s_id) {
			return sellerDao.selectByProdcutAccList(s_id);
		}
		
		@Override
		public List<ProductVO> accAllList(String s_id) {
			return sellerDao.selectByProductAccAllList(s_id);
		}

	@Override
	public List<ProductVO> readAllProductByPcate1(String p_cate1) {
		
		return sellerDao.selectAllProductByPcate1(p_cate1);
	}

	@Override
	public List<ProductVO> readAllProductByPcate2(String p_cate2) {
		
		return sellerDao.selectAllProductByPcate2(p_cate2);
	}
	
	@Override
	public boolean isAccConf(String s_id, String s_pw) {
		return sellerDao.isAccConf(s_id, s_pw);
	}

	@Override
	public int updateSellerInfo(SellerVO vo) {
		return sellerDao.updateSellerInfo(vo);
	}
	
	@Override
	public int deleteSeller(String s_id) {
		return sellerDao.deleteSeller(s_id);
	}
	
	@Override
	public SellerVO findId(SellerVO vo) {
		return sellerDao.findId(vo);
	}
	
	@Override
	public SellerVO findPw(SellerVO vo) {
		return sellerDao.findPw(vo);
	}
	
	@Override
	public int updatePw(SellerVO vo) {
		return sellerDao.updatepw(vo);
	}
	
} // end class SellerServiceImpl
