package com.audiro.service;

import org.springframework.stereotype.Service;

import com.audiro.repository.User;
import com.audiro.repository.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
	
	private final UserDao userDao;
	
	// 아이디 중복 체크
	public boolean checkId(String id) {
		User user = userDao.selectById(id);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean checkNickname(String nickname) {
		User user = userDao.selectByNickname(nickname);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean checkPhone(String phone) {
		User user = userDao.selectByPhone(phone);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean checkEmail(String email) {
		User user = userDao.selectByEmail(email);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}
}
