package com.korea.k2.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korea.k2.shop.MemberVO;
@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDao dao;
	
	@Override
	public MemberVO loginOn(MemberVO vo) {
		return dao.loginOn(vo);
	}

}
