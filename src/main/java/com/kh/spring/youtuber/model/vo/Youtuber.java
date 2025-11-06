package com.kh.spring.youtuber.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
public class Youtuber {
	
	private Long youtuberNo;
	private String youtuberName;
	private Long subscribe;
	private String status;
	private String field;
	private String category;
	
}