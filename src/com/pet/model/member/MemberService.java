package com.pet.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.domain.Member;
import com.pet.exception.DMLException;
import com.pet.exception.DataNotFoundException;

@Service
public class MemberService {
	//DAO는 데이터영속성(어떤 종류의 db를 사용하는지에 대한) 
	//기술에 대한 의존성을 약화시켜야 한다..
	//사실은 DAO는 인터페이스를 둬야 하고, 이 인터페이스를 구현한 객체를
	//DI로 주입받아야 한다.
	@Autowired
	private MemberDAO memberDAO;
	
	public void insert(Member member) throws DMLException{
		memberDAO.insert(member);
	}
	
	public Member loginCheck(Member member) throws DataNotFoundException{
		Member obj=memberDAO.loginCheck(member);
		return obj;
	}
}







