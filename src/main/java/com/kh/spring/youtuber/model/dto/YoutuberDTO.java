package com.kh.spring.youtuber.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class YoutuberDTO {
	
	private long youtuberNo;
	private long subscribe;
    private String youtuberName;
	
	private long reviewCount;
	private long bookmarkCount;
	

	private String nationCode;
	
}