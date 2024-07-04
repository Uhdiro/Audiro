package com.audiro.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.audiro.service.FavoriteDestinationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/travel")
public class TravelPlanController {

	private final FavoriteDestinationService favService;

	@GetMapping("/plan")
	public void plan() {
		
	}

}
