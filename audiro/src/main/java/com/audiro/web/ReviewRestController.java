package com.audiro.web;

import java.util.List;
import java.util.Set;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.dto.CreateReviewDto;
import com.audiro.dto.LikeReviewDto;
import com.audiro.dto.MyReviewListDto;
import com.audiro.repository.DraftPost;
import com.audiro.repository.Post;
import com.audiro.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("api/review")
public class ReviewRestController {



	private final ReviewService reviewService;
	
	//여행후기 담기
	@PostMapping("/likeReview/toggle")
	public ResponseEntity<Integer> likeReview(@RequestBody LikeReviewDto request) {
		int likeReview = reviewService.LikeReview(request.getPostId(), request.getUsersId());
		return ResponseEntity.ok(likeReview);
	}
	
	//임시저장 목록 1개 선택시 불러오기
	@GetMapping("/draftPost")
	public ResponseEntity<DraftPost> SelectdaraftPost (DraftPost draftPost) {
		log.debug("draftPost(draftId={}", draftPost);
		
		DraftPost daraftPost =reviewService.draftPost(draftPost.getDraftPostId());
		return ResponseEntity.ok(daraftPost);
	
				
	}
	
	
	//여행후기 업데이트
	/*@PostMapping("/update")
    public String update(@ModelAttribute CreateReviewDto dto) {
        reviewService.update(dto);
        log.debug("update={}",dto);
        return "redirect:/post/review/details?postId=" + dto.getPostId();
    }
		
*/
	
	/*
	// 내 여행일기 메인(최신순정렬)
		@RequestMapping("/latest")
		public ResponseEntity<List<MyReviewListDto>> getLatestReviews() {
			List<MyReviewListDto> list = reviewService.read();
			return ResponseEntity.ok(list);
		}

		// 내 여행일기 메인(좋아요순정렬)
		@RequestMapping("/likes")
		public ResponseEntity<List<MyReviewListDto>> getLikedReviews() {
			List<MyReviewListDto> goodList = reviewService.readGood();
			return ResponseEntity.ok(goodList);
		}
		
		
		*/
		
		
}
