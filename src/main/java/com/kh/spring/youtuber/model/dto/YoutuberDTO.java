package com.kh.spring.youtuber.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
public class YoutuberDTO {
	
	private Long youtuberNo;
	private Long subscribe;
    private String youtuberName;
	
	private Long reviewCount;
	private Long bookmarkCount;

	private String nationCode;
	
}