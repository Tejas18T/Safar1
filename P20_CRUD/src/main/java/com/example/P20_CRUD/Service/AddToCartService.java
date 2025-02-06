package com.example.P20_CRUD.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.P20_CRUD.Entity.AddToCart;
import com.example.P20_CRUD.Repository.AddToCartRepository;

import jakarta.transaction.Transactional;

@Transactional
@Service
public class AddToCartService {

	@Autowired
	AddToCartRepository carerepo;
	
	public AddToCart saveAddToCart(AddToCart addToCart) {
		System.out.println(addToCart.getTripId());
        return carerepo.save(addToCart);  // Save the AddToCart entity and return the saved entity
    }
}
