package com.kh.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.dto.MemberDTO;
import com.kh.spring.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("members")
public class MemberController {
	
	private final MemberService memberService; // 매개변수 생성자만 있어서 91행에 초기화 없어도 final 조건 충족
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("loginForm")
	public String toLoginForm() {
		return "member/loginForm";
	}
	
	@PostMapping("/login")
	public ModelAndView login(MemberDTO member, HttpSession session, ModelAndView mv) {
		// log.info("사용자가 넘긴 아이디/비번 : {}", member);
		MemberDTO loginMember = memberService.login(member);
		log.info("관리자 값 : {}", loginMember.getAdminYn());
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("msg", "로그인 실패").setViewName("include/error_page");
		}
		return mv;
	}
	

}
