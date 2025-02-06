package com.example.P20_CRUD.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.example.P20_CRUD.DummyUseEntities.AvailabilityRequest;
import com.example.P20_CRUD.DummyUseEntities.DummyUser;
import com.example.P20_CRUD.DummyUseEntities.UserRequest;
import com.example.P20_CRUD.Entity.AddToCart;
import com.example.P20_CRUD.Entity.AddToWishlist;
import com.example.P20_CRUD.Entity.Tourist;
import com.example.P20_CRUD.Entity.Trips;
import com.example.P20_CRUD.Service.AddToCartService;
import com.example.P20_CRUD.Service.AddToWishlistService;
import com.example.P20_CRUD.Service.TouristService;
import com.example.P20_CRUD.Service.Trips_Service;
import com.example.P20_CRUD.Service.UsersService;



@RestController
@CrossOrigin(origins = "http://localhost:3020")
public class UsersController {

	@Autowired
	UsersService Userser;
	
	@Autowired
	Trips_Service tser;
	
	@Autowired
	TouristService toservice;
	
	@Autowired
	AddToCartService cardservice;
	
	@Autowired
	AddToWishlistService wishservice;
	
	
	
	@GetMapping("/gettripsforuser")
	public List<Trips> getTripsforuser()
	{
		return tser.getallTripsUser(); 
	}
	 
	 @PostMapping("/newUser")
	 public ResponseEntity<String> new_user(@RequestBody DummyUser ur )
	 {
		return Userser.registerUser(ur);   
	 }
	 
	 @PostMapping("/savetorist")
	 public List<Tourist> saveMultipleTourists(@RequestBody List<Tourist> tourists) {
	        return toservice.saveMultipleTourists(tourists);
	 }
	 
	 
	 @PostMapping("/addtocart")
	    public ResponseEntity<?> addToCart(@RequestBody AddToCart addToCart) {
	        System.out.println("Received Trip ID: " + addToCart.getTripId());
	        try {
	            AddToCart savedAddToCart = cardservice.saveAddToCart(addToCart);
	            return ResponseEntity.ok(savedAddToCart); 
	        } catch (Exception e) {
	            System.err.println("Error adding to cart: " + e.getMessage());
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                                 .body("Failed to add to cart: " + e.getMessage());
	        }
	    }
	 
	 @PostMapping("/addtowishlist")
	 public ResponseEntity<?> addToWishlist(@RequestBody AddToWishlist addToWishlist) {
	     System.out.println("Received Trip ID: " + addToWishlist.getTripId());
	     try {
	         AddToWishlist savedAddToWishlist =  wishservice.saveAddToWishlist(addToWishlist);
	         return ResponseEntity.ok(savedAddToWishlist);
	     } catch (Exception e) {
	         System.err.println("Error adding to wishlist: " + e.getMessage());
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                              .body("Failed to add to wishlist: " + e.getMessage());
	     }
	 }
	 
	 @PostMapping("/getwishlist")
	    public ResponseEntity<List<Trips>> getWishlist(@RequestBody UserRequest userRequest) {
	        try {
	            List<Trips> wishlist = tser.getWishlistByUserId(userRequest.getUserId());
	            if (wishlist == null || wishlist.isEmpty()) {
	                return new ResponseEntity<>(HttpStatus.NO_CONTENT); // No content if wishlist is empty
	            }
	            return new ResponseEntity<>(wishlist, HttpStatus.OK); // Return wishlist with OK status
	        } catch (Exception e) {
	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // Internal server error in case of exception
	        }
	    }
	 
	 @PostMapping("/getcart")
	    public ResponseEntity<List<Trips>> getCart(@RequestBody UserRequest userRequest) {
	        try {
	            List<Trips> wishlist = tser.getCartByUserId(userRequest.getUserId());
	            if (wishlist == null || wishlist.isEmpty()) {
	                return new ResponseEntity<>(HttpStatus.NO_CONTENT); // No content if wishlist is empty
	            }
	            return new ResponseEntity<>(wishlist, HttpStatus.OK); // Return wishlist with OK status
	        } catch (Exception e) {
	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // Internal server error in case of exception
	        }
	    }
	 
	 @PostMapping("/checkAvailability")
	    public ResponseEntity<String> checkAvailability(@RequestBody AvailabilityRequest request) {
	        boolean isAvailable = tser.checkTripAvailability(request.getTripId(), request.getQuantity());
	        
	        if (isAvailable) {
	            return ResponseEntity.ok("Seats are available");
	        } else {
	            return ResponseEntity.badRequest().body("Insufficient seats available");
	        }
	    }
	 
	 

	 @PostMapping("/removewishlist")
	 public ResponseEntity<String> removeFromWishlist(@RequestBody AddToWishlist wishlist) {
	     try {
	         wishservice.removeFromWishlist(wishlist.getTripId(), wishlist.getUserId());
	         return ResponseEntity.ok("Trip removed from wishlist successfully!");
	     } catch (Exception e) {
	         return ResponseEntity.status(500).body("Failed to remove from wishlist: " + e.getMessage());
	     }
	 }
	 
	 


	 
	 
	
}
