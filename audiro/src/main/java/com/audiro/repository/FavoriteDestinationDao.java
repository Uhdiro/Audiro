package com.audiro.repository;

import java.util.List;

import com.audiro.dto.FavoriteDestinationDto;


public interface FavoriteDestinationDao {

	List<FavoriteDestinationDto> selectAllOrderById();
	
	FavoriteDestinationDto selectById(Integer favoriteDestinationId);
}
