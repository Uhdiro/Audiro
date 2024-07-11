package com.audiro.repository;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//DB 테이블 draft_post의 Model 담당
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DraftPost {
	private Integer draftPostId; //pk
	private Integer typeId; //fk ->post_type_id
	private String title; //DB에 40글자만 입력가능-> 자바스크립트로 막아야함
	private Integer usersId;//fk 
	private String content;
	private LocalDateTime modifiedTime;

}
