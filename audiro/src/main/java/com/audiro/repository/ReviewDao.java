package com.audiro.repository;

import java.util.List;

//post-mapper.xml와 ranking-mapper.xml 에서 SQL을 실행하는 메서드 작성하기.
public interface ReviewDao {
	
	//내 여행일기 목록 불러오기 (최신순) 
	List<Post> readMyReview();
	//내 여행일기 목록 불러오기 (좋아요순)
	List<Post> readMyReviewByGood();
	//내 여행후기 삭제하기 
	int deleteReview ();
	//나를 찜한 유저 수
	int likedUsersCount();
	//여행후기 good 수
	int countReviewGood();

}
