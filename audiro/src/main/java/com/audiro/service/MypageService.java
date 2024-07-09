package com.audiro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.audiro.dto.MypageDto;
import com.audiro.repository.MypageDao;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MypageService {
	private final MypageDao mypageDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//회원정보+프로필 불러오기
	public MypageDto selectUsersAllProfileAllById(String id) {
		log.debug("selectUsersAllProfileAllById(id:{})",id);
		MypageDto dto = mypageDao.selectUsersAllProfileAllById(id);
		log.debug(dto.toString());
		return dto;
	}
	
	//비밀번호 변경
	public int updatePasswardHashById(MypageDto dto) {
		log.debug("updatePasswardHashById(dto:{})",dto);
		
		// 비밀번호 암호화
		String password = passwordEncoder.encode(dto.getPasswordHash());
		dto.setPasswordHash(password);
		
		//DB에 업데이트
		int result = mypageDao.updatePasswordHash(dto);
		
		return result;
	}
	
	

}
