package com.audiro.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TravelDestination {
	private int TravelDestinationId;
	private String name;
	private String description;
	private String phone;
	private String site;
	private String address;
	private Double latitude;
	private Double longitude;
	private String imgUrl;

}
