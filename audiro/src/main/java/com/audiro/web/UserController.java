package com.audiro.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.audiro.dto.UserDto;
import com.audiro.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/user")
public class UserController {
	
	private final UserService userService;
	
	@GetMapping("/signup")
	public void signup() {

	}
	
	@PostMapping("/signup")
	public String signUp(UserDto dto) {
		userService.signup(dto);
		
		return "redirect:/user/signin";
	}
	
	@GetMapping("/signin")
	public void signin() {
		
	}
}
