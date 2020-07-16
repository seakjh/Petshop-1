package com.pet.model.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
	@Autowired
	private OrderSummaryDAO orderSummaryDAO;
	
	//모든 주문목록 가져오기 
	public List selectAll() {
		return orderSummaryDAO.selectAll();
	}
	
}





