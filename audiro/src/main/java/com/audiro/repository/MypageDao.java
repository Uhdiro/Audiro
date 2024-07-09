package com.audiro.repository;

import com.audiro.dto.MypageDto;

public interface MypageDao {
	//로그인 한 id로 users 모든 컬럼, profile의 모든 컬럼 select
	MypageDto selectUsersAllProfileAllById(String id);
	
	//로그인한 id로 비밀번호 변경. 
	int updatePasswordHash(MypageDto dto);
	
}
