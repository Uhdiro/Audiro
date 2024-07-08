package com.audiro.repository;


import org.apache.ibatis.annotations.Param;

public interface TravelPlanDao {

	Long insertTravelPlan(@Param("plan") TravelPlan plan);
	
	int insertDetailedPlan(DetailedPlan detailedPlan);
	

}
