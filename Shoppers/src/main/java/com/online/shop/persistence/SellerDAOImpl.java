package com.online.shop.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.CartandBuy;
import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

@Repository // 스프링에서 persistence Layer(DAO) 콤포넌트 빈 객체로 관리
public class SellerDAOImpl implements SellerDAO {

	private static final String NAMESPACE = 
			"com.online.shop.SellerMapper";
	private static final String NAMESPACEM = "com.online.shop.ShopMapper";
	private static final String NAMESPACES = "com.online.shop.MypageMapper";
	
	private static final Logger logger = 
			LoggerFactory.getLogger(SellerDAOImpl.class);
	
	// MyBatis 프레임워크를 사용하기 위해서 SqlSession 객체를 주입 받음
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVO> selectProductBySid(String s_id) {
		List<ProductVO> productList = sqlSession.selectList(NAMESPACE + ".selectProductBySid", s_id);
		
		logger.info("selectProductBySid() 호출: product size = " + productList.size());
		
		return productList;
	}

	@Override
	public ProductVO selectItemByPno(int p_no) {
		logger.info("selectItemByPno() 호출: p_no = " + p_no);
		
		ProductVO pVo = sqlSession.selectOne(NAMESPACE + ".selectItemByPno", p_no);
		
		return pVo;
	}

	@Override
	public List<OptionVO> selectOpByPno(int p_no) {
		logger.info("selectOpByPno() 호출: p_no = " + p_no);
		
		List<OptionVO> optionList = sqlSession.selectList(NAMESPACE + ".selectOpByPno", p_no);
		
		return optionList;
	}

	@Override
	public List<ImageVO> selectImgByPno(int p_no) {
		logger.info("selectImgByPno() 호출: p_no = " + p_no);
		
		List<ImageVO> imageList = sqlSession.selectList(NAMESPACE + ".selectImgByPno", p_no);
		
		return imageList;
	}

	@Override
	public int updateLogo(SellerVO sVo, String s_id) {
		logger.info("updateLogo() 호출: s_id = " + s_id);
		logger.info("updateLogo() 호출: s_logo = " + sVo.getS_logo());
		
		Map<String, Object> map = new HashMap<>();
		map.put("s_id", s_id);
		map.put("s_logo", sVo.getS_logo());
		
		return sqlSession.update(NAMESPACE + ".updateLogo", map);
	}

	@Override
	public SellerVO selectSellerInfo(String s_id) {
		logger.info("selectSellerInfo() 호출: s_id = " + s_id); 
		
		SellerVO sellerInfo = sqlSession.selectOne(NAMESPACE + ".selectSellerInfo", s_id);
		
		return sellerInfo;
	}

