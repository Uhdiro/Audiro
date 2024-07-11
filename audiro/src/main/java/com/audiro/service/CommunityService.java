package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.CommunityPostCreateDto;
import com.audiro.dto.CommunityPostListDto;
import com.audiro.dto.CommunityPostSearchDto;
import com.audiro.dto.CommunityRankingDto;
import com.audiro.dto.CommunityUpdateDto;
import com.audiro.repository.CommunityDao;
import com.audiro.repository.Post;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor  // final 필드들을 초기화하는 아규먼트를 갖는 생성자->의존성 주입하려고 사용
public class CommunityService {
	
	private final CommunityDao communityDao;//->의존성 주입
	
	//------- 페이징 처리 목록 불러오기  시작 --------------------------------------
	//페이징 처리를 위한 전체(여행메이트+자유게시판) 페이지 수를 가져오는 서비스
    public int getTotalPages(Integer pageSize) {
    	log.debug("getTotalPages()");
    	log.debug("pageSize:{}",pageSize);
        //pagingDao를 사용하여 전체 게시물 수를 가져옵니다.
        int totalPosts = communityDao.countAllPosts();
        log.debug("전체 게시물 수:{}",totalPosts);
        int resultpage = (int) Math.ceil((double) totalPosts / pageSize);
        log.debug("전체 페이지 수:{}",resultpage);
        // 전체 페이지 수를 계산하여 반환합니다.
        return (int) Math.ceil((double) totalPosts / pageSize);
    }
    
	//페이징 처리를 위한 여행메이트 페이지 수를 가져오는 서비스
    public int getMatePages(int pageSize) {
    	log.debug("getMatePages()");
    	log.debug("pageSize:{}",pageSize);
        //pagingDao를 사용하여 전체 게시물 수를 가져옵니다.
        int totalPosts = communityDao.countMatePosts();
        log.debug("여행 메이트 게시물 수:{}",totalPosts);
        int resultpage = (int) Math.ceil((double) totalPosts / pageSize);
        log.debug("여행 메이트 전체 페이지 수:{}",resultpage);
        // 전체 페이지 수를 계산하여 반환합니다.
        return (int) Math.ceil((double) totalPosts / pageSize);
    }
    
	//페이징 처리를 위한 자유 게시판 페이지 수를 가져오는 서비스
    public int getFreePages(int pageSize) {
    	log.debug("getFreePages()");
    	log.debug("pageSize:{}",pageSize);
        //pagingDao를 사용하여 전체 게시물 수를 가져옵니다.
        int totalPosts = communityDao.countFreePosts();
        log.debug("자유 게시판 게시물 수:{}", totalPosts);
        int resultpage = (int) Math.ceil((double) totalPosts / pageSize);
        log.debug("자유 게시판 전체 페이지 수:{}", resultpage);
        // 전체 페이지 수를 계산하여 반환합니다.
        return (int) Math.ceil((double) totalPosts / pageSize);
    }
    
    // 전체(여행메이트+자유게시판) 게시물 목록을(최신순으로) 가져오는 서비스입니다.
    public List<Post> getSelectPagingAllNewOrderByIdDesc(Integer page, Integer pageSize) {
    	//-> pageSize한 페이지당 몇 개 가져올건지 내가 컨트롤러에서 지정한 개수
    	//page는 현재 페이지.
        // 페이지 시작점을 계산합니다.
        int offset = (page - 1) * pageSize;
        // PostMapper를 사용하여 게시물 목록을 가져옵니다.
        return communityDao.selectPagingEntireOrderByIdDesc(offset, pageSize);
    }
    
    // 여행메이트 게시물 목록을(으로) 최신순으로 가져오는 서비스입니다.
    public List<Post> getSelectPagingMateOrderByIdDesc(Integer page, Integer pageSize) {
    	//-> pageSize한 페이지당 몇 개 가져올건지 내가 컨트롤러에서 지정한 개수
    	//page는 현재 페이지.
        // 페이지 시작점을 계산합니다.
        int offset = (page - 1) * pageSize;
        // PostMapper를 사용하여 게시물 목록을 가져옵니다.
        return communityDao.selectPagingMateOrderByCreatedTimeDesc(offset, pageSize);
    }
    
    // 자유 게시판 게시물 목록을(으로) 최신순으로 가져오는 서비스입니다.
    public List<Post> getSelectPagingFreeOrderByIdDesc(Integer page, Integer pageSize) {
    	//-> pageSize한 페이지당 몇 개 가져올건지 내가 컨트롤러에서 지정한 개수
    	//page는 현재 페이지.
        // 페이지 시작점을 계산합니다.
        int offset = (page - 1) * pageSize;
        // PostMapper를 사용하여 게시물 목록을 가져옵니다.
        return communityDao.selectPagingFreeOrderByCreatedTimeDesc(offset, pageSize);
    }
    
