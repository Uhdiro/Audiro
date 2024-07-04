package com.audiro.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.audiro.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/review/favorite")
public class FavoriteReviewController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping("/toggle")
    public ResponseEntity<String> toggleFavorite(@RequestParam(name= "usersId") Integer usersId, @RequestParam(name="postId") Integer postId) {
        boolean isFavorite = reviewService.toggleFavorite(usersId, postId);
        log.debug("usersId={},postId={}",usersId, postId);
        if (isFavorite) {
            return ResponseEntity.ok("Added to favorites");
        } else {
            return ResponseEntity.ok("Removed from favorites");
        }
    }
}
