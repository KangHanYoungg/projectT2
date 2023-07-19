package com.korea.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.k2.shop.MemberService;
import com.korea.k2.shop.MemberVO;

@Controller
public class ShopController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/insert.do")
	String insert(Model model,MemberVO vo) {	
		System.out.println(" ===>service.insert(vo) "+vo);
		String password=BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
		vo.setPassword(password);
		service.insert(vo);
		return "/selectAll.do";
	}
	
	@RequestMapping("/update.do")
	String update(Model model,MemberVO vo) {	
		service.update(vo);
		return "/selectAll.do";
	}
	
	@RequestMapping("/custno.do")
	String custno(Model model) {	
		model.addAttribute("custno",service.custno());
		return "member/member_insert.jsp";
	}
	
	@RequestMapping("/selectAll.do")
	String selectAll(Model model,MemberVO vo) {		
		model.addAttribute("li",service.selectAll(vo));
		return "member/member_selectAll.jsp";
	}
	
	@RequestMapping("/selectOne.do")
	String selectOne(MemberVO vo,HttpSession session) {		
		session.setAttribute("m",service.selectOne(vo));
		return "member/member_selectOne.jsp";
	}
	
	@RequestMapping("/moneyAll.do")
	String moneyAll(Model model,MemberVO vo) {		
		model.addAttribute("li",service.moneyAll(vo));
		return "member/money_selectAll.jsp";
	}
   @RequestMapping("/IdCk.do")
   void IdCk(HttpServletResponse response ,MemberVO vo ) throws Exception   {
    
	    PrintWriter out=response.getWriter();
	    String str = service.idck(vo);
	    System.out.println("===> str:" + str);
	    
	    if (str==null) {
	      if (vo.getId()!="") {	
	        out.print("T");
	      }
	    }else {
	      out.print("F");	
	    }
   
   }

}
