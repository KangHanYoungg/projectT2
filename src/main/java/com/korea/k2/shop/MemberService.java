package com.korea.k2.shop;

import java.util.List;

public interface MemberService {
	void insert(MemberVO vo);
	void update(MemberVO vo);
	
	MemberVO selectOne(MemberVO vo);
	List<MemberVO> selectAll(MemberVO vo);
	List<MemberVO> moneyAll(MemberVO vo);
	int custno();
	String idck(MemberVO vo);
}
