package com.kh.spring.review.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.spring.review.model.dto.ReviewDTO;

@Mapper
public interface ReviewMapper {

	int selectTotalCount();

	List<ReviewDTO> findAllReview(RowBounds rb);

	int saveReview(ReviewDTO review);

	ReviewDTO findByReviewNo(int review);
	
	
}