    // 전체(여행메이트+자유게시판) 게시물 목록을(인기순으로) 가져오는 서비스입니다.
    public List<Post> getSelectPagingAllOrderByGoodDesc(Integer page, Integer pageSize) {
    	//-> pageSize한 페이지당 몇 개 가져올건지 내가 컨트롤러에서 지정한 개수
    	//page는 현재 페이지.
        // 페이지 시작점을 계산합니다.
        int offset = (page - 1) * pageSize;
        // PostMapper를 사용하여 게시물 목록을 가져옵니다.
        return communityDao.selectPagingEntireOrderByGoodDesc(offset, pageSize);
    }
    
    // 여행메이트 게시물 목록을(으로) 인기순으로 가져오는 서비스입니다.
    public List<Post> getSelectPagingMateOrderByGoodDesc(Integer page, Integer pageSize) {
    	//-> pageSize한 페이지당 몇 개 가져올건지 내가 컨트롤러에서 지정한 개수
    	//page는 현재 페이지.
        // 페이지 시작점을 계산합니다.
        int offset = (page - 1) * pageSize;
        // PostMapper를 사용하여 게시물 목록을 가져옵니다.
        return communityDao.selectPagingMateOrderByGoodDesc(offset, pageSize);
    }
    
    // 자유 게시판 게시물 목록을(으로) 인기순으로 가져오는 서비스입니다.
    public List<Post> getSelectPagingFreeOrderByGoodDesc(Integer page, Integer pageSize) {
    	//-> pageSize한 페이지당 몇 개 가져올건지 내가 컨트롤러에서 지정한 개수
    	//page는 현재 페이지.
        // 페이지 시작점을 계산합니다.
        int offset = (page - 1) * pageSize;
        // PostMapper를 사용하여 게시물 목록을 가져옵니다.
        return communityDao.selectPagingFreeOrderByGoodDesc(offset, pageSize);
    }
	
  //------- 페이징 처리 목록 불러오기  끝 --------------------------------------

    // 랭킹
    // 관심유저 3명 순위
	public List<CommunityRankingDto> readRankingLikeUserTop3() {
	log.debug("readRankingLikeUserTop3()");
	List<CommunityRankingDto> listLikeUserTop3 = communityDao.selectLikeUserTop3();
	log.debug(listLikeUserTop3.toString());
	return listLikeUserTop3;	
	}
	
    // 전체(여행메이트+자유) 글 good 많은 post 3순위
	public List<CommunityRankingDto> readRankingAllPostsGoodTop3() {
	log.debug("readRankingAllPostsGoodTop3()");
	List<CommunityRankingDto> listPostsGoodTop3 = communityDao.selectAllPostsGoodTop3();
	log.debug(listPostsGoodTop3.toString());
	return listPostsGoodTop3;	
	}

    // 전체(여행메이트+자유) 댓글 많이 단 user 3순위
	public List<CommunityRankingDto> readRankingCommentsUserTop3() {
	log.debug("readRankingAllPostsGoodTop3()");
	List<CommunityRankingDto> listCommentsUserTop3 = communityDao.selectCommentsUserTop3();
	log.debug(listCommentsUserTop3.toString());
	return listCommentsUserTop3;	
	}
	
	// --------------------------------랭킹 끝
	
	// 게시판 상세보기
	public CommunityPostListDto readByPostIdDetails(Integer postId) {
		log.debug("readByPostIdDetails()");
		Post post = communityDao.selectDetailsFreeAndMate(postId);
		log.debug(post.toString());
		return CommunityPostListDto.fromEntity(post);
	}
	
	//글쓰기 DB에 insert
	public int communityInsertCreateWriting(CommunityPostCreateDto dto) {
		log.debug("CommunityWriting({})", dto);
		int result = communityDao.insertFreeAndMate(dto.toEntity());
		log.debug("insert 결과 = {}", result);
		
		return result;		
	}
	
	//글 수정
	public int communityUpdatePost(CommunityUpdateDto dto) {
		log.debug("communityUpdatePost({})", dto);
		int result = communityDao.updateFreeAndMate(dto.toEntity());
		log.debug("update 결과 = {}", result);
		
		return result;		
	}	
	
	//글삭제
    public int delete(Integer postId) {
        log.debug("delete(postId={})", postId);
        
        // 리포지토리 컴포넌트의 메서드를 호출해서 delete 쿼리를 실행.
        int result = communityDao.deletePostById(postId);        
        return result;
    }
	
