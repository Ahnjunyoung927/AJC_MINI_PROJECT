package com.kh.spring.review.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.review.model.dto.ReviewDTO;
import com.kh.spring.review.model.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("reviews")
@RequiredArgsConstructor
public class ReviewController {
	
	private final ReviewService reviewService;
	
	@GetMapping
	public String findAllReview(@RequestParam(name="page", defaultValue="1") int page
							   ,Model model) {
		log.info("리뷰 개수 : {} ", page);
		
		Map<String, Object> map = reviewService.findAllReview(page);
		model.addAttribute("map", map);
		return "review/reviewAll";
	}
	
	@GetMapping
	public String saveReview(ReviewDTO review, HttpSession session) {
		reviewService.saveReview(review, session);
		
		return "";
	}
	

}
