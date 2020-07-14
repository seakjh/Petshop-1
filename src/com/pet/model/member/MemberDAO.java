package com.pet.model.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.exception.DMLException;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(Member member) throws DMLException{
		int result = sessionTemplate.insert("Member.insert", member);
		if(result ==0) {
			throw new DMLException("회원가입에 실패하였습니다\n관리자에 문의하여 주세요");
		}
	}
	
}









