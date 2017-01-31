package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.AndroidVO;
import com.online.shop.persistence.AndroidDAO;

@Service
public class AndroidServiceImpl implements AndroidService {
	
	@Autowired // 스프링 프레임워크에서 관리하는 DAO 빈 객체를 주입
	private AndroidDAO dao;

	@Override
	public int insert(AndroidVO vo) {
		// TODO Auto-generated method stub
		return dao.insert(vo);
	}

	@Override
	public List<AndroidVO> select(String p_no) {
		// TODO Auto-generated method stub
		return dao.select(p_no);
	}
	
	

}
