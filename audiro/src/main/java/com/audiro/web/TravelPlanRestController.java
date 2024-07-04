package com.audiro.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.dto.FavoriteDestinationDto;
import com.audiro.repository.FavoriteDestination;
import com.audiro.repository.TravelPlan;
import com.audiro.service.FavoriteDestinationService;
import com.audiro.service.TravelPlanService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/plan")
@RequiredArgsConstructor
public class TravelPlanRestController {

	private final FavoriteDestinationService favService;
	private final TravelPlanService planService;

	@GetMapping("/fav")
	public ResponseEntity<List<FavoriteDestinationDto>> readAllFavoriteDestination() {
		List<FavoriteDestinationDto> list = favService.readAll();
		return ResponseEntity.ok(list);
	}

	@GetMapping("/fav/{favoriteDestinationId}")
	public ResponseEntity<FavoriteDestinationDto> favoriteDestinationId(@PathVariable int favoriteDestinationId) {
		FavoriteDestinationDto dto=favService.readById(favoriteDestinationId);
		return ResponseEntity.ok(dto);
	}
	
	@PostMapping("/create")
	public ResponseEntity<Integer> savePlan(TravelPlan plan){
		int result=planService.createPlan(plan);
		return ResponseEntity.ok(result);
	}
	
}
