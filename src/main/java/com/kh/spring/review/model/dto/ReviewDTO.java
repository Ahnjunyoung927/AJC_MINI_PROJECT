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
		private int memberNo;
		private int creatorNo;
		private String reviewName;
		private String reviewContent;
		private Date reviewDate;
		private String reviewStatus;
}
