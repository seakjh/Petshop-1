package com.pet.model.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.domain.Product;
import com.pet.exception.DMLException;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(Product product) throws DMLException{
		int result=sessionTemplate.insert("Product.insert", product);
		if(result==0) {
			throw new DMLException("상품이 등록되지 않았습니다");
		}
	}
	

	//모든 상품 가져오기 
	public List selectAll() {
		return sessionTemplate.selectList("Product.All");
	}
	
	//관리자모드에서의 기획상품과 같이 가져오기 
	public List selectAllJoin() {
		return sessionTemplate.selectList("EventProduct.selectJoin");
	}
	
	public Product select(int product_id) {
		return sessionTemplate.selectOne("Product.byId", product_id);
	}
	
	public void delete(int product_id) throws DMLException{
		int result=sessionTemplate.delete("Product.delete",product_id);
		if(result==0) {
			throw new DMLException("상품이 삭제처리 되지 않았습니다");
		}
	}
	public void update(Product product) {
		int result=sessionTemplate.update("Product.update", product);
		if(result==0) {
			throw new DMLException("수정되지 않았습니다");
		}
	}

}















