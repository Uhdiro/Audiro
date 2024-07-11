package com.audiro.repository;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//DB 테이블 post_type의 Model 담당
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostType {

	private Integer postTypeId;
	private String type;
}
