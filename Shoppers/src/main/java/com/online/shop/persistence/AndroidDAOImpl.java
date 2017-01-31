package com.online.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.online.shop.domain.AndroidVO;

public class AndroidDAOImpl implements AndroidDAO {
	
	
	private static final String NAMESPACEM = "android";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insert(AndroidVO vo) {
		return sqlSession.insert(NAMESPACEM+"insert-reply-android", vo);
	}

	@Override
	public List<AndroidVO> select(String p_no) {
		return sqlSession.selectList(NAMESPACEM+"select-by-p_no", p_no);
	}
	

}
