package com.audiro.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.audiro.dto.MyReviewListDto;
import com.audiro.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/post/review")
public class ReviewController {

	private final ReviewService reviewService;
	
	
	@GetMapping("/create")
	public void create() {

	}
	
	@GetMapping("/mypage2")
	public void mypage(Model model) {
		List<MyReviewListDto> list = reviewService.read();
		
		model.addAttribute("list", list);
	}
	
	//내 여행일기 메인(최신순정렬)
	@RequestMapping("/latest")
	public ResponseEntity<List<MyReviewListDto>> getLatestReviews() {
		List<MyReviewListDto> list = reviewService.read();
		return ResponseEntity.ok(list);
		}
		
	//내 여행일기 메인(좋아요순정렬)
	@RequestMapping("/likes")
	public ResponseEntity<List<MyReviewListDto>> getLikedReviews() {
		List<MyReviewListDto> goodList = reviewService.readGood();
		return ResponseEntity.ok(goodList);
		}
	
}
