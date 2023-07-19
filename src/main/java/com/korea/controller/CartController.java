package com.korea.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.korea.k2.cart.CartService;
import com.korea.k2.cart.CartVO;
import com.korea.k2.cart.OrderJumunseoVO;
import com.korea.k2.cart.OrderMoneyVO;

@Controller
public class CartController {

	@Autowired
	private CartService service;
	
	@RequestMapping("/cartOrder.do")
    String cartOrder ( 
     		@RequestParam String[] amount,
    		@RequestParam String[] cartId,
    		@RequestParam String[] custNo,
    		@RequestParam String[] productName,
    		@RequestParam String[] productId,
    		OrderMoneyVO vo) {
		
		vo.setOcustNo(Integer.parseInt(custNo[0]));
		System.out.println("==> vo : "+vo);
		service.insertOrderMoney(vo);
		
		int orderG=service.orderG(vo);
		int custNoStr=0;
		for(int i=0; i <cartId.length; i++) {
			OrderJumunseoVO  Ovo=new OrderJumunseoVO();
			custNoStr=Integer.parseInt(custNo[i]);
			Ovo.setCustNo(Integer.parseInt(custNo[i]));
			Ovo.setCartId(Integer.parseInt(cartId[i]));
			Ovo.setAmount(Integer.parseInt(amount[i]));
			Ovo.setProductId(Integer.parseInt(productId[i]));
			Ovo.setProductName(productName[i]);
			Ovo.setOrderG(orderG);
			service.insertOrderJumunseo(Ovo);
			System.out.println("==> vo : "+Ovo);
		}
	return "redirect:/cartList.do?custNo="+custNoStr;
	}
	
	@RequestMapping("/cartUpdate.do")
    String cartUpdate (
    		@RequestParam String[] amount,
    		@RequestParam String[] cartId,
    		@RequestParam String[] custNo,
    		@RequestParam String[] productId) {
		String custNoStr="";
		for(int i=0; i <cartId.length; i++) {
			CartVO  vo=new CartVO();
			custNoStr=custNo[i];
			vo.setCartId(Integer.parseInt(cartId[i]));
			vo.setAmount(Integer.parseInt(amount[i]));
		service.update(vo);	
		}
	return "redirect:/cartList.do?custNo="+custNoStr;
	}
	
	@RequestMapping("/cartInsert.do")
    String cartInsert ( CartVO  vo ) {
		System.out.println("=====>CartVO: "+vo);
		service.insert(vo);
	return "/cartList.do";
	}
	
	@RequestMapping("/cartList.do")
    String cartList ( CartVO  vo ,Model model) {
		List<CartVO> list=service.selectAll(vo);
		if(list.isEmpty()) {
			return "/cart/cart_List2.jsp";
		}else {
			model.addAttribute("li",service.selectAll(vo));
			return "/cart/cart_List.jsp";
		}
	}
	
	@RequestMapping("/cartDeleteOne.do")
    String cartDeleteOne ( CartVO  vo ) {
		service.delete(vo);
	return "/cartList.do";
	}
	
	@RequestMapping("/cartDeleteAll.do")
    String cartDeleteAll ( CartVO  vo ) {
		service.deleteAll(vo);
	return "/cartList.do";
	}
	
	@RequestMapping("/MoneyList.do")
    String MoneyList ( OrderMoneyVO  vo ,Model model) {	
		System.out.println("=====>MoneyList: "+vo);
		model.addAttribute("li",service.Moneyselect(vo));
		return "/cart/order_Money.jsp";
	}
	
}
