package com.audiro.service;

import org.springframework.stereotype.Service;

import com.audiro.repository.ProfileDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ProfileService {

	private final ProfileDao profileDao; // 생성자에 의한 의존성 주입

}
