package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.audiro.dto.DetailedPlanDto;
import com.audiro.dto.TravelPlanDto;
import com.audiro.repository.DetailedPlan;
import com.audiro.repository.TravelPlan;
import com.audiro.repository.TravelPlanDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class TravelPlanService {
	
	private final TravelPlanDao travelPlanDao;
	
	@Transactional
	public int createPlan(TravelPlanDto dto) {
		TravelPlan plan = dto.toEntity();
		travelPlanDao.insertTravelPlan(plan);
		int travelPlanId=plan.getTravelPlanId();
		return travelPlanId;
	}
	
	@Transactional
	public int createDetailedPlan(List<DetailedPlanDto> dto) {
		List<DetailedPlan> detailedPlans=dto.stream().map(DetailedPlanDto::toEntity).toList();
		log.debug("service");
		
		int result = 0;
		for(DetailedPlan item : detailedPlans) {
			result += travelPlanDao.insertDetailedPlan(item);
		}
		
		return result;
	}
	
}
