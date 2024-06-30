package com.audiro.repository;

import java.util.List;

//review-mapper.xml, details-mapper.xml, ranking-mapper.xml 에서 SQL을 실행하는 메서드 작성하기.
public interface ReviewDao {

	// 내여행일기
	// 내 여행일기 목록 불러오기 (최신순)
	List<Post> readMyReview();

	// 내 여행일기 목록 불러오기 (좋아요순)
	List<Post> readMyReviewByGood();

	// 내 여행후기 1개 삭제하기
	int deleteReview();

	// 나를 찜한 유저 수
	int likedUsersCount();

	// 여행후기 good 수
	int countReviewGood();

	
	
	
	
	// 여행후기 게시판//////////////////////////////////////////////////////////////
	// 여행후기 postId로 1개 상세보기
	public Post readDetailsReviewById(Integer id);

	// 여행후기 postId good갯수
	public int goodCountByPostId();

	// 해당 여행후기의 유저 관심유저담기
	public int addLikeUser();

	// 찜 여행후기 담기
	public int addLikeReview();
	
	
	//여행후기 작성 insert
	public int insertReview(Post post);
}
