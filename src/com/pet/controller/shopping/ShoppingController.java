package com.pet.controller.shopping;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pet.model.product.Cart;

@Controller
public class ShoppingController {
	//장바구니 담기!!
	@RequestMapping(value="/shop/cart/regist",method=RequestMethod.POST)
	public String regist(Model model, Cart cart, HttpSession session) {
		//넘겨받은 상품에 대한 파라미터 정보를 VO에 담은 후 다시 
		//세션에 담자!! 세션에 담았으므로 세션종료까지는 데이터를 유지
		//할 수 있다..
		System.out.println("부여받은 세션 아이디는"+session.getId());
		cart.setEa(1);//상세보기에서 장바구니에 담을때는 1개가 된다!!
		
		List<Cart> cartList =(List)session.getAttribute("cartList");
		if(cartList==null) {
			//장바구니에 담을 리스트가 최초라면..
			cartList = new ArrayList<Cart>();
			session.setAttribute("cartList", cartList);
		}
		cartList.add(cart);//장바구니 리스트에 상품 추가!!
		model.addAttribute("msg", "장바구니에 "+cart.getProduct_name()+" 담겼습니다");
		model.addAttribute("url", "/shop/cart/list");
		return "view/message";
	}
	
	//장바구니 목록 가져오기!!
	@RequestMapping(value="/shop/cart/list",method=RequestMethod.GET)
	public String getList() {
		return "shop/cart";
	}
}











