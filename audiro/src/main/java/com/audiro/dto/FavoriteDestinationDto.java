package com.audiro.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class FavoriteDestinationDto {
	private Integer favoriteDestinationId;
	private Integer usersId;
	private Integer destinationId;
	private String name;
	private String imgUrl;
}
