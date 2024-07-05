package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TravelDestinationDao {

	int saveAll(TravelDestination destination);
	
	List<TravelDestination> findAll();
	
	TravelDestination selectAllById(Integer id);
	
	List<TravelDestination> selectNameAndImgUrlByTags(
			String[] region, String[] theme, String[] companion
	);
}
