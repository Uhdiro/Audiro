package com.audiro.web;

import java.lang.System.Logger;
import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.audiro.dto.TopDestinationDto;
import com.audiro.service.TopService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class TopController {
	
	private final TopService topService;
	
	@GetMapping("/")
	public String list(Model model) {
		List<TopDestinationDto> topDestination = topService.getTopDestination();
		log.debug("top destination:{}", topDestination);
		model.addAttribute("topDestination", topDestination);
		return "home";
	}
}
