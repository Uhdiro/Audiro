package com.audiro.repository;

import java.util.List;
import com.audiro.dto.FavoriteDestinationDto;

public interface FavoriteDestinationDao {
	List<FavoriteDestination> selectFavoriteDestination();
	List<FavoriteDestinationDto> selectAllOrderById();
	FavoriteDestinationDto selectById(int favoriteDestinationId);
	

}
