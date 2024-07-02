package com.audiro.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.audiro.dto.CreateReviewDto;
import com.audiro.dto.ListReviewDto;
import com.audiro.dto.MyReviewListDto;
import com.audiro.dto.SerachReviewDto;
import com.audiro.repository.Post;
import com.audiro.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/post/review")
public class ReviewController {

	private final ReviewService reviewService;

	//여행후기 작성페이지
	@GetMapping("/create")
	public void create() {

	}
	
	//여행후기 작성 저장후 페이지
	@PostMapping("/create")
	public String create(CreateReviewDto dto) {
		reviewService.create(dto);
		return "redirect:/post/review/list";
	}
	
	//여행후기 작성 임시저장후 페이지
	@PostMapping( "/draft")
	public String draft(CreateReviewDto dto) {
		reviewService.draft(dto);
		return "redirect:/post/review/list";
		}
	

	// 여행후기 상세보기, 수정하기하면 작성된 페이지 띄우기
	@GetMapping({"/details", "modify"})
		public void reviewDetails(@RequestParam(name = "postId") Integer postId, Model model) {

		//postId검색
		Post list = reviewService.readById(postId);
		model.addAttribute("list", list);
		}
	
	
	//여행후기 수정 업데이트
	@GetMapping("/update")
	public String update(CreateReviewDto dto) {
		reviewService.update(dto);
		return "redirect:/post/review/details?postId=" + dto.getPostId();
	}
	
	
	//내 여행일기 페이지
	@GetMapping("/mypage")
	public void mypage(Model model) {
		//내 여행일기 목록
		List<MyReviewListDto> list = reviewService.read();
		model.addAttribute("list", list);
		
	
		//내 여행일기 수
		int countMyReview = reviewService.countMyReveiw();
		model.addAttribute("countMyReview", countMyReview);
		//나를찜한 유저 수
		int countLike = reviewService.countLike();
		model.addAttribute("countLike", countLike);
		
	}

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


	
	//여행후기수정페이지
//	@GetMapping("/modify") 
//		public String reviewModify(@RequestParam(name = "postId") Integer postId, Model model) {
//		Post list = reviewService.readById(postId);
//		model.addAttribute("list", list);
//		
//		return "redirect:/post/review/modify?postId=" + postId;
//		
//		
//	}
//	
	//여행후기 삭제
	@PostMapping("/delete") 
	public String delete(@RequestParam(name="postId") Integer postId) {
		reviewService.delete(postId);
		return "redirect:/post/review/list";
	}

	
	
	
	//여행후기 목록 랭킹모델함께 보냄.
	@GetMapping("/list")
	public void reviewAllList(Model model, Post post) {
		List<ListReviewDto> list = reviewService.readAll();
		//List<Post> rank = reviewService.selectUserTop3();
		
		model.addAttribute("list", list);
		//model.addAttribute("rank",rank);
		
	}
	
	//여행후기 검색
	@GetMapping("/serach")
	public String search(SerachReviewDto dto, Model model) {
		List<ListReviewDto> list = reviewService.search(dto);
		model.addAttribute("list", list);
		
		return "/post/review/list";
	}
	
	
	//여행후기 담기
	@PostMapping("/likeReview")
	
	
	
	
	//댓글
	@GetMapping("/comments")
	public void test() {

	}
}
