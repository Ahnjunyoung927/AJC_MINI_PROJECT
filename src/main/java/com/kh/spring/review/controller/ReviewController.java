package com.kh.spring.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		System.out.println("=== Controller: map -> {}" + map);
		model.addAttribute("map", map);
		return "review/review_list";
	}
	
	@PostMapping
	public String saveReview(ReviewDTO review, HttpSession session) {
		reviewService.saveReview(review, session);
		
		return "";
	}
	
	@GetMapping("/review_List")
	public String reviewList(Model model) {
		log.info("확인");
	    Map<String, Object> map = new HashMap<>();
	    List<ReviewDTO> reviews = reviewService.getAllReviews();

	    map.put("reviews", reviews);
	    model.addAttribute("map", map);
	    
	    System.out.println("리뷰 데이터 개수: " + reviews.size());
	    return "review_list";	    
	}
	



}
