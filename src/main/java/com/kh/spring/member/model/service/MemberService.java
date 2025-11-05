package com.kh.spring.member.model.service;

import com.kh.spring.member.model.dto.MemberDTO;

public interface MemberService {

	void signup(MemberDTO member);
	// 회원가입
		// MyBatis : 1. 정수값을 반환함
		//			 2. 아무 값도 반환하지 않음(void) == 예외처리를 빡빡하게 하겠음
		// Hibernate : 가입된 회원의 정보를 반환해줌 / 실패시 null
	
	MemberDTO login(MemberDTO member);
}
