package com.audiro.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.audiro.dto.MypageDto;
import com.audiro.service.MypageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MypageController {

	private final MypageService mypageService;
	@GetMapping("/mypage")
	public String mypage(@RequestParam(name = "id") String id, Model model) {
		log.debug("mypage(id:{})",id);
		
		MypageDto dto= mypageService.selectUsersAllProfileAllById(id);
		
		model.addAttribute("m", dto);
		
		return "/mypage/mypage";
	}
}
