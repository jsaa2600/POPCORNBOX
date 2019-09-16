package com.popcornbox.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.popcornbox.myapp.login.service.LoginSvc;
import com.popcornbox.myapp.member.dto.MemberDTO;

@Controller
@RequestMapping("/login")
public class LoginController {

	private final static Logger logger=LoggerFactory.getLogger("LoginController.class");
	
	@Inject
	private LoginSvc loginSvc;
	
	//로그인화면양식
	@GetMapping("/loginForm")
	public String login() {
		logger.info("loginForm() 호출");
		return "/login/loginForm";
	}
	
	//로그인처리
	@PostMapping("/loginOk")
	public String loginOk(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session) {
		
		logger.info("loginOk() 호출");
		logger.info("id="+id);
		logger.info("pw="+pw);
		
		//1)회원유무
		int result=loginSvc.login(id, pw);
		//2)세션에 회원정보 저장
		if(result==1) {
			MemberDTO mdto=loginSvc.getMember(id, pw);
			session.setAttribute("user", mdto);
			logger.info("로그인 성공: "+mdto.getId());
		}else {
			return "/login/loginForm";
		}

		return "redirect:/";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		logger.info("로그아웃");
		return "redirect:/";
	}
}
