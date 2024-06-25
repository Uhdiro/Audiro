package com.audiro.web;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.repository.FavoriteDestination;
import com.audiro.service.FavoriteDestinationService;
import com.audiro.service.PlanService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/plan")
@RequiredArgsConstructor
public class PlanRestController {

	private final FavoriteDestinationService favService;

	@GetMapping("/fav")
	public List<FavoriteDestination> readAllFavoriteDestination() {
		 log.info("Fetching all favorite destinations");
		return favService.readAll();
		
	}
	
	
}
