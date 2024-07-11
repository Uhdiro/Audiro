package com.audiro.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.repository.Post;
import com.audiro.service.CommunityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController //->리턴값은 뷰(jsp)의 이름이 아니라 클라이언트(브라우저)로 직접 전달하는 데이터.
@RequestMapping
public class CommunityRestController {
	private final CommunityService communityService;
	
	//---------------페이징 처리 시작 ------------------------------
	//전체(여행+자유) 게시판 최신순 정렬.
    @GetMapping("/community/api/postsAllRecent")//->브라우저로 이 요청주소로 Get방식으로 들어가는 용도가 아님.
    //일반컨트롤러에 매핑되어있는 다른url과 연결된 뷰(jsp)와 연결된 자바스크립트에서 여기서 보낸 데이터를 받아 비동기 방식으로 원하는 대로 조작하기 위한 용도.
    //->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostAllRecent(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        //pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠. 필요에 맞게 개발자의 임의로 설정하면 된다.)
    	int pageSize = 10;
    	//페이징 처리해서 전체(여행+자유)게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts = communityService.getSelectPagingAllNewOrderByIdDesc(page, pageSize);
        //전체 페이지 수
        int totalPages = communityService.getTotalPages(pageSize);

        Map<String, Object> response = new HashMap<>();
        //response객체에 저장함
        response.put("posts", posts);
        response.put("totalPages", totalPages);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        return response;
    }


    //여행메이트 게시판 최신순 정렬
    @GetMapping("/community/api/postsMateRecent")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostMateNew(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getPostMateNew()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 10;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts2 = communityService.getSelectPagingMateOrderByIdDesc(page, pageSize);
        log.debug(posts2.toString());
        //전체 페이지 수
        int totalPages2 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages2);
        
        Map<String, Object> response2 = new HashMap<>();
        //response객체에 저장함
        response2.put("posts2", posts2);
        response2.put("totalPages2", totalPages2);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response2 : {}", response2);
        return response2;
    }
    
    //자유 게시판 최신순 정렬
    @GetMapping("/community/api/postsFreeRecent")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostFreeNew(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getPostFreeNew()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 10;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts3 = communityService.getSelectPagingFreeOrderByIdDesc(page, pageSize);
        log.debug(posts3.toString());
        //전체 페이지 수
        int totalPages3 = communityService.getFreePages(pageSize);
        log.debug("totalPages3: {}",totalPages3);
        
        Map<String, Object> response3 = new HashMap<>();
        //response객체에 저장함
        response3.put("posts3", posts3);
        response3.put("totalPages3", totalPages3);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response3 : {}", response3);
        return response3;
    }
    
    
	//전체(여행+자유) 게시판 인기순 정렬.
    @GetMapping("/community/api/postsAllPopularity")//->브라우저로 이 요청주소로 Get방식으로 들어가는 용도가 아님.
    //일반컨트롤러에 매핑되어있는 다른url과 연결된 뷰(jsp)와 연결된 자바스크립트에서 여기서 보낸 데이터를 받아 비동기 방식으로 원하는 대로 조작하기 위한 용도.
    //->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostAllPopularity(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        //pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠. 필요에 맞게 개발자의 임의로 설정하면 된다.)
    	int pageSize = 10;
    	//페이징 처리해서 전체(여행+자유)게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts4 = communityService.getSelectPagingAllOrderByGoodDesc(page, pageSize);
        //전체 페이지 수
        int totalPages4 = communityService.getTotalPages(pageSize);

        Map<String, Object> response4 = new HashMap<>();
        //response4객체에 저장함
        response4.put("posts4", posts4);
        response4.put("totalPages4", totalPages4);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        return response4;
    }
    
    
	//여행메이트 게시판 인기순 정렬.
    @GetMapping("/community/api/postsMatePopularity")//->브라우저로 이 요청주소로 Get방식으로 들어가는 용도가 아님.
    //일반컨트롤러에 매핑되어있는 다른url과 연결된 뷰(jsp)와 연결된 자바스크립트에서 여기서 보낸 데이터를 받아 비동기 방식으로 원하는 대로 조작하기 위한 용도.
    //->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostMatePopularity(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        //pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠. 필요에 맞게 개발자의 임의로 설정하면 된다.)
    	int pageSize = 10;
    	//페이징 처리해서 전체(여행+자유)게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts5 = communityService.getSelectPagingMateOrderByGoodDesc(page, pageSize);
        //전체 페이지 수
        int totalPages5 = communityService.getMatePages(pageSize);

        Map<String, Object> response5 = new HashMap<>();
        //response4객체에 저장함
        response5.put("posts5", posts5);
        response5.put("totalPages5", totalPages5);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        return response5;
    }
    
    
	//자유 게시판 인기순 정렬.
    @GetMapping("/community/api/postsFreePopularity")//->브라우저로 이 요청주소로 Get방식으로 들어가는 용도가 아님.
    //일반컨트롤러에 매핑되어있는 다른url과 연결된 뷰(jsp)와 연결된 자바스크립트에서 여기서 보낸 데이터를 받아 비동기 방식으로 원하는 대로 조작하기 위한 용도.
    //->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostFreePopularity(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        //pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠. 필요에 맞게 개발자의 임의로 설정하면 된다.)
    	int pageSize = 10;
    	//페이징 처리해서 전체(여행+자유)게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts6 = communityService.getSelectPagingFreeOrderByGoodDesc(page, pageSize);
        //전체 페이지 수
        int totalPages6 = communityService.getFreePages(pageSize);

        Map<String, Object> response6 = new HashMap<>();
        //response4객체에 저장함
        response6.put("posts6", posts6);
        response6.put("totalPages6", totalPages6);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        return response6;
    }
    
  //---------------페이징 처리 끝 ------------------------------
    
    
    
   // 여행메이트 게시판 리스트
    //여행메이트 게시판 최신순 정렬
    @GetMapping("/community/mateNewList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getMateNew(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getMateNew()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts2 = communityService.getSelectPagingMateOrderByIdDesc(page, pageSize);
        log.debug(posts2.toString());
        //전체 페이지 수
        int totalPages2 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages2);
        
        Map<String, Object> response2 = new HashMap<>();
        //response객체에 저장함
        response2.put("posts2", posts2);
        response2.put("totalPages2", totalPages2);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response2 : {}", response2);
        return response2;
    }
    
    // 여행메이트 게시판 리스트
    //여행메이트 게시판 인기순 정렬
    @GetMapping("/community/matePopularityList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getMateGood(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getMateGood()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts5 = communityService.getSelectPagingMateOrderByGoodDesc(page, pageSize);
        log.debug(posts5.toString());
        //전체 페이지 수
        int totalPages5 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages5);
        
        Map<String, Object> response5 = new HashMap<>();
        //response객체에 저장함
        response5.put("posts5", posts5);
        response5.put("totalPages5", totalPages5);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response5 : {}", response5);
        return response5;
    }
    
    // 자유 게시판 리스트
    //자유 게시판 최신순 정렬
    @GetMapping("/community/freeNewList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getFreeNew(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getFreeNew()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts2 = communityService.getSelectPagingFreeOrderByIdDesc(page, pageSize);
        log.debug(posts2.toString());
        //전체 페이지 수
        int totalPages2 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages2);
        
        Map<String, Object> response2 = new HashMap<>();
        //response객체에 저장함
        response2.put("posts2", posts2);
        response2.put("totalPages2", totalPages2);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response2 : {}", response2);
        return response2;
    }
    
    // 자유 게시판 리스트
    // 자유 게시판 인기순 정렬
    @GetMapping("/community/freePopularityList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getFreeGood(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getFreeGood()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts5 = communityService.getSelectPagingFreeOrderByGoodDesc(page, pageSize);
        log.debug(posts5.toString());
        //전체 페이지 수
        int totalPages5 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages5);
        
        Map<String, Object> response5 = new HashMap<>();
        //response객체에 저장함
        response5.put("posts5", posts5);
        response5.put("totalPages5", totalPages5);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response5 : {}", response5);
        return response5;
    }
    
}
