package com.korea.k2.openApi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDao dao;
	
	@Override
	public void insert(CompanyVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<CompanyVO> selectAll(CompanyVO vo) {
		return dao.selectAll(vo);
	}

	@Override
	public void EVinsert(EvSearchVO vo) {
		dao.EVinsert(vo);
		
	}

	@Override
	public List<EvSearchVO> selectAllEv(EvSearchVO vo) {
		return dao.selectAllEv(vo);
	}

	@Override
	public CompanyVO selectOne(CompanyVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public EvSearchVO selectOneEv(EvSearchVO vo) {
		return dao.selectOneEv(vo);
	}



}
