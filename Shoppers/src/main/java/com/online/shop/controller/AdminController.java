package com.online.shop.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.CartandBuy;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;

import com.online.shop.service.BuyerService;
import com.online.shop.service.ProductService;
import com.online.shop.service.SellerService;
import com.online.shop.domain.BuyVO;
import com.online.shop.persistence.AdminDAO;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// Serivce 객체 주입
	@Autowired
	private SellerService sellerservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private BuyerService buyerservice;
	@Autowired
	private AdminDAO dao;
	

	// 메인 jsp 콘트롤러
	@RequestMapping(value = "/admin/seller_admin_main", method = RequestMethod.GET)
	public void listSeller(Model model) {
		logger.info("listSeller() 호출...");

		List<SellerVO> list = sellerservice.read();
		model.addAttribute("sellerList", list);

	}
	
	// 메인 jsp 콘트롤러
	/*	@RequestMapping(value = "/admin/admin_bootstrap", method = RequestMethod.GET)
		public void listSellerbootstrap(Model model) {
			logger.info("listSeller() 호출...");

			List<SellerVO> list = sellerservice.read();
			model.addAttribute("sellerList", list);

		}*/ 

	// 관리자 마이페이지 콘트롤러
	@RequestMapping(value = "/admin/admin_mypage", method = RequestMethod.GET)
	public void adminMypage(Model model) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		String today = sdf.format(date);
		
		//List<BuyVO> list = dao.selectByBuy();
		//배송완료인 내역만 뽑아옴 buy테이블 cart테이블 모두를 통합함
		List<CartandBuy> list =dao.selectBybuymain();
		
		//주문요청인상태 내역만 뽑아옴
		//List<BuyVO> list2 = dao.selectByBuy2();
		List<CartandBuy> list2 =dao.selectBybuymain2();
		
		//전체주문요청내역 뽑아옴
		//List<BuyVO> list3 = dao.selectByBuyRequest();
		PageCriteria c = new PageCriteria();
		c.setPage(1);
		List<CartandBuy> list3 =dao.selectBysubr(c);
		
		List<BuyVO> list4 = dao.selecyByBuyToday(today);
		
		List<SellerVO> list5 = sellerservice.searchAccess();
		List<ProductVO> list6 = productservice.selectAcc();
		List<SellerVO> list7 = sellerservice.read();
		
		 
		model.addAttribute("listBuyVO", list);
		model.addAttribute("list2", list2);
		model.addAttribute("reqSize", list3.size());
		model.addAttribute("listBuyReq", list3);
		model.addAttribute("buyTodaySize", list4.size());
		model.addAttribute("buyToday", list4);
		
		model.addAttribute("accSize", list5.size());
		model.addAttribute("listAcc", list5);
		model.addAttribute("pSize", list6.size());
		model.addAttribute("pAcc", list6);
		model.addAttribute("sel_id", list7);
		

	}
	
	// 주문 요청 내역 콘트롤러
	@RequestMapping(value="/admin/buyr", method = RequestMethod.GET)
	public void adminBuyReq(Integer page, Model model) {
		logger.info("page : " + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		List<CartandBuy> list =dao.selectBysubr(c);
		model.addAttribute("list", list);
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(dao.getNumOfRecordsBuyr());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
	}
	
	// 전체 판매 내역 콘트롤러
	@RequestMapping(value="/admin/buyf", method = RequestMethod.GET)
	public void adminBuyfin(Integer page, Model model) {
		logger.info("page : " + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		List<CartandBuy> list = dao.selectBysubf();
		logger.info("list size: " + list.size());
		model.addAttribute("list", list);
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(dao.getNumOfRecordsBuyf());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
	}

	// 판매자 가입 승인 요청 내역 콘트롤러
	@RequestMapping(value = "/admin/seller_accept_list", method = RequestMethod.GET)
	public void acceptPage(Integer page, Model model) {
		logger.info("page : " + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		List<SellerVO> list = sellerservice.read(c);
		
		model.addAttribute("sellerList", list);
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(sellerservice.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
	
	}

	// 판매물 등록 승인 콘트롤러
	@RequestMapping(value = "/admin/seller_accept_product_list", method = RequestMethod.GET)
	public void acceptProductPage(Integer page, Model model) {		
		logger.info("page : " + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		List<ProductVO> list = productservice.read(c);

		/*List<SellerVO> list1 = sellerservice.read(c);*/
		
		logger.info("list size: " + list.size());
		/*logger.info("list1 size: " + list1.size());*/

		
		model.addAttribute("productList", list);
//		model.addAttribute("sellerList", list1);
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(productservice.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
		
	}

	// 구매자 회원 목록 콘트롤러(페이징 페이지)
	@RequestMapping(value="/admin/buyer_list", method = RequestMethod.GET)
	public void listAll(Integer page, Model model) {
		logger.info("listPage(): page=" + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		List<BuyerVO> list = buyerservice.read(c);
		
		model.addAttribute("buyerList", list);
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(buyerservice.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
				
	}
	
	// 얘는 통계;;;
	@RequestMapping(value="/admin/total", method = RequestMethod.GET)
	public void adminBuyTotal(Model model) {
	}
	
	
	//판매자 승인 요청 콘트롤러
	@RequestMapping(value="/admin/sellerAcc", method=RequestMethod.GET)
	public void updateSellerAcc(int s_no, HttpServletResponse response) throws IOException{
		logger.info("updateAcc 실행");
		
		int result = sellerservice.updateAcc(s_no);

		if (result==1){
			logger.info("승인 업데이트 성공");
			
			response.getWriter().print(1);	
		}	
			
	}
	
	//판매물 승인 요청 콘트롤러
		@RequestMapping(value="/admin/productAcc", method=RequestMethod.GET)
		public void updateProductAcc(int p_no, HttpServletResponse response) throws IOException{
			logger.info("updateAcc 실행");
			
			int result = productservice.productAcc(p_no);
			

			if (result==1){
				logger.info("승인 업데이트 성공");
				

				response.getWriter().print(1);	
			}	
				
		}
	
	
}
