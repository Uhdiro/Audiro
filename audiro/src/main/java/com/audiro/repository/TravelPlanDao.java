package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.audiro.dto.DetailedPlanDto;

public interface TravelPlanDao {

	Long insertTravelPlan(@Param("plan") TravelPlan plan);
	
	int insertDetailedPlan(DetailedPlan detailedPlans);
	

}
