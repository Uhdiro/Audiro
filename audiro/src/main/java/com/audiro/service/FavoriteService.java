package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.FavoriteUsersDto;
import com.audiro.repository.FavoriteUsers;
import com.audiro.repository.FavoriteUsersDao;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class FavoriteService {
	
	private final FavoriteUsersDao favoriteUsersDao;
	
	public List<FavoriteUsersDto> read() {
		List<FavoriteUsers> list = favoriteUsersDao.selectFavoriteUsers();
		return list.stream()
				.map(FavoriteUsersDto::fromEntity)
				.toList();
	}
}
