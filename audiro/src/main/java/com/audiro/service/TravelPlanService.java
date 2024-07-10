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
	
	public List<TravelPlan> readAllTravelPlan() {
		List<TravelPlan> list=travelPlanDao.selectAllTrvaelPlan();
		return list;
	}
	
	public List<TravelPlan> readAllTravelPlanOrderByDesc(){
		List<TravelPlan> list=travelPlanDao.selectAllTrvaelPlanOrderByDesc();
		return list;
	}
	
	public TravelPlan readTravelPlanById(int travelPlanId) {
		TravelPlan plan=travelPlanDao.selectTravelPlanById(travelPlanId);
		return plan;
	}
	
	public List<DetailedPlanDto> readDetailedPlanByTravelPlanId(int travelPlanId) {
		List<DetailedPlanDto> list=travelPlanDao.selectDetailedPlan(travelPlanId);
		return list;
	}
	
	public int getMaxDay(int travelPlanId) {
		int result=travelPlanDao.selectMaxDay(travelPlanId);
		return result;
	}
	
	public int updateTravelPlan(TravelPlanDto dto) {
		int result= travelPlanDao.updateTravelPlan(dto.toEntity());
		return result;
	}
	
	public int deleteAllDetailedPlan(int travelPlanId) {
		int result=travelPlanDao.deleteAllDetailedPlan(travelPlanId);
		return result;
	}
	
	public int deletePlanById(int travelPlanId) {
		int result=travelPlanDao.deletePlanById(travelPlanId);
		return result;
	}
}
