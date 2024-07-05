package com.audiro.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.audiro.dto.CreateReviewDto;
import com.audiro.dto.ListReviewDto;
import com.audiro.dto.MyReviewListDto;
import com.audiro.dto.SerachReviewDto;
import com.audiro.repository.DraftPost;
import com.audiro.repository.FavoriteUsers;
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
	
	//나를 찜한 유저 수
	public int countLike() {
		
		int result = reviewDao.countLike();		
		return result;
	}

    //내 여행일기 개수
    public int countMyReveiw() {
    	int result = reviewDao.countMyReveiw();
    	return result;
    }
	
    
    //여행후기 많이작성한 유저 TOP3
    public List<Post> selectUserTop3(){
    	List<Post> list = reviewDao.selectReviewUserTop3();
    	return list;
    }
	
    
    //여행후기 찜 담기
    	public int LikeReview(Integer postId, Set<Integer> usersId) {
    	int list = reviewDao.addLikeReview(postId, usersId);
    	return list;
    }
    	/*
    //여행후기 찜 삭제
    public int deleteLikeReview(Integer postId, Set<Integer> usersId) {
    	int list = reviewDao.deleteLikeReview(postId, usersId);
    	return list;
    }
	*/
    
	
    
    
	///////////////////////////////////////////////////////
	//내 여행후기게시판 상세보기
	public Post readById(Integer postId) {
		Post list = reviewDao.readDetailsReviewById(postId);
		
		return list;
	}
	

	//여행후기 게시글 저장
	public int create(CreateReviewDto dto) {
		int result = reviewDao.insertReview(dto.toEntoty());
		
		return result;
	}
	
	//여행후기 게시글 임시저장
	public int createDraft(DraftPost draftPost) {
		log.debug("draftPost={}", draftPost);
		int result = reviewDao.saveDraftPost(draftPost);
		
		return result;
	}
	
	//여행후기 게시글 수정
	public int update(CreateReviewDto dto) {
		int result = reviewDao.updateReview(dto);
		
		return result;
		
	}
	
	//여행후기 삭제
	public int delete(Integer postId) {
		int result = reviewDao.deleteReview(postId);
		return result;
	}
	
	
	//여행후기 모두 불러오기(최신순)
	public List<ListReviewDto> readAll() {
		List<Post> list = reviewDao.selectReviewAll();
		return list.stream()
				.map(ListReviewDto::fromEntity)
				.toList();
	}
	
	//여행후기 검색
	public List<ListReviewDto> search(SerachReviewDto dto) {
		log.debug("dto={}", dto);
		List<Post> list = reviewDao.searchKeyword(dto);
		return list.stream()
				.map(ListReviewDto::fromEntity)
				.toList();
	}
		
		
	//여행후기 담아있지는 확인.			 
	public synchronized boolean toggleFavorite(Integer usersId ,Integer postId) {
	//여행후기 찜 담아있는 내용 불러오기.
	Set<Integer> favoriteUserIds = reviewDao.getFavoriteUserIds(usersId, postId);
	
	// 현재 유저가 찜한 게시물인지 확인
      if (favoriteUserIds.contains(usersId)) {
          // 이미 찜한 경우 제거
          favoriteUserIds.remove(usersId);
          reviewDao.deleteLikeReview(postId, favoriteUserIds); 
          return false; 
      } else {
          // 찜하지 않은 경우 
          favoriteUserIds.add(usersId);
          reviewDao.addLikeReview(postId, favoriteUserIds); 
          return true; 
      }
	}	
	
	
	//여행후기 임시저장 불러오기
	public List<DraftPost> draftList() {
		List<DraftPost> list = reviewDao.selectDraftList();
		return list;
	}
	
	//여행후기 임시저장 1개 상세보기
	public DraftPost draftPost(Integer draftPostId) {
	
		DraftPost draftPost = reviewDao.selectDrafById(draftPostId);
		return draftPost;
		
	}
	
	
}
	
