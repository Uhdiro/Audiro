package com.audiro.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor @Builder
public class FavoritePost {
	private Integer favoritePostId;
	private Integer usersId;
	private Integer postId;
	private String favoritePostTitle;
}