	//id로 users_id뽑아오기
	public Integer selectUsersIdById(String id) {
		Integer usersId = communityDao.selectUsersIdById(id);
		return usersId;
	}
	
	
	
//	//-----게시판 : 전체/여행메이트/자유 게시판 목록 불러오기 시작 ------
//	//전체 게시판 목록 dao에서 최신순으로 가져옴
//	public List<CommunityPostListDto> readEntirePostCreateTimeDesc(){ //select 해온걸 dto타입으로 변환
//		log.debug("readTotalPostEntire()");
//		List<Post> list = communityDao.selectEntireOrderByCreatedTimeDesc();
//		log.debug(list.toString());
//		return list.stream()
//				.map(CommunityPostListDto::fromEntity)
//				.toList();
//	}
//	
//	//전체 게시판 목록 dao에서 인기순으로 가져옴
//	public List<CommunityPostListDto> readEntirePostGoodDesc(){
//		log.debug("readEntirePostGood()");
//		List<Post> list = communityDao.selectEntireOrderByGoodDesc();
//		log.debug(list.toString());
//		return list.stream()
//				.map(CommunityPostListDto::fromEntity)
//				.toList();
//	}
//	
//	//여행 메이트 게시판 목록 dao에서 최신순으로 가져옴
//	public List<CommunityPostListDto> readMatePostCreateTimeDesc(){
//		log.debug("readMatePostCreateTimeDesc()");
//		List<Post> list = communityDao.selectMateOrderByCreatedTimeDesc();
//		log.debug(list.toString());
//		return list.stream()
//				.map(CommunityPostListDto::fromEntity)
//				.toList();		
//	}
//	
//	//여행 메이트 게시판 목록 dao에서 인기순으로 가져옴
//	public List<CommunityPostListDto> readMatePostGoodDesc(){
//		log.debug("readMatePostGoodDesc()");
//		List<Post> list = communityDao.selectMateOrderByGoodDesc();
//		log.debug(list.toString());
//		return list.stream()
//				.map(CommunityPostListDto::fromEntity)
//				.toList();		
//	}
//	
//	//자유 게시판 목록 dao에서 최신순으로 가져옴
//	public List<CommunityPostListDto> readFreePostCreateTimeDesc(){
//		log.debug("readFreePostCreateTimeDesc()");
//		List<Post> list = communityDao.selectFreeOrderByCreatedTimeDesc();
//		log.debug(list.toString());
//		return list.stream()
//				.map(CommunityPostListDto::fromEntity)
//				.toList();		
//	}
//	
//	//자유 게시판 목록 dao에서 인기순으로 가져옴
//	public List<CommunityPostListDto> readFreePostGoodDesc(){
//		log.debug("readFreePostCreateTimeDesc()");
//		List<Post> list = communityDao.selectFreeOrderByGoodDesc();
//		log.debug(list.toString());
//		return list.stream()
//				.map(CommunityPostListDto::fromEntity)
//				.toList();		
//	}
//	//-----게시판 : 전체/여행메이트/자유 게시판 목록 불러오기 끝 ------
//	
//	//--------------------랭킹 시작 --------------------
//	public List<CommunityRankingDto> readRankingLikeUserTop3() {
//		log.debug("readRankingLikeUserTop3()");
//		List<CommunityRankingDto> list = communityDao.selectLikeUserTop3();
//		log.debug(list.toString());
//		return list;
//		
//	}
//	//--------------------랭킹 끝---------------------------
//	
//	//---------------------검색 시작------------------------
//	//TODO : 검색 해보기
//    public List<CommunityPostListDto> searchIdDesc(CommunityPostSearchDto dto) {
//        log.debug("search({})", dto);
//        
//        List<Post> searchList = communityDao.searchKeywordOrderById2(dto);
//        log.debug("searchList({})", searchList);
//        return searchList.stream()
//                .map(CommunityPostListDto::fromEntity)
//                .toList();//->Post타입의 list를 CommunityPostListDto타입으로 변환해서 리턴함.
//    }
//	
//	//---------------------검색 끝------------------------
//
//    
//    
//    //-------------------페이징 시작-----------------------------
//    /**
//     * 특정 페이지와 페이지 크기를 기반으로 데이터를 가져오는 메서드
//     * @param page - 현재 페이지 번호
//     * @param pageSize - 페이지당 항목 수
//     * @return 페이징된 데이터 리스트
//     */
//    public List<Post> getPagedNewAllPosts(int page, int pageSize) {
//        int offset = (page - 1) * pageSize; // 시작 행 번호를 계산합니다.
//        return communityDao.selectPagingEntireOrderByIdDesc(offset, pageSize); // DAO 인터페이스를 호출하여 데이터를 가져옵니다.
//    }
//
//    /**
//     * 총 게시물 수를 가져오는 메서드
//     * @return 총 게시물 수
//     */
//    public int getTotalPostCount() {
//        return communityDao.countPosts(); // DAO 인터페이스를 호출하여 총 게시물 수를 가져옵니다.
//    }
    //-------------------페이징 끝-------------------------------
}//서비스 클래스 끝
