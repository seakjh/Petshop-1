package com.pet.model.order;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.domain.OrderDetail;
import com.pet.exception.DMLException;

@Repository
public class OrderDetailDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(OrderDetail orderDetail) throws DMLException{
		int result=sessionTemplate.insert("OrderDetail.insert", orderDetail);
		if(result==0) {
			throw new DMLException(orderDetail.getProduct().getProduct_name()+"이 등록되지 않았습니다");
		}
	}
}








