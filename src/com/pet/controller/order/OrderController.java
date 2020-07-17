package com.pet.controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pet.controller.common.Pager;
import com.pet.domain.OrderSummary;
import com.pet.model.order.OrderService;

//관리자의 주문 처리 
@Controller
@RequestMapping("/admin/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private Pager pager;
	
	//목록보기
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String selectAll(Model model, HttpServletRequest request) {
		System.out.println("주문 목록이 궁금해?");
		List orderList = orderService.selectAll();
		pager.init(orderList, request);
		model.addAttribute("orderList", orderList);
		model.addAttribute("pager", pager);
		
		return "admin/order/list";
	}
	
	//주문상세보기 요청 처리 
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String select(Model model, @RequestParam int order_summary_id) {
		OrderSummary orderSummary=orderService.select(order_summary_id);
		
		System.out.println("orderSumamry " + orderSummary);
		
		List detailList=orderService.getOrderDetail(order_summary_id);

		model.addAttribute("detailList", detailList);
		model.addAttribute("orderSummary", orderSummary);
		
		return "admin/order/detail";
	}
	
	//주문삭제 
	@RequestMapping(value="/del", method=RequestMethod.GET)
	public String delete() {
		return null;
	}
	
	//주문수정 
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit() {
		return null;
	}
	
	//주문등록
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String regist() {
		return null;
	}
	
}
