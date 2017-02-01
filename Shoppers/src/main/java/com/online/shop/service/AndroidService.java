package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.AndroidVO;

public interface AndroidService {
	public abstract int insert(AndroidVO vo);
	public abstract List<AndroidVO> select(int p_no);
}
