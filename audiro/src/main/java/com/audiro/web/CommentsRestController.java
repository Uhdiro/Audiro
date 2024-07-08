package com.audiro.web;

import com.audiro.dto.CommentCreateDto;
import com.audiro.dto.CommentItemDto;
import com.audiro.repository.Comment;
import com.audiro.repository.CommentDao;
import com.audiro.service.CommentsService;
import com.audiro.dto.CommentUpdateDto;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController // 리턴하는 값은 뷰 이름이 아니라, 클라이언트로 직접 전송(응답)되는 데이터.
@RequestMapping("/api/comment")
public class CommentsRestController {
	private final CommentsService commentsService; // 생성자에 의한 의존성 주입
	
	public final CommentDao commentDao;
	
	//댓글불러오기
	@GetMapping("/{postId}")
	public List<CommentItemDto> selectByPostId(@PathVariable(value = "postId") Integer postId) {
		return commentsService.selectByPostId(postId);
	}
	
	//대댓글등록
	@PostMapping("/")
	public ResponseEntity<Integer> insertComment(@RequestBody CommentCreateDto dto) {
		log.debug("insertComment={}",dto);
		
		int result = commentDao.insert(dto);
		return ResponseEntity.ok(result);
	}
	
	//새댓글등록
	@PostMapping("/new")
	public ResponseEntity<Integer> newInsertComment(@RequestBody CommentCreateDto dto) {
		
		int result = commentDao.newInsert(dto);
		return ResponseEntity.ok(result);
	}
	
	// 댓글 수정
	@PutMapping("/{commentsId}")
	public ResponseEntity<Integer> updateComment(@PathVariable int commentsId,
            									 @RequestBody CommentUpdateDto dto) {
        log.debug("updateComment(id={}, dto={})", commentsId, dto);
        
        dto.setCommentsId(commentsId);
        int result = commentsService.update(dto); 
        
        return ResponseEntity.ok(result);
    }
	
	
	

}