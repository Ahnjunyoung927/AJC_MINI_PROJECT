package com.kh.spring.member.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchedMemberDTO {

	private String memberId;
	private String email;
	private String phone;
	private String memberStatus;
	private String adminYn;
	private Date enrollDate;

}
