package com.audiro.repository;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.audiro.dto.DetailedPlanDto;

public interface TravelPlanDao {

	Long insertTravelPlan(@Param("plan") TravelPlan plan);

	int insertDetailedPlan(DetailedPlan detailedPlan);

	List<TravelPlan> selectAllTrvaelPlan();

	TravelPlan selectTravelPlanById(int travelPlanId);

	List<DetailedPlanDto> selectDetailedPlan(int travelPlanId);
	
	Integer selectMaxDay(int travelPlanId);
	
	Integer updateTravelPlan(TravelPlan plan);
	
	Integer deleteAllDetailedPlan(int travelPlanId);
}
