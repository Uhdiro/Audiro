package com.audiro.repository;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@ToString
public class TravelDestination {
	@Id
	@GeneratedValue
	private int travelDestinationId;
	
	private String name;
	private String description;
	private String phone;
	private String site;
	private String address;
	private Double latitude;
	private Double longitude;
	private String imgUrl;
	private String region;
	private String theme;
	private String companion;

}
