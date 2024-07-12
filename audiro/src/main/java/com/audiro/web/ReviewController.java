package com.audiro.web;


import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.audiro.dto.CreateReviewDto;
import com.audiro.dto.DetailsReviewDto;
import com.audiro.dto.ListReviewDto;
import com.audiro.dto.MyReviewListDto;
import com.audiro.dto.SerachReviewDto;
import com.audiro.repository.DraftPost;
import com.audiro.repository.Post;
import com.audiro.repository.User;
import com.audiro.service.ReviewService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/post/review")
public class ReviewController {

	private final ReviewService reviewService;
	

	// 여행후기 작성페이지
	@GetMapping("/create")
	public void create(Model model) {
		List<DraftPost> draft = reviewService.draftList();
		model.addAttribute("drafts", draft);

	}

	// 여행후기 작성 저장 후 페이지
	@PostMapping("/create")
	public String create(CreateReviewDto dto) {
		reviewService.create(dto);
		return "redirect:/post/review/list";
	}

	// 여행후기 작성 임시저장 후 페이지
	@PostMapping("/draft")
	public String draft(DraftPost draftPost) {
		reviewService.createDraft(draftPost);
		return "redirect:/post/review/list";
	}

	// 여행후기 상세보기, 수정하기하면 작성된 페이지 띄우기
	@GetMapping("/details")
	public void reviewDetails(DetailsReviewDto dto, Model model,
							  @RequestParam(name="usersId") Integer usersId) {
	    //여행후기 상세보기
	    DetailsReviewDto post = reviewService.readById(dto.getPostId(), usersId);
		//굿 수
		int countLike = reviewService.countGood(dto.getPostId());
		//찜 수
		int countFavorite = reviewService.countFavorite(dto.getPostId());
		//프로필 이미지
		String profile = reviewService.img(dto.getId());
		
		model.addAttribute("post", post);
		model.addAttribute("countLike", countLike);
		model.addAttribute("countFavorite", countFavorite);
		model.addAttribute("profile", profile);
		//model.addAttribute("profile", profile);
	}

	// 여행후기 수정 업데이트
	@PostMapping("/update")
	public String update(@RequestBody  CreateReviewDto dto) {
		reviewService.update(dto);
		return "redirect:/post/review/details?postId=" + dto.getPostId();
	}

	// 내 여행일기 페이지
	@GetMapping("/mypage")
	public void mypage(Model model, MyReviewListDto dto, @RequestParam("id") String id) {
			    
	    // 세션에 id 추가
	    model.addAttribute("signedInUser", id);
	    log.debug("signedInUser={}", id);
		
	    // 해당 여행일기 리스트
	    List<MyReviewListDto> posts = reviewService.myReviewList(dto);
	    log.debug("dto={}", dto);
	    model.addAttribute("post", posts);
	       
	    // 해당 여행일기페이지 유저의 여행일기 수
	    int countMyReview = reviewService.countMyReveiw(dto.getId());
	    model.addAttribute("countMyReview", countMyReview);
	    
	    // 해당 여행일기페이지 유저를 찜한 유저 수
	    int countLike = reviewService.countLike(dto.getId());
	    model.addAttribute("countLike", countLike);
	}


	// 여행후기수정페이지
	@GetMapping("/modify")
	public void reviewModify(@RequestParam(name = "postId") Integer postId, 
							 @RequestParam(name = "usersId") Integer usersId, 
							 Model model) {
		DetailsReviewDto list = reviewService.readById(postId, usersId);
		model.addAttribute("list", list);
		
		//return "/post/review/modify?postId=" + postId;

	}

	// 여행후기 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam(name = "postId") Integer postId) {
		reviewService.delete(postId);
		return "redirect:/post/review/list";
	}

	// 여행후기 목록 랭킹모델함께 보냄.
	@GetMapping("/list")
	public void reviewList (Model model, @RequestParam("id") String id) {
		
	    
		List<ListReviewDto> list = reviewService.readAll();
		List<Post> rank = reviewService.selectUserTop3();
        
		model.addAttribute("list", list);
		model.addAttribute("id",id);
		// model.addAttribute("rank",rank);

	}

	// 여행후기 검색
	@GetMapping("/search")
	public String search(SerachReviewDto dto, Model model) {
		List<ListReviewDto> list = reviewService.search(dto);
		model.addAttribute("list", list);

		return "post/review/list";
	}

	// 댓글
	@GetMapping("/comments")
	public void test() {

	}

}
