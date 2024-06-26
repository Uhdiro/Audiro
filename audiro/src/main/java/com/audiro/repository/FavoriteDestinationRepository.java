package com.audiro.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FavoriteDestinationRepository extends JpaRepository<FavoriteDestination, Integer>{

	@Query("select f, t.name, t.imgUrl "
			+ "from FavoriteDestination f join TravelDestinaion t "
			+ "on f.destinationId = t.travelDestinationId "
			+ "order by f.id")
	List<Object[]> selectAllOrderById();
}
