package com.kh.spring.youtuber.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.youtuber.model.dto.YoutuberDTO;
import com.kh.spring.youtuber.model.service.YoutuberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class YoutuberInsertController {

	private final YoutuberService youtuberService;

	@PostMapping("/add")
	public String handleAddForm(YoutuberDTO youtuber, RedirectAttributes rttr) {

		log.info("폼에서 전달받은 데이터: {}", youtuber);

		int result = youtuberService.insertCreator(youtuber);

		if (result > 0) {

		} else {
			log.error("유튜버 등록 중 오류 발생");
		}

		return "redirect:/youtuber/list";
	}

}
