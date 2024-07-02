package com.audiro.dto;

import com.audiro.repository.FavoritePost;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor @AllArgsConstructor @Builder
public class FavoritePostDto {
	private Integer favoritePostId;
	private Integer usersId;
	private Integer postId;
	private String favoritePostTitle;
	
	public static FavoritePostDto fromEntity(FavoritePost favoritepost) {
		return FavoritePostDto.builder()
				.favoritePostId(favoritepost.getFavoritePostId())
				.usersId(favoritepost.getUsersId())
				.postId(favoritepost.getPostId())
				.favoritePostTitle(favoritepost.getFavoritePostTitle())
				.build();
	}
}
