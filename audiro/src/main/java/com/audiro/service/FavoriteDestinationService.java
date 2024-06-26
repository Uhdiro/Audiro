package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.repository.FavoriteDestinationDto;
import com.audiro.repository.FavoriteDestinationRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FavoriteDestinationService {

	private final FavoriteDestinationRepository repo;

	public List<FavoriteDestinationDto> readAll() {
		List<FavoriteDestinationDto> list = repo.selectAllOrderById();
		return list;
	}
}
