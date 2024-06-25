package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.repository.FavoriteDestination;
import com.audiro.repository.FavoriteDestinationDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FavoriteDestinationService {

	private final FavoriteDestinationDao dao;

	public List<FavoriteDestination> readAll() {
		List<FavoriteDestination> list = dao.selectOrderById();
		return list;
	}
}
