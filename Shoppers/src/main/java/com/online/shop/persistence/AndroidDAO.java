package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.AndroidVO;

public interface AndroidDAO {
	public abstract int insert(AndroidVO vo);
	public abstract List<AndroidVO> select(String p_no);
}
