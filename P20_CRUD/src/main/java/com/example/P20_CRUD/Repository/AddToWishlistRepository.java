package com.example.P20_CRUD.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.P20_CRUD.Entity.AddToWishlist;

@Repository
public interface AddToWishlistRepository extends JpaRepository<AddToWishlist, Integer> {

	@Query("SELECT w.wishId FROM AddToWishlist w WHERE w.tripId = :tripId and w.userId=:i")
	int getWishid(int tripId, int i);
    // You can add custom query methods here if necessary
}

