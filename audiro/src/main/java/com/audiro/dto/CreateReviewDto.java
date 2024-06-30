package com.audiro.dto;

import com.audiro.repository.Post;

import lombok.Data;

// 여행후기 글 작성 요청파라미터 저장하기 위한 DTO
@Data
public class CreateReviewDto {
	
	private Integer usersId;
	private Integer postTypeId;
	private String title;
	private String content;
	
	public Post toEntoty() {
		return Post.builder().usersId(usersId).postTypeId(postTypeId)
				.title(title).content(content).build();
		
	}

}
