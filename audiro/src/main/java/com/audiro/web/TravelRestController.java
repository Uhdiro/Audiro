package com.audiro.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.dto.TravelDestinationListDto;
import com.audiro.service.TravelDestinationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/travel")
public class TravelRestController {
	
	private final TravelDestinationService destiService;
	
	@GetMapping("/search-tags")
	@ResponseBody
	public ResponseEntity<List<TravelDestinationListDto>> searchByTags(
			@RequestParam(name = "region", required = false) String[] regions,
			@RequestParam(name = "theme", required = false) String[] themes,
			@RequestParam(name = "companion", required = false) String[] companions) {
		
		List<TravelDestinationListDto> dto = destiService.searchByTags(regions, themes, companions);
		
		return ResponseEntity.ok(dto);
	}
}
