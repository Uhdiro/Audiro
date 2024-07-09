package com.audiro.web;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpStatus;
import com.audiro.dto.MypageDto;
import com.audiro.service.MypageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/mypage")
public class MypageRestController {
	
	private final MypageService mypageService;
	
	@PostMapping("/updatePassword")
    public ResponseEntity<String> updatePassword(@RequestBody MypageDto request) {
        // @RequestBody 어노테이션을 사용하여 요청 본문을 MypageDto 형태로 받습니다.
        log.debug("updatePassword()");
        log.debug("request{}",request);
        // 비밀번호 업데이트 로직을 수행합니다.
        int result = mypageService.updatePasswardHashById(request);
        
        if (result > 0) {
            // 비밀번호 업데이트가 성공한 경우
            return ResponseEntity.ok("비밀번호가 성공적으로 변경되었습니다."); // HTTP 200 OK 응답을 반환합니다.
        } else {
            // 비밀번호 업데이트가 실패한 경우
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("비밀번호 변경 중 오류가 발생했습니다.");
            // HTTP 500 Internal Server Error 응답을 반환합니다.
        }
    }
}
