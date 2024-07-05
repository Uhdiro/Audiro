package com.audiro.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.audiro.repository.DetailedPlan;
import com.audiro.repository.TravelPlan;
import com.audiro.repository.TravelPlanDao;
import com.audiro.dto.DetailedPlanDto;
import com.audiro.dto.TravelPlanDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TravelPlanService {
	
	private final TravelPlanDao travelPlanDao;
	
	@Transactional
	public int createPlan(TravelPlanDto dto) {
		TravelPlan plan = dto.toEntity();
		travelPlanDao.insertTravelPlan(plan);
		int travelPlanId=plan.getTravelPlanId();
		return travelPlanId;
	}
	
	/*
	 * @Transactional public int createPlan(TravelPlanDto dto) { TravelPlan plan =
	 * TravelPlan.builder() .usersId(1) .title("JUnit test") .startDate(new
	 * Date(Timestamp.valueOf("2024-07-05 00:00:00").getTime())) .duration(2)
	 * .endDate(new Date(Timestamp.valueOf("2024-07-06 23:59:59").getTime()))
	 * .build(); Long result = travelPlanDao.insertTravelPlan(plan);
	 * log.debug("result={}, id={}", result, plan.getTravelPlanId()); }
	 */
	
	@Transactional
	public int createDetailedPlan(List<DetailedPlanDto> dto) {
		List<DetailedPlan> DetailedPlans=dto.stream().map(DetailedPlanDto::toEntity).toList();
		int result=travelPlanDao.insertDetailedPlan(DetailedPlans);
		return result;
	}
	
}
