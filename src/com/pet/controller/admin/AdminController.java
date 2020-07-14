package com.pet.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pet.model.admin.Admin;
import com.pet.model.admin.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	public ModelAndView loginCheck(Admin admin, HttpServletRequest request) {
		Admin result=adminService.loginCheck(admin);
		
		//로그인 인증을 성공한 사람은, 브라우저를 닫을때까지 데이터를 유지할 수 있는
		//효과를 부여해줘야 한다...HttpSession 내장객체는 session
		ModelAndView mav = new ModelAndView();
		if(result!=null) {
			System.out.println("결과 id : "+result.getId());
			HttpSession session=request.getSession();
			session.setAttribute("admin", result);//회원 정보 저장!!!
			//관리자 모드 메인 페이지 보여줌
			mav.setViewName("admin/index");
		}else {
			//욕 페이지 보여줌
			mav.setViewName("view/error");
			mav.addObject("msg", "로그인 정보가 올바르지 않습니다");
		}
		
		return mav;
	}
	
}










