package com.audiro.service;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.audiro.dto.MyReviewListDto;

import com.audiro.repository.Post;
import com.audiro.repository.ReviewDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor  // final 필드들을 초기화하는 아규먼트를 갖는 생성자.
public class ReviewService {
	
	private final ReviewDao reviewDao;	
	
	
	//내 여행후기 목록 모두 불러오기 (최신순)
	public List<MyReviewListDto> read(){
		List<Post> list = reviewDao.readMyReview();
		
		return list.stream()
				.map(MyReviewListDto::fromEntity)
				.toList();
	}
	
	//내 여행후기 목록 모두 불러오기 (좋아요순)
	public List<MyReviewListDto> readGood(){
		List<Post> list = reviewDao.readMyReviewByGood();
			
		return list.stream()
				.map(MyReviewListDto::fromEntity)
				.toList();
	}
		
//	//나를 찜한 유저 수
//	public int likedUsersCount(FavoriteUsers fu, Model model) {
//		
//		int result = postDao.likedUsersCount();
//		model.addAttribute("likedUsersCount",result);
//		
//		return result;
//	}
//		
	
		
		
		
		
	
	
	

}
