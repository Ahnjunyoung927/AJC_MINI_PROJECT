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
public class MainController {

    private final YoutuberService youtuberService;

    @GetMapping("/")
    public String showMainPage(Model model) {
        
        List<YoutuberDTO> youtubers = youtuberService.selectYouberByRank();
        model.addAttribute("youtubers", youtubers);
        
        return "main"; 
    }
}