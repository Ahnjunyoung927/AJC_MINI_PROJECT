package com.kh.spring.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.spring.member.model.dto.MemberDTO;
import com.kh.spring.member.model.dto.SearchedMemberDTO;

@Mapper
public interface MemberMapper {
	
	@Select("SELECT MEMBER_ID memberId, MEMBER_PW memberPw, PHONE phone, EMAIL, ADMIN_YN adminYn FROM TB_MEMBER WHERE MEMBER_ID = #{memberId} AND MEMBER_PW = #{memberPw}" )
	MemberDTO login(MemberDTO member);
	
	@Select("""
				SELECT
				       MEMBER_ID memberId
				     , EMAIL
				     , PHONE
				     , MEMBER_STATUS memberStatus
				     , ADMIN_YN adminYn
				  	 , ENROLL_DATE enrollDate
				  FROM
				       TB_MEMBER
				 WHERE
				       MEMBER_ID = #{userId}
			""")
	SearchedMemberDTO findMemberById(String userId);
	
	@Update("""
				UPDATE
				       TB_MEMBER
				   SET
				       EMAIL = #{email}
				 WHERE
				       MEMBER_ID = #{memberId}
				       
			""")
 	int updateEmail(MemberDTO member);
	
	@Update("""
			UPDATE
			       TB_MEMBER
			   SET
			       PHONE = #{phone}
			 WHERE
			       MEMBER_ID = #{memberId}    
			""")
	int updatePhone(MemberDTO member);
	
	@Update("""
			UPDATE
			       TB_MEMBER
			   SET
			       MEMBER_STATUS = #{memberStatus}
			 WHERE
			       MEMBER_ID = #{memberId}
			""")
	int updateStatus(MemberDTO member);
	
	@Update("""
			UPDATE
			       TB_MEMBER
			   SET
			       ADMIN_YN = #{adminYn}
			 WHERE
			       MEMBER_ID = #{memberId}
			""")
	int updateAdmin(MemberDTO member);
	
	
}
