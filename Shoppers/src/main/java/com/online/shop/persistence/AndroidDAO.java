package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.AndroidVO;

public interface AndroidDAO {
	public abstract int insert(AndroidVO vo);
	public abstract List<AndroidVO> select(int p_no);
	public abstract int selectRno(int p_no);
	public abstract AndroidVO selectUpatedRepl(int r_no);
}
