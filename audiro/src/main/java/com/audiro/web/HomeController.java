package com.audiro.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.TopDestinationDto;
import com.audiro.service.TopService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final TopService topService;
	
	@GetMapping("/")
	public String list(Model model) {
		List<TopDestinationDto> topDestination = topService.getTopDestination();
		log.debug("top destination:{}", topDestination);
		model.addAttribute("topDestination", topDestination);
		return "home";
	}
	
	@GetMapping("/api/favorite/{travelDestinationId}/{signedInUser}")
	@ResponseBody
	public ResponseEntity<Integer> apiFavorite(@PathVariable Integer travelDestinationId,
			@PathVariable String signedInUser) {
		log.debug("apiFavorite(travelDestinationId={}, signedInUser={})", 
				travelDestinationId, signedInUser);
		
		FavoriteStateReqDto dto = new FavoriteStateReqDto(travelDestinationId, signedInUser);
		Integer id = topService.getFavoriteState(dto);
		log.debug("id = {}", id);
		
		return ResponseEntity.ok(id != null ? id : -1);
	}
	
	@PostMapping("/api/favorite/update")
	@ResponseBody
	public ResponseEntity<Void> updateFavorite(@RequestBody FavoriteUpdateReqDto reqDto) {
	    log.debug("updateFavorite(reqDto={})", reqDto);

	    if (reqDto.getTravelDestinationId() == null) {
	        log.error("travelDestinationId is null");
	        return ResponseEntity.badRequest().build();
	    }

	 // 현재 유저와 여행지의 즐겨찾기 상태 확인
	    boolean isCurrentlyFavorite = topService.isFavorite(reqDto.getSignedInUser(), reqDto.getTravelDestinationId());
	    log.debug("Current favorite state: {}", isCurrentlyFavorite);

	 // 디버그 로그 추가: isFavorite 값 확인
	    log.debug("Requested favorite state: {}", reqDto.getIsFavorite());

	    if ((reqDto.getIsFavorite() == 1) == isCurrentlyFavorite) {
	        log.warn("No change in favorite state, skipping update.");
	        return ResponseEntity.ok().build();
	    }

	    if (reqDto.getIsFavorite() == 1) {
	        log.debug("Inserting favorite: {}", reqDto);
	        topService.addFavorite(reqDto);
	    } else {
	        log.debug("Deleting favorite: {}", reqDto);
	        topService.removeFavorite(reqDto);
	    }
	    return ResponseEntity.ok().build();
	}
	
}
