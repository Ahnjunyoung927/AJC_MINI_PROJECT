package com.kh.spring.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.spring.exception.InvalidArgumentsException;
import com.kh.spring.exception.UserIdNotFoundByAdminException;
import com.kh.spring.member.model.dao.MemberMapper;
import com.kh.spring.member.model.dto.MemberDTO;
import com.kh.spring.member.model.dto.SearchedMemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper mapper;
	
	@Override
	public MemberDTO login(MemberDTO member) {
		
		MemberDTO loginMember = mapper.login(member); 
		log.info("DB로그인 정보 : {}", loginMember);
		
		return loginMember;
	}

	@Override
	public SearchedMemberDTO findMemberById(String userId) {
		// 유효성
		
		if(userId == null || userId.trim().isEmpty()) {
			// log.info("예외처리되나?");
			throw new InvalidArgumentsException("유효한 입력값이 아닙니다.");
		}
		
		SearchedMemberDTO searchedMember = mapper.findMemberById(userId);
		log.info("조회한 회원 정보 : {}", searchedMember);
		if(searchedMember != null) {
			return searchedMember;
		} else {
			throw new UserIdNotFoundByAdminException("조회된 회원이 없습니다.");
		}
	}
	
	@Override
	public int updateEmail(MemberDTO member) {
		return mapper.updateEmail(member);
    }
	
	@Override
	public int updatePhone(MemberDTO member) {
		return mapper.updatePhone(member);
    }
	
	@Override
	public int updateStatus(MemberDTO member) {
		return mapper.updateStatus(member);
    }
	
	@Override
	public int updateAdmin(MemberDTO member) {
		return mapper.updateAdmin(member);
    }
	

}
