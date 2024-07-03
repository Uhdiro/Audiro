package com.audiro.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.audiro.dto.FavoriteDestinationDto;
import com.audiro.dto.FavoritePostDto;
import com.audiro.dto.FavoriteUsersDto;
import com.audiro.service.FavoriteService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/favorite")
public class FavoriteController {
	
	private final FavoriteService favoriteService;
	
	@GetMapping("/list")
	public void list(Model model) {
		List<FavoriteUsersDto> favoriteUsers = favoriteService.readUsers();
		List<FavoriteDestinationDto> favoriteDestinations = favoriteService.readDestination();
		List<FavoritePostDto> favoritePost = favoriteService.readPost();
		
		model.addAttribute("favoriteUsers", favoriteUsers);
		model.addAttribute("favoriteDestination", favoriteDestinations);
		model.addAttribute("favoritePost", favoritePost);
	}	
}
