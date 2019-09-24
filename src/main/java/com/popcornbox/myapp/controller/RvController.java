package com.popcornbox.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rv")
public class RvController {
	
	private static final Logger logger = LoggerFactory.getLogger(RvController.class);

	// 영화 목록 페이지
	@GetMapping({"/movieList", "/movieList/{reqPage}", "/movieList/{reqPage}/{movieNm}", "/movieList/{reqPage}/{movieNm}/{directorNm}", "/movieList/{reqPage}/{movieNm}/{directorNm}/{repNationCd}"})
	public String movieList(@PathVariable(required=false) String reqPage, @PathVariable(required=false) String movieNm, @PathVariable(required=false) String directorNm, @PathVariable(required=false) String repNationCd, Model model) {
		logger.info("String list() 호출됨");
		
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("movieNm", movieNm);
		model.addAttribute("directorNm", directorNm);
		model.addAttribute("repNationCd", repNationCd);
		
		return "rv/movieList";
	}
	
	// 리뷰 목록 페이지
	@GetMapping("/reviewList")
	public String reviewList() {
		logger.info("String list() 호출됨");
		
		return "rv/reviewList";
	}
	
	// 영화 검색 페이지
	@GetMapping("/search")
	public String search() {
		logger.info("String search() 호출됨");
		
		return "rv/search";
	}
	
	// 영화 정보 페이지
	@GetMapping("/info/{movieCd}")
	public String movieInfo(@PathVariable(required=true)String movieCd, Model model) {
		logger.info("String movieInfo() 호출됨");
		
		model.addAttribute("movieCd", movieCd);
		
		return "rv/info";
	}
}