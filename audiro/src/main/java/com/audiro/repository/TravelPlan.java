package com.audiro.repository;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TravelPlan {
	private Integer travelPlanId;
	private Integer usersId;
	private String title;
	private Date startDate;
	private Integer duration;
	private Date endDate;
	private Integer isReviewed;
	private Timestamp createdTime;
	private Timestamp modifiedTime;
}
