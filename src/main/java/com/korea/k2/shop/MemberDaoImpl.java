package com.korea.k2.shop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(MemberVO vo) {
		mybatis.insert("MemberDao.INSERT",vo);
	}

	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		return mybatis.selectList("MemberDao.SELECTALL",vo);
	}

	@Override
	public int custno() {
		return mybatis.selectOne("MemberDao.CUSTNO");
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		return mybatis.selectOne("MemberDao.SELECTONE",vo);
	}

	@Override
	public void update(MemberVO vo) {
		mybatis.update("MemberDao.UPDATE",vo);
		
	}

	@Override
	public List<MemberVO> moneyAll(MemberVO vo) {
		return mybatis.selectList("MemberDao.MONEYALL",vo);
	}

	@Override
	public String idck(MemberVO vo) {
		return mybatis.selectOne("MemberDao.IDCK",vo);
	}

}
