package com.audiro.service;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.audiro.dto.TravelDestinationListDto;
import com.audiro.repository.TravelDestination;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)

public class TravelDestinationServiceTest {

	@Autowired
	private TravelDestinationService service;
	
//	@Test
	public void testFindAll() {
		List<TravelDestination> list =  service.findAll();
		Assertions.assertEquals(2, list.size());
	}
	
	@Test
	public void testSearchByTags() {
		String[] regions = { "광주" };
		String[] themes = { };
		String[] companions = { };
		String keyword = "펭귄";
		
		List<TravelDestinationListDto> dto =  service.searchByTagsAndKeyword(regions, themes, companions, keyword);
		
		Assertions.assertEquals(1, dto.size());;
		log.debug(dto.toString());
	}
}
