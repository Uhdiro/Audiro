package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.audiro.dto.TopPostDto;

@Mapper
public interface TopPostDao {
	// 메인 인기 후기 
	List<TopPostDto> selectTopPost(); 

}
