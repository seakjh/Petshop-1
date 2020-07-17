package com.pet.model.event;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.domain.Event;
import com.pet.domain.EventProduct;
import com.pet.exception.DMLException;

@Repository
public class EventProductDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public List selectAll() {
		return sessionTemplate.selectList("EventProduct.selectAll");
	}
	public void insert(EventProduct eventProduct) throws DMLException{
		int result = sessionTemplate.insert("EventProduct.insert", eventProduct);
		if(result ==0) {
			throw new DMLException("이벤트 상품 등록에 실패하였습니다");
		}
	}
}
