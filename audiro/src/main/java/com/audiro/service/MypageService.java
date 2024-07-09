package com.audiro.service;

import org.springframework.stereotype.Service;

import com.audiro.dto.MypageDto;
import com.audiro.repository.MypageDao;
import com.audiro.repository.ProfileDao;
import com.audiro.repository.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MypageService {
	private final MypageDao mypageDao;
	
	public MypageDto selectUsersAllProfileAllById(String id) {
		log.debug("selectUsersAllProfileAllById(id:{})",id);
		MypageDto dto = mypageDao.selectUsersAllProfileAllById(id);
		log.debug(dto.toString());
		return dto;
	}

}
