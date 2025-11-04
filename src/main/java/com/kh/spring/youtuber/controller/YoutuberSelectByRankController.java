package com.kh.spring.youtuber.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.spring.youtuber.model.dto.YoutuberDTO;
import com.kh.spring.youtuber.model.service.YoutuberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor

public class YoutuberSelectByRankController {
	
	private final YoutuberService youtubeService;
	
	
	@GetMapping("/")
	public String youtuberSelectByRank(Model model) {

		List<YoutuberDTO> youtubers = youtubeService.youtuberSelectByRank();

		// log.info("이 개놈의 새끼가 {}", youtubers);

		model.addAttribute("youtubers", youtubers);

		return "main";

	}

}
