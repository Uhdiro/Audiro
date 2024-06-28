package com.audiro.dto;

import com.audiro.repository.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class UserDto {
	private Integer usersId;
	private String id;
	private String passwordHash;
	private String userName;
	private String nickname;
	private String phone;
	private String email;
	
	public static UserDto fromEntity(User user) {
		return UserDto.builder()
				.usersId(user.getUsersId())
				.id(user.getId())
				.passwordHash(user.getPasswordHash())
				.userName(user.getUserName())
				.nickname(user.getNickname())
				.phone(user.getPhone())
				.email(user.getEmail())
				.build();
	}
	
	public User toEntity() {
		return User.builder()
				.id(id)
				.passwordHash(passwordHash)
				.userName(userName)
				.nickname(nickname)
				.phone(phone)
				.email(email)
				.build();
	}
}
