package com.example.P20_CRUD.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.P20_CRUD.Entity.AddToCart;

@Repository
public interface AddToCartRepository extends JpaRepository<AddToCart, Integer> {

	int getcardId(int tripId, int userId);
    // Custom query methods can be added here if needed
}