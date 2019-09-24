package com.popcornbox.myapp.controller;

import javax.servlet.http.HttpServletRequest;

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
	@GetMapping("/movieList")
	public String movieList(Model model, HttpServletRequest request) {
		logger.info("String movieList() 호출됨");
		
		model.addAttribute("reqPage", request.getParameter("reqPage"));
		model.addAttribute("directorNm", request.getParameter("directorNm"));
		model.addAttribute("movieNm", request.getParameter("movieNm"));
		model.addAttribute("repNationCd", request.getParameter("repNationCd"));
		
		return "rv/movieList";
	}
	
	// 리뷰 목록 페이지
	@GetMapping("/reviewList")
	public String reviewList() {
		logger.info("String list() 호출됨");
		
		return "rv/reviewList";
	}

	 // 영화 목록 페이지
	 @GetMapping("/list")
	 public String list() { 
		 logger.info("String list() 호출됨");
		 
		 return "movie/list";
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