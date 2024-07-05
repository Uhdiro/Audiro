package com.audiro.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.audiro.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
//@RequestMapping("/mypage")
public class MypageController {
	
	//지워야될 코드
	@GetMapping("/")
	public String home() {
		log.debug("home()");
		return "home";
	}

	@GetMapping("/mypage")
	public String mypage() {
		log.debug("mypage()");
		return "mypage/mypage";
	}
	
	@GetMapping("/mypage/modifypage")
	public String modify() {
		log.debug("modify()");
		return "mypage/modifypage";
	}
	
	@PostMapping("/mypage")
	public String update() {
		log.debug("update()");
		return "redirect:mypage"; // ?id=" + dto.getId()
	}

	@GetMapping("/mypage/profile")
	public String profile() {
		log.debug("profile()");
		
		return "mypage/profileupdate";
	}
	
}
