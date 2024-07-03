package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.audiro.dto.TopDestinationDto;

@Mapper
public interface TopDestinationDao {
	List<TopDestinationDto> selectTopDestination();
}
