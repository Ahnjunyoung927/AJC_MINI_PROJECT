package com.kh.spring.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.spring.exception.UserIdNotFoundException;
import com.kh.spring.member.model.dao.MemberMapper;
import com.kh.spring.member.model.dto.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final PasswordEncoder passwordEncoder;
	private final MemberValidator validator;
	private final MemberMapper mapper;
	
	@Override
	public void signup(MemberDTO member) {
		// 유효값 검증
		validator.validatedMember(member);
		
		//log.info("값이 들어오나? : {}", member);
		
		// 아이디 중복체크
		// 어디에 할 지 고민해보자
		
		// 비밀번호 암호화(with 인코더) -- memberPwd에 set하고 member 매퍼에 전달
		
		String encPwd = passwordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		log.info(member.getMemberId());
		log.info(encPwd);
		mapper.signup(member);
	
	}
	
	public MemberDTO login(MemberDTO member) {
		
		//log.info("사용자가 입력한 비밀번호 : {}", member.getMemberPwd());
		
		MemberDTO loginMember = mapper.login(member);
		log.info("사용자가 입력한 비밀번호 : {}", member.getMemberPwd());
		log.info("암호화된 비밀번호 : {}", loginMember.getMemberPwd());
		return validateLoginMember(loginMember, member.getMemberPwd());
		
	}
	
	private MemberDTO validateLoginMember(MemberDTO loginMember, String memberPwd) {
		if(loginMember == null) {
			throw new UserIdNotFoundException("아이디 또는 비밀번호를 확인해주세요.");
		}
		
		if(passwordEncoder.matches(memberPwd, loginMember.getMemberPwd())) {
			return loginMember;
		}
		return null;
	}
}
