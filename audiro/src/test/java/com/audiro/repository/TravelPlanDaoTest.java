package com.audiro.repository;

import java.sql.Date;
import java.sql.Timestamp;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)
public class TravelPlanDaoTest {

	@Autowired
	private TravelPlanDao travelPlanDao;
	
	//@Test
	public void testInsertTravelPlanDao() {
		TravelPlan plan = TravelPlan.builder()
				.usersId(1)
				.title("JUnit test")
				.startDate(new Date(Timestamp.valueOf("2024-07-05 00:00:00").getTime()))
				.duration(2)
				.endDate(new Date(Timestamp.valueOf("2024-07-06 23:59:59").getTime()))
				.build();
		Long result = travelPlanDao.insertTravelPlan(plan);
		log.debug("result={}, id={}", 
				result,
				plan.getTravelPlanId());
	}
	
}
