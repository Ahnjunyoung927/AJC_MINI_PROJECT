package com.kh.spring.youtuber.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor 
@AllArgsConstructor 
@ToString
public class Youtuber {
	
	private Long youtuberNo;
	private String youtuberName;
	private Long subscribe;
	private String status;
	private String field;
	private String category;
	
}