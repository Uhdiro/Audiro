package com.audiro.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/post/review")
public class ReviewController {

	@GetMapping("/mypage")
	public void myReview() {
		
	}
	
	@GetMapping("/create")
	public void create() {

	}
}
