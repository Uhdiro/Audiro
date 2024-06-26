package com.audiro.repository;

import java.util.List;

//post-mapper.xml와 ranking-mapper.xml 에서 SQL을 실행하는 메서드 작성하기.
public interface PostDao {
	
	//내 여행후기 삭제하기 
	int deleteReview ();
	//내 여행일기 목록 불러오기 
	List<Post> readMyReview();
	//나를 찜한 유저 수
	int countMylike();
	//여행후기 good 수
	int countReviewGood();

}
