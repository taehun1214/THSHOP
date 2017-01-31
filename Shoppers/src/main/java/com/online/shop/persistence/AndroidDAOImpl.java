package com.online.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.AndroidVO;

@Repository
public class AndroidDAOImpl implements AndroidDAO {
	
	private static final String NAMESPACEM = "com.online.shop.AndroidMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insert(AndroidVO vo) {
		return sqlSession.insert(NAMESPACEM+"insert-reply-android", vo);
	}

	@Override
	public List<AndroidVO> select(String p_no) {
		return sqlSession.selectList(NAMESPACEM+"select-reply-android", p_no);
	}
	

}
