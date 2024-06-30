package com.audiro.dto;

import java.time.LocalDateTime;

import com.audiro.repository.Post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class detailsReviewDto {
		
		private Integer postId;
		private Integer posttypeid;
		private Integer usersId;
		private String title;
		private String content;
		private LocalDateTime modifiedTime;
		
		public static detailsReviewDto fromEntity(Post post) {
			
			return detailsReviewDto.builder().postId(post.getPostId())
					.posttypeid(post.getPostTypeId())
					.usersId(post.getUsersId())
					.title(post.getTitle())
					.content(post.getContent())
					.modifiedTime(post.getModifiedTime())
					.build();
			
		}
	}

