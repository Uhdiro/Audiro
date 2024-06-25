package com.audiro.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/travel/plan")
public class PlanController {
	
	@GetMapping
	public void plan() {
		
	}
		
}
