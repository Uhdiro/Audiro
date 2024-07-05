package com.audiro.dto;

import java.sql.Timestamp;
import java.sql.Date;
import java.util.List;

import com.audiro.repository.TravelPlan;

import lombok.Data;

@Data
public class TravelPlanDto {
	private int travelPlanId; // travel_plan_id
	private Integer usersId;
	private String title;
	private Date startDate;
	private Integer duration;
	private Date endDate;
	
	public TravelPlan toEntity() {
		return TravelPlan.builder()
				.travelPlanId(travelPlanId)
				.usersId(usersId)
				.title(title)
				.startDate(startDate)
				.duration(duration)
				.endDate(endDate)
				.build();
	}
}
