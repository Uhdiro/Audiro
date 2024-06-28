package com.audiro.dto;

import java.time.LocalDateTime;

import com.audiro.repository.Post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MyReviewListDto {
	
	private Integer postId;
	private Integer posttypeid;
	private Integer usersId;
	private String title;
	private LocalDateTime modifiedTime;
	
	public static MyReviewListDto fromEntity(Post post) {
		return MyReviewListDto.builder()
				.postId(post.getPostId())
				.posttypeid(post.getPostTypeId())
				.usersId(post.getUsersId())
				.title(post.getTitle())
				.modifiedTime(post.getModifiedTime())
				.build();
	}
}
