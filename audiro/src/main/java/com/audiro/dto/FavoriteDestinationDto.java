package com.audiro.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoriteDestinationDto {
	private Integer favoriteDestinationId;
	private Integer usersId;
	private Integer destinationId;
	private String favoriteDestination;
	private String imgUrl;
	private String name;
	
}
