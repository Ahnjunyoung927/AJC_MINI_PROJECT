package com.kh.spring.review.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString

public class ReviewDTO {
		private int reviewNo;
		private Date reviewWriteDate;
		private String reviewContent;
		private String reviewStatus;
		private int memberNo;
		private int youtuberNo;
}
