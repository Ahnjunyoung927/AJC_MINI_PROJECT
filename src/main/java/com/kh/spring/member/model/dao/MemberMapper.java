package com.kh.spring.member.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.member.model.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	@Insert("""
			INSERT
			  INTO
			       TB_MEMBER
			VALUES
			       (
			       SEQ_MEMBER_NO.NEXTVAL
			     , #{memberId}
			     , #{memberPwd}
			     , #{email}
			     , #{phone}
			     , SYSDATE
			     , DEFAULT
			     , DEFAULT  
			       )       
			""")
	int signup(MemberDTO member);
	
	@Select("""
			SELECT
			       MEMBER_ID memberId
			     , MEMBER_PW memberPwd
			     , EMAIL
			     , PHONE
			     , ENROLL_DATE enrollDate
			  FROM
			       TB_MEMBER
			 WHERE
			       MEMBER_ID = #{memberId}            
			""")
	MemberDTO login(MemberDTO member);
	
	
}
