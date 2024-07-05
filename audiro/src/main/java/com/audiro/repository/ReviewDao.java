package com.audiro.repository;

import java.util.List;
import java.util.Set;

import com.audiro.dto.CreateReviewDto;
import com.audiro.dto.MyReviewListDto;
import com.audiro.dto.SerachReviewDto;

//review-mapper.xml, details-mapper.xml, ranking-mapper.xml 에서 SQL을 실행하는 메서드 작성하기.
public interface ReviewDao {

	// 내여행일기
	// 내 여행일기 목록 불러오기 (최신순)
	List<MyReviewListDto> readMyReview();

	// 내 여행일기 목록 불러오기 (좋아요순)
	List<MyReviewListDto> readMyReviewByGood();

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
	int addLikeReview(Integer postId, Set<Integer> favoriteUserIds);
	
	//찜 여행후기 삭제
	int deleteLikeReview(Integer postId, Set<Integer> favoriteUserIds);
	
	// 여행후기 1개 삭제하기
	int deleteReview(Integer postId);
	
	//여행후기 저장
	int insertReview(Post post);
		
	//여행후기 수정
	int updateReview(CreateReviewDto dto);
	
	//여행후기 모두 불러오기(최신순)
	List<Post> selectReviewAll();
	
	//여행후기 모두 불러오기(좋아요순)
	List<Post> rankingGoodReview();

	//여행후기 검색하기
	List<Post> searchKeyword(SerachReviewDto dto);
	
	//여행후기 찜 담아있는 내용 불러오기
	Set<Integer> getFavoriteUserIds(Integer usersId ,Integer postId);
	
	
	
	
	//여행후기 임시저장
	//여행후기 글 임시저장하기
	int saveDraftPost(DraftPost draftPost);
	
	//임시저장 목록 불러오기
	List<DraftPost> selectDraftList();
	
	//임시저장 1개 상세보기
	DraftPost selectDrafById(Integer draftPostId);
	
	//임시저장 삭제하기
	int deleteDraftPost(Integer draftPostId);
	
	
	
	
	
}
