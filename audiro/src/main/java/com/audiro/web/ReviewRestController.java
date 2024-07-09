package com.audiro.web;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.dto.LikeReviewPostDto;
import com.audiro.dto.LikeUserFavoriteDto;
import com.audiro.repository.DraftPost;
import com.audiro.repository.Post;
import com.audiro.repository.Profile;
import com.audiro.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/review")
public class ReviewRestController {

	
	private final ReviewService reviewService;

	// 여행후기 담기
	@PostMapping("/likeReview/toggle")
	public ResponseEntity<Boolean> likeReview(@RequestBody LikeReviewPostDto request) {
		Boolean likeReview = reviewService.toggleFavorite(request);

		return ResponseEntity.ok(likeReview);
	}
	
	//관심유저 담기
	@PostMapping("/likeUser/toggle")
	public ResponseEntity<Boolean> likeUser(@RequestBody LikeUserFavoriteDto request) {
		Boolean likeUser = reviewService.togglUserFavorite(request);

		return ResponseEntity.ok(likeUser);
	}
	

	// 임시저장 목록 1개 선택시 불러오기
	@GetMapping("/draftPost")
	public ResponseEntity<DraftPost> SelectdaraftPost(DraftPost draftPost) {
		log.debug("draftPost(draftId={}", draftPost);

		DraftPost daraftPost = reviewService.draftPost(draftPost.getDraftPostId());
		return ResponseEntity.ok(daraftPost);

	}
	


	// 여행후기 최신순, 좋아요순 정렬
	@GetMapping("/list")
	public ResponseEntity<List<Post>> getReviews(@RequestParam("sort") String sort) {
		// sort 파라미터에 따라 리뷰 목록을 가져오는 로직 구현
		List<Post> review = reviewService.getReviewsSortedBy(sort);
		return ResponseEntity.ok(review);
	}

}
