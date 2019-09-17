package com.popcornbox.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);

	@GetMapping("/movieInfo")
	public String movieInfo() {
		logger.info("String movieInfo() 호출됨");
		
		return "movieInfo";
	}
}