	@Override
	public int updateInfo(SellerVO sVo, String s_id) {
		logger.info("updateInfo() 호출: s_id = " + s_id);
		Map<String, Object> map = new HashMap<>();
		map.put("s_id", s_id);
		map.put("s_info", sVo.getS_info());
		return sqlSession.update(NAMESPACE + ".updateInfo", map);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////태훈
	// 회원가입 등록
		@Override
		public int insertSeller(SellerVO vo) {
			int result = sqlSession.insert(NAMESPACE + ".seller-insert", vo);
			return result;
		}
		/* ----------------------------------------------------------------------------------------------------- */
		// 회원가입 ID 중복검사 AJAX에 쓰임
		@Override
		public SellerVO selectCheckID(String s_id) {
			SellerVO vo = sqlSession.selectOne(NAMESPACE + ".select-by-s_id", s_id);
			return vo;
		}
		/* ----------------------------------------------------------------------------------------------------- */
		// 로그인 ??
		@Override
		public boolean isValidUser(String s_id, String s_pw) {
			Map<String, String> map = new HashMap<>();
			map.put("s_id", s_id);
			map.put("s_pw", s_pw);
			int result = sqlSession.selectOne(NAMESPACE + ".seller-login", map);
			if (result == 1) {
				return true;
			} else {
				return false;
			}
		}
		
		@Override
		public boolean isAccConf(String s_id, String s_pw) {
			Map<String, String> map = new HashMap<>();
			map.put("s_id", s_id);
			map.put("s_pw", s_pw);
			int result = sqlSession.selectOne(NAMESPACE + ".seller-login-s_acc", map);
			if (result == 1){
				return true;
			} else {
				return false;
			}
			
		}

		@Override
		public List<ProductVO> selectAllProduct() {
			List<ProductVO> productList = sqlSession.selectList(NAMESPACE + ".selectAllProduct");
			
			logger.info("selectAllProduct() 호출: product size = " + productList.size());
			
			return productList;
		}
		
		// 관리자 페이지 관련
		@Override
		public List<SellerVO> select() {
			List<SellerVO> list =  sqlSession.selectList(NAMESPACEM + ".sellerSelectAll");
			logger.info("select() 호출: " + list.size());
					
			return list;
		}
		
		@Override
		public int getNumOfRecords() {
			return sqlSession.selectOne(NAMESPACEM + ".sellerTotalCount") ;
		}
			
		@Override
		public List<SellerVO> select(PageCriteria cri) {
			return sqlSession.selectList(NAMESPACEM + ".sellerListPage", cri);
		}
		
		@Override
		public List<SellerVO> listSearch(SearchPageCriteria cri) { 
//			List<SellerVO> list = sqlSession.selectList(NAMESPACE + ".searchListSearch", cri);
//			System.out.println("list: "+ list.get(0).getS_id());
			return sqlSession.selectList(NAMESPACEM + ".searchListSearch", cri);
		}
		
		@Override
		public int listSearchCount(SearchPageCriteria cri) {
			return sqlSession.selectOne(NAMESPACEM + ".sellerListSearchCount", cri);
		}
		
		@Override
		public List<SellerVO> selectAccess() {
			return sqlSession.selectList(NAMESPACEM + ".selectAccess");
		}

		@Override
		public int update(int sno) {
			return sqlSession.update(NAMESPACEM + ".sellerAccept", sno);
		}
		//-------------------------------여기까지
		
		// 판매자 마이 페이지 --------------------------------------------------
		// 주문 요청 내역 갯수
		@Override
		public List<CartandBuy> selectBySellerOrderCount(String s_id) {
			return sqlSession.selectList(NAMESPACES + ".selectBySellerOrderCount", s_id);
		}

		// 최근 5건 주문 내역
		@Override
		public List<CartandBuy> selectBySellerOrder(String s_id) {
			return sqlSession.selectList(NAMESPACES + ".selectBySellerOrder", s_id);
		}
		
		// 전체 주문 요청 내역
		@Override
		public List<CartandBuy> selectBySellerAllOrder(String s_id) {
			return sqlSession.selectList(NAMESPACES +".selectBySellerAllOrder", s_id);
		}
		
		// 판매물 요청 갯수
		@Override
		public List<ProductVO> selectByProductAccCount(String s_id) {
			return sqlSession.selectList(NAMESPACES + ".selectBySellerProductAccessCount", s_id);
		}

		// 최근 5건 판매 완료 내역
		@Override
		public List<CartandBuy> selectBySellerComplete(String s_id) {
			return sqlSession.selectList(NAMESPACES + ".selectBySellerComplete", s_id);
		}
		
		// 모든 판매 완료 내역
		@Override
		public List<CartandBuy> selectBySellerAllComplete(String s_id) {
			return sqlSession.selectList(NAMESPACES + ".selectBySellerAllComplete", s_id);
		}
		
		@Override
		public List<ProductVO> selectByProdcutAccList(String s_id) {
			return sqlSession.selectList(NAMESPACES + ".selectBySellerProductAccessList", s_id);
		}
		
		@Override
		public List<ProductVO> selectByProductAccAllList(String s_id) {
			return sqlSession.selectList(NAMESPACES + ".selectBySellerProductAccessAllList", s_id);
		}
		
		// ---------------------------------------------------여기까지


		@Override
		public List<ProductVO> selectAllProductByPcate1(String p_cate1) {
			List<ProductVO> productListByPcate1 = sqlSession.selectList(NAMESPACE + ".selectAllProductByPcate1", p_cate1);
			
			logger.info("selectA;;ProductByPcate1() 호출: product size = " + productListByPcate1.size());
			
			return productListByPcate1;
		}

		@Override
		public List<ProductVO> selectAllProductByPcate2(String p_cate2) {
			List<ProductVO> productListByPcate2 = sqlSession.selectList(NAMESPACE + ".selectAllProductByPcate2", p_cate2);
			
			logger.info("selectA;;ProductByPcate2() 호출: product size = " + productListByPcate2.size());
			
			return productListByPcate2;
		}
		
		@Override
		public int updateSellerInfo(SellerVO vo) {
			System.out.println("imple vo");
			int result = sqlSession.update(NAMESPACE+".update-sellerInfo", vo);
			System.out.println("imple 결과:"+result);
			return result;
		}
		
		@Override
		public int deleteSeller(String s_id) {
			
			return sqlSession.update(NAMESPACE+".delete-seller", s_id);
		}
		
		@Override
		public SellerVO findId(SellerVO vo) {
			
			return sqlSession.selectOne(NAMESPACE+".seller-find-id", vo);
		}
		@Override
		public SellerVO findPw(SellerVO vo) {
			
			return sqlSession.selectOne(NAMESPACE+".seller-find-pw", vo);
		}
		@Override
		public int updatepw(SellerVO vo) {
			
			return sqlSession.update(NAMESPACE+".update-seller-pw", vo);
		}
} // end class SellerDAOImpl
