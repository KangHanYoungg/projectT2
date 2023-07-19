package com.korea.k2.openApi;

import java.util.List;

public interface CompanyDao {
	
	void insert(CompanyVO vo);
	void EVinsert(EvSearchVO vo);
	
	CompanyVO selectOne(CompanyVO vo);
	List<CompanyVO> selectAll(CompanyVO vo);
	
	EvSearchVO selectOneEv(EvSearchVO vo);
	List<EvSearchVO> selectAllEv(EvSearchVO vo);
}
