package com.audiro.repository;

import jakarta.annotation.Generated;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
public class FavoriteDestination {
	@Id
	@GeneratedValue
	@Column(name = "favorite_destination_id")
	private Integer id;

	@ManyToOne
	@JoinColumn(name="users_id")
	@ToString.Exclude
	private Integer usersId;

	@ManyToOne
	@JoinColumn(name = "destination_id")
	@ToString.Exclude
	private Integer destinationId;
}
