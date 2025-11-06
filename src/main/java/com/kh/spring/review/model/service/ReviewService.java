package com.kh.spring.review.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.spring.review.model.dto.ReviewDTO;

public interface ReviewService {

	Map<String, Object> findAllReview(int page);

	int saveReview(ReviewDTO review, HttpSession session);

	int deleteByReviewNo(int reviewNo);
	
	int update(ReviewDTO review);

	List<ReviewDTO> getAllReviews();	
}
