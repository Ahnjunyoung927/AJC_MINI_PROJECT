package com.kh.spring.youtuber.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.youtuber.model.dto.YoutuberDTO;
import com.kh.spring.youtuber.model.service.YoutuberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/youtuber")
@RequiredArgsConstructor // final 필드(youtuberService)에 대한 생성자 주입
public class YoutuberController {
	
	// Service 주입
	private final YoutuberService youtuberService;
	
	/**
	 * list 페이지 경로지정 메소드 
	 * @return "youtuber/list"
	 */
	@GetMapping("/list")
	public String showListPage() {
		// youtuber_list.jsp 파일을 보여줍니다.
		return "youtuber/list";
	}
	
	/**
	 * 신규 유튜버 등록 폼 페이지로 이동
	 */
	@GetMapping("/add")
	public String showAddForm() {
		return "youtuber/creator_form";
	}
	
	

	

}
