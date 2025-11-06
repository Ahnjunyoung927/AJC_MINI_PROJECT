package com.kh.spring.youtuber.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.youtuber.model.dto.YoutuberDTO;
import com.kh.spring.youtuber.model.service.YoutuberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/youtuber") 
@RequiredArgsConstructor
public class YoutuberController {

    private final YoutuberService youtuberService;

    /**
     * 1. 유튜버 목록 페이지
     * @return: URL /youtuber/list
     */
    @GetMapping("/list")
    public String showListPage(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        
        Map<String, Object> map = youtuberService.selectAllYoutubers(page);
        
        model.addAttribute("list", map.get("list"));
        model.addAttribute("pi", map.get("pi"));
        
        return "youtuber/list"; 
    }

    /**
     * 2. 유튜버 상세 페이지
     * @return: URL /youtuber/detail?no=#{youtuberNo}
     */
    @GetMapping("/detail")
    public String showYoutuberDetail(@RequestParam("no") int youtuberNo, Model model) {
        
        YoutuberDTO youtuber = youtuberService.selectYoutuberByNo(youtuberNo);

        //리뷰랑 카테고리는?
        model.addAttribute("youtuber", youtuber);

        return "youtuber/youtuber_detail"; 
    }
    
    /**
     * 3. 유튜버 등록 폼 
     * @return: URL /youtuber/add
     */
    @GetMapping("/add")
    public String showCreatorForm() {
        return "youtuber/creator_form"; 
    }

    /**
     * 4. 유튜버 등록 처리 
     * @return: URL /youtuber/add
     */
    @PostMapping("/add")
    public String insertYouber( @RequestParam("creatorName") String creatorName,
					            @RequestParam("subscrCount") int subscrCount, 
					            @RequestParam("nationCode") String nationCode,
					            YoutuberDTO youtuber) {
    	
        youtuber.setYoutuberName(creatorName);
        youtuber.setSubscribe(subscrCount); 
        youtuber.setNationCode(nationCode);
 
        youtuberService.insertCreator(youtuber);
        
        return "redirect:/youtuber/list";
    }

    /**
     * 5. 유튜버 랭킹 조회
     * @return: URL /youtuber/rank
     */
    @GetMapping("/rank")
    public String showByYoutuberRank(Model model) {
        List<YoutuberDTO> youtubers = youtuberService.selectYouberByRank();
        model.addAttribute("youtubers", youtubers);
        return "main";
    }

}