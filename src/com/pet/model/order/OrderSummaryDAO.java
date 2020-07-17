package com.pet.model.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.domain.OrderSummary;
import com.pet.exception.DMLException;

@Repository
public class OrderSummaryDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	//주문정보 등록 
	public void insert(OrderSummary orderSummary) throws DMLException{
		int result=sessionTemplate.insert("OrderSummary.insert", orderSummary);
		if(result==0) {
			throw new DMLException("주문정보가 등록되지 않았습니다");
		}
	}
	
	//주문목록 가져오기 
	public List selectAll() {
		return sessionTemplate.selectList("OrderSummary.selectAll");
	}
	
	//주문정보 한건 가져오기 
	public OrderSummary select(int order_summary_id) {
		return sessionTemplate.selectOne("OrderSummary.select",order_summary_id);
		
	}
}











