package com.kh.spring.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.sasl.AuthenticationException;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.spring.exception.InvalidArgumentsException;
import com.kh.spring.member.model.dto.MemberDTO;
import com.kh.spring.review.model.dao.ReviewMapper;
import com.kh.spring.review.model.dto.ReviewDTO;
import com.kh.spring.util.PageInfo;
import com.kh.spring.util.Pagination;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	private final ReviewMapper reviewMapper;
	private final Pagination pagenation;

	@Override
	public Map<String, Object> findAllReview(int page) {

		Map<String, Object> map = new HashMap<>();
		List<ReviewDTO> reviews = new ArrayList<>();

		if (page < 1) {
			throw new InvalidArgumentsException("잘못된 접근입니다.");
		}

		int count = reviewMapper.selectTotalCount();
		log.info("총 게시글 개수 : {}", count);
		PageInfo pi = pagenation.getPageInfo(count, page, 8, 8);

		if (count > 0) {
			RowBounds rb = new RowBounds((page - 1) * 8, 8);
			reviews = reviewMapper.findAllReview(rb);
		}
		log.info("{}", reviews);
		map.put("pi", pi);
		map.put("reviews", reviews);
		log.debug("count={}, reviews={}", count, reviews);
		return map;
	}

	private void validateUser(ReviewDTO review, HttpSession session) {

		String reviewName = review.getReviewName();
		MemberDTO loginMember = ((MemberDTO) session.getAttribute("loginMember"));
//		if (loginMember == null || !reviewName.equals(loginMember.getUserId())) {
//			throw new AuthenticationException("권한 없는 접근입니다.");
//		}

	}

	private void validateContent(ReviewDTO review) {
		if (review.getReviewContent().trim().isEmpty()) {
			throw new InvalidArgumentsException("유효하지 않은 요청입니다.");
		}

	}

	@Override
	public int saveReview(ReviewDTO review, HttpSession session) {

		// 1번 권한 검증
		validateUser(review, session);

		// 2번 값에 대한 유효성 검증
		validateContent(review);

		int result = reviewMapper.saveReview(review);

		if (result != 1) {
			throw new RuntimeException("에러 발생 review를 받지 못함");
		}
		return result;
	}

	@Override
	public int deleteByReviewNo(int reviewNo) {
		return 0;
	}

	@Override
	public int update(ReviewDTO review) {
		return 0;
	}

	@Override
	public List<ReviewDTO> getAllReviews() {
		int totalCount = reviewMapper.selectTotalCount();
		RowBounds rowBounds = new RowBounds(0, totalCount); // 전체 데이터 조회
		return reviewMapper.findAllReview(rowBounds);
	}
}
