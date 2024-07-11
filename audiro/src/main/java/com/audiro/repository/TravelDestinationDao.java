package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TravelDestinationDao {

	int saveAll(TravelDestination destination);
	
	List<TravelDestination> findAll();
	
	TravelDestination selectAllById(Integer id);
	
	List<TravelDestination> selectNameAndImgUrlByTagsAndKeyword(
			String[] region, String[] theme, String[] companion, String keyword,
			int offset, int limit
	);
	
	int countDestinations(
			String[] region, String[] theme, String[] companion, String keyword
	);

}
