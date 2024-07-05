package com.audiro.dto;

import java.sql.Timestamp;

import com.audiro.repository.DetailedPlan;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class DetailedPlanDto {
	private Integer travelPlanId;
	private Integer destinationId;
	private Integer day;
	private Timestamp startTime;
	private Timestamp endTime;
	
	public DetailedPlan toEntity() {
		return DetailedPlan.builder()
				.travelPlanId(travelPlanId)
				.destinationId(destinationId)
				.day(day)
				.startTime(startTime)
				.endTime(endTime)
				.build();
	}
}
