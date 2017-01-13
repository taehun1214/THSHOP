package com.online.shop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.online.shop.domain.CartandBuy;
import com.online.shop.domain.ProductVO;
import com.online.shop.service.SellerService;

@RestController
@RequestMapping(value="/sellerid")
public class SellerMypageRESTController {
	private static final Logger logger = LoggerFactory.getLogger(SellerMypageRESTController.class);
	
	@Autowired 
	private SellerService sellerservice;
	
	@RequestMapping(value="all/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>> readOrderCount(@PathVariable("id") String s_id){
		logger.info("s_id = " + s_id);
		List<CartandBuy> list = sellerservice.orderCount(s_id);
		logger.info("List.count : " + list.get(0).getCount());
		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	} 
	
	@RequestMapping(value="all2/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>> readOrder(@PathVariable("id") String s_id){
		logger.info("s_id = " + s_id);
		List<CartandBuy> list = sellerservice.orderList(s_id);

		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	} 
	
	@RequestMapping(value="all3/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>> readAllOrder(@PathVariable("id") String s_id){
		logger.info("s_id = " + s_id);
		List<CartandBuy> list = sellerservice.orderAllList(s_id);
		logger.info("List.count : " + list.get(0).getCount());
		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	}
	
	@RequestMapping(value="all4/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<ProductVO>> readProductAcc(@PathVariable("id") String s_id){
		logger.info("s_id = " + s_id);
		List<ProductVO> list = sellerservice.accCount(s_id);
		logger.info("List.count : " + list.get(0).getCount());
		
		ResponseEntity<List<ProductVO>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	} 
	
	@RequestMapping(value="all5/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>> readComplete(@PathVariable("id") String s_id){
		logger.info("s_id = " + s_id);
		List<CartandBuy> list = sellerservice.completeList(s_id);

		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	}
	
	@RequestMapping(value="all6/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>> readAllComplete(@PathVariable("id") String s_id){
		logger.info("s_id = " + s_id);
		List<CartandBuy> list = sellerservice.completAllList(s_id);
		logger.info("List.count : " + list.get(0).getCount());
		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	}
	
	@RequestMapping(value="all7/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<ProductVO>> readProductAccList(@PathVariable("id") String s_id){
		logger.info("s_id = " + s_id);
		List<ProductVO> list = sellerservice.accList(s_id);

		
		ResponseEntity<List<ProductVO>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	} 
	
	@RequestMapping(value="all8/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<ProductVO>> readProductAccAllList(@PathVariable("id") String s_id){
		logger.info("s_id = " + s_id);
		List<ProductVO> list = sellerservice.accAllList(s_id);

		
		ResponseEntity<List<ProductVO>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	} 
	
	
}
