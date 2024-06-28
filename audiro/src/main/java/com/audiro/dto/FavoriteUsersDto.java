package com.audiro.dto;

import com.audiro.repository.FavoriteUsers;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoriteUsersDto {

		private Integer favoriteUsersId;
		private Integer usersId;
		private Integer interestedUserId;
		private String interestedUserNickname;
		
		public static FavoriteUsersDto fromEntity(FavoriteUsers favoriteusers) {
			return FavoriteUsersDto.builder()
					.favoriteUsersId(favoriteusers.getFavoriteUsersId())
					.usersId(favoriteusers.getUsersId())
					.interestedUserId(favoriteusers.getInterestedUserId())
					.interestedUserNickname(favoriteusers.getInterestedUserNickname())
					.build();
		}
}
