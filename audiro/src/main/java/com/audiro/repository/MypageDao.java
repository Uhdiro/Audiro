package com.audiro.repository;

import com.audiro.dto.MypageDto;

public interface MypageDao {

	MypageDto selectUsersAllProfileAllById(String id);
	
}
