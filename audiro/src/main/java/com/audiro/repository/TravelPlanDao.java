package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TravelPlanDao {

	Long insertTravelPlan(@Param("plan") TravelPlan plan);
	
	int insertDetailedPlan(List<DetailedPlan> detailedPlans);
	

}
