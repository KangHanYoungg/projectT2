package com.korea.k2.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Override
	public void insert(MemberVO vo) {
		dao.insert(vo);	
	}

	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		return dao.selectAll(vo);
	}

	@Override
	public int custno() {
		return dao.custno();
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public void update(MemberVO vo) {
		dao.update(vo);
		
	}

	@Override
	public List<MemberVO> moneyAll(MemberVO vo) {
		return dao.moneyAll(vo);
	}

	@Override
	public String idck(MemberVO vo) {
		return dao.idck(vo);
	}

}
