package com.audiro.repository;

import java.util.List;

import com.audiro.dto.SerachReviewDto;

//review-mapper.xml, details-mapper.xml, ranking-mapper.xml 에서 SQL을 실행하는 메서드 작성하기.
public interface ReviewDao {

	// 내여행일기
	// 내 여행일기 목록 불러오기 (최신순)
	List<Post> readMyReview();

	// 내 여행일기 목록 불러오기 (좋아요순)
	List<Post> readMyReviewByGood();

	// 나를 찜한 유저 수
	int countLike();

	// 여행후기 good 수
	int countReviewGood();
	
	//내 여행일기 수
	int countMyReveiw();

	//여행일기많이 작성한 유저TOP3
	List<Post> selectReviewUserTop3();
	
	
	
	
	
	// 여행후기 게시판//////////////////////////////////////////////////////////////
	// 여행후기 postId로 1개 상세보기
	Post readDetailsReviewById(Integer id);

	// 여행후기 postId good 수
	int goodCountByPostId();

	// 해당 여행후기의 유저 관심유저담기
	int addLikeUser();

	// 찜 여행후기 담기
	int addLikeReview();
	
	// 여행후기 1개 삭제하기
	int deleteReview(Integer postId);
	
	//여행후기 저장
	int insertReview(Post post);
	//여행후기 임시저장
	int draftReview(Post post);
	
	//여행후기 수정
	int updateReview(Post post);
	
	//여행후기 모두 불러오기
	List<Post> selectReviewAll();

	//여행후기 검색
	List<Post> serach(SerachReviewDto dto);

}
