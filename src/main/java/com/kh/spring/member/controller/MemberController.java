package com.kh.spring.member.controller;

import javax.servlet.http.HttpServletRequest;
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

@Controller
@RequestMapping("member")
@Slf4j
public class MemberController {

	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("enroll")
	  public String enrollPage() {
	    return "member/signup";
	  }
	
	
	
	
	
	@PostMapping("register")
	public String signup(MemberDTO member, HttpServletRequest request) {
		
		log.info("{}", member);
		memberService.signup(member);
		
		return "main";
	}
	
	
	
	
	
	
	@GetMapping("loginform")
	public String loginPage() {
		return "member/loginform"; // /WEB_INF/views/member/loginform.jsp
	}
	
	@PostMapping("login")
	public ModelAndView login(MemberDTO member, HttpSession session, ModelAndView mv) {
		//log.info("멤버 들어오나? : {}", member);
		
		MemberDTO loginMember = memberService.login(member);
		
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("msg", "아이디 또는 비밀번호를 확인해주세요.").setViewName("include/error_page");
		}
		
		return mv;
	}
	
	@GetMapping("logout")
	public String logout (HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:/";
	}
	
}
