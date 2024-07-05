package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.TopDestinationDto;
import com.audiro.repository.TopDestinationDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class TopService {

	private final TopDestinationDao topDestinationDao;
	
	public List<TopDestinationDto> getTopDestination() {
		return topDestinationDao.selectTopDestination();
	}
	
	public Integer getFavoriteState(FavoriteStateReqDto dto) {
		return topDestinationDao.selectFavoriteState(dto);
	}
	
	public void addFavorite(FavoriteUpdateReqDto dto) {
		log.debug("Adding favorite for user: {} and destination: {}", dto.getSignedInUser(), dto.getTravelDestinationId());
        
        try {
            topDestinationDao.insertFavorite(dto);
        } catch (Exception e) {
            log.error("Error inserting favorite", e);
        }
    }

    public void removeFavorite(FavoriteUpdateReqDto dto) {
    		log.debug("Removing favorite for user: {} and destination: {}", dto.getSignedInUser(), dto.getTravelDestinationId());
        try {
            topDestinationDao.deleteFavorite(dto);
        } catch (Exception e) {
            log.error("Error deleting favorite", e);
        }
    }
	
	public boolean isFavorite(String signedInUser, Integer travelDestinationId) {
        Integer favoriteId = topDestinationDao.selectFavoriteState(
                new FavoriteStateReqDto(travelDestinationId, signedInUser)
        );
        return favoriteId != null;
    }
}
