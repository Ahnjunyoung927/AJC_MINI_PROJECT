package com.kh.spring.member.model.service;

import com.kh.spring.member.model.dto.MemberDTO;
import com.kh.spring.member.model.dto.SearchedMemberDTO;

public interface MemberService {
	
	MemberDTO login(MemberDTO member);
	
	SearchedMemberDTO findMemberById(String userId);
	
	int updateEmail(MemberDTO dto);
	
	int updatePhone(MemberDTO dto);
	
	int updateStatus(MemberDTO dto);
	
	int updateAdmin(MemberDTO dto);

}
