package com.audiro.dto;

import com.audiro.repository.FavoriteDestination;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class FavoriteDestinationDto {

	private Integer favoriteDestinationId;
	private Integer usersId;
	private Integer destinationId;
	private String favoriteDestination;
	
	public static FavoriteDestinationDto fromEntity(FavoriteDestination favoritedestination) {
		return FavoriteDestinationDto.builder()
				.favoriteDestinationId(favoritedestination.getFavoriteDestinationId())
				.usersId(favoritedestination.getUsersId())
				.destinationId(favoritedestination.getDestinationId())
				.favoriteDestination(favoritedestination.getFavoriteDestination())
				.build();
	}
	
}
