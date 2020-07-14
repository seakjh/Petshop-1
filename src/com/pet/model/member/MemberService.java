package com.pet.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.exception.DMLException;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public void insert(Member member) throws DMLException{
		memberDAO.insert(member);
	}
}







