package com.audiro.dto;

import com.audiro.repository.Post;

import lombok.Data;

// 여행후기 글 작성 요청파라미터 저장하기 위한 DTO
@Data
public class CreateReviewDto {
	
	private Integer postId;
	private String title;
	private String content;
	
	public Post toEntoty() {
		return Post.builder().postTypeId(postId)
				.title(title).content(content).build();
		
	}

}
