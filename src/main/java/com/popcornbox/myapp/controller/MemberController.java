package com.popcornbox.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.popcornbox.myapp.common.Code;
import com.popcornbox.myapp.member.dto.MemberDTO;
import com.popcornbox.myapp.member.dto.PasswdDTO;
import com.popcornbox.myapp.member.service.MemberSvc;

@Controller
@RequestMapping("/member")
public class MemberController {
private final static Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberSvc memberSvc;
	
	@ModelAttribute
	public void initData(Model model) {
		//성별
		List<Code> gender=new ArrayList<Code>();
		gender.add(new Code("남","남자"));
		gender.add(new Code("여","여자"));
		
		model.addAttribute("gender",gender);
	}
	
	//회원가입 양식
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm(Model model) {
		logger.info("memberJoinForm() 호출");
		model.addAttribute("mdto", new MemberDTO());
		
		return "/member/memberJoinForm";
	}
	
	//회원가입 처리
	@PostMapping("/memberJoin")
	public String memberJoin(@Valid @ModelAttribute("mdto") MemberDTO memberDTO,
													 BindingResult result, Model model) {
		logger.info("memberJoin() 호출");
		logger.info(memberDTO.toString());
		
		String viewName=null;
		
		if(result.hasErrors()) {
			logger.info("회원가입시 오류발생");
			logger.info(result.toString());
			return "/member/memberJoinForm";
		}
		
		//회원중복체크
		if(memberSvc.getMember(memberDTO.getId())!=null) {
			viewName="/member/memberJoinForm";
			model.addAttribute("svr_msg", "중복된 아이디입니다.");
			return viewName;
		}
		
		//회원등록
		int cnt=memberSvc.join(memberDTO);
		if(cnt==1) {
			viewName="redirect:/";
		}else {
			viewName="/member/memberJoinForm";
		}
		
		return viewName;
	}
	
	//회원관리페이지
	@GetMapping("memberInfo/{id:.+}")
	public String memberInfo(@PathVariable String id,Model model) {
		logger.info("memberInfo()호출");
		MemberDTO memberDTO=memberSvc.getMember(id);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("id", id);
		
		return "/member/memberInfo";
	}

	
	//회원수정양식
	@GetMapping("/memberModifyForm/{id:.+}")
	public String memberModifyForm(@PathVariable String id, Model model) {
		logger.info("id:"+id);
		
		MemberDTO memberDTO=memberSvc.getMember(id);
		model.addAttribute("memberDTO",	memberDTO);
		/* logger.info("memberDTO:"+memberDTO); */
		
		return "/member/memberModifyForm";
	}
	
	//회원수정처리
	@PostMapping("/memberModify")
	public String memberModify(MemberDTO memberDTO,HttpSession session) {
		
		int result=memberSvc.modify(memberDTO);
		
		if(result==1) {
			
		}
		
		return "/member/getMember"; //나중에 다시 수정
	}
	
	//회원 상세정보 조회
	@GetMapping("/getMember/{id:.+}")
	public String getMember(@PathVariable String id, Model model) {
		logger.info("id:"+id);
		MemberDTO memberDTO=memberSvc.getMember(id);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("id", id);
		return "/member/getMember";
		
	}
	
	//회원 비밀번호 변경 양식
	@GetMapping("/changePwForm")
	public void changePw(Model model) {
		model.addAttribute("passwdDTO", new PasswdDTO());
	}
	
	//회원 비밀번호변경 처리
	@PostMapping("/changePw")
	public String changePw(@Valid @ModelAttribute("passwdDTO") PasswdDTO passwdDTO, BindingResult result) {
		
		//바인딩 오류 시
		if(result.hasErrors()) {
			logger.info(result.toString());
			return "/member/changePwForm";
		}
		
		//비밀번호 변경
		int cnt=memberSvc.changePw(passwdDTO);
		
		if(cnt==1) {
			return "redirect:/member/getMember";
			
		}
		return "/member/changePwForm";
	}
	
	//회원탈퇴화면(회원용)
	@GetMapping("/memberDeleteForm/{id:.+}")
	public String memberDeleteForm(@PathVariable String id,Model model) {

		MemberDTO memberDTO=memberSvc.getMember(id);
		model.addAttribute("memberDTO", memberDTO);
		logger.info("memberDeleteForm() 호출");
		return "/member/memberDeleteForm";
	}
	
	//회원탈퇴처리(회원용)
	@PostMapping("/memberDelete")

	public String memberDelete(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session) {
		
		int result=memberSvc.delete(id,pw);
		logger.info("회원탈퇴처리결과:"+result);
		
		if(result == 1) {
			session.invalidate();
			return "redirect:/";
						
		}
		
		return "/member/memberDeleteForm";
	}
}
