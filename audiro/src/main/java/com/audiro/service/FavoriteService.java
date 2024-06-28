package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.FavoriteDestinationDto;
import com.audiro.dto.FavoritePostDto;
import com.audiro.dto.FavoriteUsersDto;
import com.audiro.repository.FavoriteDestination;
import com.audiro.repository.FavoriteDestinationDao;
import com.audiro.repository.FavoritePost;
import com.audiro.repository.FavoritePostDao;
import com.audiro.repository.FavoriteUsers;
import com.audiro.repository.FavoriteUsersDao;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class FavoriteService {
	
	private final FavoriteUsersDao favoriteUsersDao;
	private final FavoriteDestinationDao favoriteDestinationDao;
	private final FavoritePostDao favoritePostDao;
	
	public List<FavoriteUsersDto> readUsers() {
		List<FavoriteUsers> list = favoriteUsersDao.selectFavoriteUsers();
		return list.stream()
				.map(FavoriteUsersDto::fromEntity)
				.toList();
	}
	
	public List<FavoriteDestinationDto> readDestination() {
		List<FavoriteDestination> list = favoriteDestinationDao.selectFavoriteDestination();
		return list.stream()
				.map(FavoriteDestinationDto::fromEntity)
				.toList();
	}
	
	public List<FavoritePostDto> readPost() {
		List<FavoritePost> list = favoritePostDao.selectFavoritePost();
		return list.stream()
				.map(FavoritePostDto::fromEntity)
				.toList();
	}
	
}
	
	
