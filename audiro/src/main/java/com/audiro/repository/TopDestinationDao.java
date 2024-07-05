package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.TopDestinationDto;

@Mapper
public interface TopDestinationDao {
	List<TopDestinationDto> selectTopDestination();
	
	Integer selectFavoriteState(FavoriteStateReqDto dto);
	void insertFavorite(FavoriteUpdateReqDto dto);
    void deleteFavorite(FavoriteUpdateReqDto dto);
}
