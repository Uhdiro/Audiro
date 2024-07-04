package com.audiro.service;

import org.springframework.stereotype.Service;

import com.audiro.repository.TravelPlanDao;
import com.audiro.repository.TravelPlan;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TravelPlanService {
	
	private final TravelPlanDao dao;
	
	public int createPlan(TravelPlan plan) {
		return dao.insertPlan(plan);
	}
}
