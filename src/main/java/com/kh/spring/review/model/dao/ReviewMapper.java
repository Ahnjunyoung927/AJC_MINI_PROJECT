package com.kh.spring.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.spring.review.model.dto.ReviewDTO;

public interface ReviewMapper {

	int selectTotalCount();

	List<ReviewDTO> findAllReview(RowBounds rb);

}
