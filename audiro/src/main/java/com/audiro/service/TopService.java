package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.TopDestinationDto;
import com.audiro.repository.TopDestinationDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TopService {

	private final TopDestinationDao topDestinationDao;
	
	public List<TopDestinationDto> getTopDestination() {
		return topDestinationDao.selectTopDestination();
	}
}
