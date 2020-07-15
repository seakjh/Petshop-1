package com.pet.model.order;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}






