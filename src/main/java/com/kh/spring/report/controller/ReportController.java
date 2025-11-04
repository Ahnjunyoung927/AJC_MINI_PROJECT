package com.kh.spring.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.member.model.dto.MemberDTO;
import com.kh.spring.member.model.dto.SearchedMemberDTO;
import com.kh.spring.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("reports") // 이 컨트롤러에서 공통적으로 사용할 매핑값을 위로 뺐음
public class ReportController {
	
	private final MemberService memberService;
	
	@Autowired
	public ReportController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping // 관리자 페이지로
	public String toReports() {
		return "report/reports";
	}
	
	@GetMapping("handleM") // 관리자 페이지 중 회원 관리 페이지로
	public String toHandleMember() {
		return "report/handleM";
	}
	
	@GetMapping("handleR") // 관리자 페이지 중 리뷰 관리 페이지로
	public String toHandleReview() {
		return "report/handleR";
	}
	
	@GetMapping("handleY") // 관리자 페이지 중 유튜버 관리 페이지로
	public String toHandleYoutuber() {
		return "report/handleY";
	}
	
	@GetMapping("updateM") // 
	public String sendToRegistM() {
		return "report/updateM";
	}
	
	@ResponseBody // 반환값이 응답데이터이라고 알려줌
	@GetMapping(value="searchM", produces="application/json; charset=UTF-8")
	public SearchedMemberDTO findMemberById(@RequestParam(name="userId") String userId) {
		// log.info("사용자 입력값 : {}", userId);
		SearchedMemberDTO searchedMember = memberService.findMemberById(userId);
		// log.info("응답 직전 멤버 정보 : {}", searchedMember);
		return searchedMember;
	}
	
	
	@PostMapping("/updateEmail")
    public ResponseEntity<String> updateEmail(MemberDTO member) {
		log.info("넘어옴? : {}", member);
        int result = memberService.updateEmail(member);
        return result > 0 ? ResponseEntity.ok("success") : ResponseEntity.badRequest().body("fail");
    }
	
	@PostMapping("/updatePhone")
    public ResponseEntity<String> updatePhone(MemberDTO member) {
        int result = memberService.updatePhone(member);
        return result > 0 ? ResponseEntity.ok("success") : ResponseEntity.badRequest().body("fail");
    }
	
	@PostMapping("/updateStatus")
	public ResponseEntity<String> updateStatus(MemberDTO member) {
		// log.info("변경할 회원 스테이터스 넘어오는지 : {}", member);
        int result = memberService.updateStatus(member);
        return result > 0 ? ResponseEntity.ok("success") : ResponseEntity.badRequest().body("fail");
    }
	
	@PostMapping("/updateAdmin")
	public ResponseEntity<String> updateAdmin(MemberDTO member) {
		log.info("변경할 회원 관리자 권한 넘어되는지 : {}", member);
        int result = memberService.updateAdmin(member);
        return result > 0 ? ResponseEntity.ok("success") : ResponseEntity.badRequest().body("fail");
    }
	
	
	
}
