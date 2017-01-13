package com.online.shop.controller;

import java.util.List;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.BuyVO;
import com.online.shop.domain.CartandBuy;
import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;
import com.online.shop.pageutil.SearchPageCriteria;
import com.online.shop.persistence.AdminDAO;
import com.online.shop.service.BuyerService;
import com.online.shop.service.ProductService;
import com.online.shop.service.SellerService;

@Controller
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private BuyerService service;
	@Inject
	private SellerService sellerservice;
	@Inject
	private ProductService productservice;
	@Inject
	private AdminDAO buyrdao;
	
	
	// 구매자 회원 목록 콘트롤러(검색 기능 페이지)
	@RequestMapping(value="/admin/buyer_searchlist", method= RequestMethod.GET)
	public void searchList(@ModelAttribute("cri") SearchPageCriteria cri, Model model, Integer page){
		logger.info(cri.toString());
		logger.info("cri page=" + cri.getPage());
		logger.info("cir perPage=" + cri.getPerPage());
		logger.info("page:" + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(service.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);

		model.addAttribute("buyerList", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCrieria(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		pageMaker.setPageData();
		
		model.addAttribute("searchpageMaker", pageMaker);
	}
	
	// 판매자 가입 승인 요청 페이지 검색 컨트롤러
	@RequestMapping(value="/admin/seller_accept_searchlist", method= RequestMethod.GET)
	public void sellersearchList(@ModelAttribute("cri") SearchPageCriteria cri, Model model, Integer page){
		logger.info(cri.toString());
		logger.info("cri page=" + cri.getPage());
		logger.info("cir perPage=" + cri.getPerPage());
		logger.info("page:" + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(sellerservice.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);

		List<SellerVO> testlist = sellerservice.listSearchCriteria(cri);
		model.addAttribute("sellerList", testlist);

		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCrieria(cri);
		pageMaker.setTotalCount(sellerservice.listSearchCount(cri));
		pageMaker.setPageData();
		
		model.addAttribute("searchpageMaker", pageMaker);
		
		
	}
	
	@RequestMapping(value="/admin/seller_accept_product_searchlist", method= RequestMethod.GET)
	public void searchProductList(@ModelAttribute("cri") SearchPageCriteria cri, Model model, Integer page){
		logger.info(cri.toString());
		logger.info("cri page=" + cri.getPage());
		logger.info("cir perPage=" + cri.getPerPage());
		logger.info("page:" + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		} 
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(productservice.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);

		model.addAttribute("productList", productservice.listSearchCriteria(cri));
		model.addAttribute("sellerList", sellerservice.listSearchCriteria(cri));
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCrieria(cri);
		pageMaker.setTotalCount(productservice.listSearchCount(cri));
		pageMaker.setPageData();
		
		model.addAttribute("searchpageMaker", pageMaker);
	}
	
	@RequestMapping(value="/admin/buyr_searchlist", method= RequestMethod.GET)
	public void searchBuyrList(@ModelAttribute("cri") SearchPageCriteria cri, Model model, Integer page){
		logger.info(cri.toString());
		logger.info("cri page=" + cri.getPage());
		logger.info("cir perPage=" + cri.getPerPage());
		logger.info("page:" + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		} 
				
		List<CartandBuy> list = buyrdao.selectBysubr(cri);
		model.addAttribute("list", list);
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(buyrdao.getNumOfRecordsBuyr());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCrieria(cri);
		pageMaker.setTotalCount(buyrdao.getNumOfSearchRecordsBuyr(cri));
		pageMaker.setPageData();
		
		model.addAttribute("searchpageMaker", pageMaker);
	}

}
