package com.audiro.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.audiro.dto.CreateReviewDto;
import com.audiro.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/post/review")
public class CreateCReviewController {

	
	private final ReviewService reviewService;
	
	
	/*@PostMapping("/create")
	public String create(CreateReviewDto dto) {
		reviewService.create(dto);
		
		return "redirect:/post/review/list";
	}*/
}
