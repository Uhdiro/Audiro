package com.audiro.dto;

import java.util.Set;

import lombok.Data;
@Data
public class LikeReviewDto {

	private Set<Integer> usersId;
	private Integer postId;
	
	
}
