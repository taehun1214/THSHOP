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

import com.online.shop.service.BuyerService;

@RestController
@RequestMapping(value="/userid")
public class BuyerMypageRESTController { 
	private static final Logger logger = LoggerFactory.getLogger(BuyerMypageRESTController.class);
	
	@Autowired
	private BuyerService buyerservice;
	
	@RequestMapping(value="all/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>> readBuy(@PathVariable("id") String b_id){
		logger.info("b_id = " + b_id);
		List<CartandBuy> list = buyerservice.readM(b_id);
		logger.info("List.count : " + list.get(0).getCount());
		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	} 
	
	@RequestMapping(value="all2/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>> completeBuy(@PathVariable("id") String b_id){
		logger.info("b_id = " + b_id);
		List<CartandBuy> list = buyerservice.complete(b_id);
		logger.info("List.count : " + list.get(0).getCount());
		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	} 
	
	@RequestMapping(value="all3/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>>  readordermain(@PathVariable("id") String b_id){
		logger.info("b_id = " + b_id);
		List<CartandBuy> list = buyerservice.readmain(b_id);

		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	}
	
	@RequestMapping(value="all4/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>>  readCompletemain(@PathVariable("id") String b_id){
		logger.info("b_id = " + b_id);
		List<CartandBuy> list = buyerservice.readCompleteMain(b_id);

		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	}
	
	@RequestMapping(value="all5/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>>  readOrdermain(@PathVariable("id") String b_id){
		logger.info("b_id(all5) = " + b_id);
		List<CartandBuy> list2 = buyerservice.readordermain(b_id);
		
		logger.info("List.size : " + list2.size());
		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list2 != null){
			entity = new ResponseEntity<>(list2 , HttpStatus.OK);
		} 
		return entity;
	
	}
	
	@RequestMapping(value="all6/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<CartandBuy>>  readCompleteMain2(@PathVariable("id") String b_id){
		logger.info("b_id = " + b_id);
		List<CartandBuy> list = buyerservice.readCompleteMain2(b_id);
		logger.info("List.name : " + list.get(0).getB_name());
		
		ResponseEntity<List<CartandBuy>> entity = null;
		if (list != null){
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} 
		return entity;
	}
	
	
	
	
}
