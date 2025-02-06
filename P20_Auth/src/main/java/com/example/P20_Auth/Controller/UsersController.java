package com.example.P20_Auth.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.P20_Auth.DummyUseEntities.DummyUser;
import com.example.P20_Auth.DummyUseEntities.Forgot_Password;
import com.example.P20_Auth.Service.UsersService;



@RestController
@CrossOrigin(origins = "http://localhost:3020")
public class UsersController {

	@Autowired
	UsersService Userser;
	
	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody DummyUser login) {
	    com.example.P20_Auth.Controller.Entity.Users user = Userser.validateLogin(login.getUsername(), login.getPassword());
	    if (user == null) {
	        // Return a 401 Unauthorized response with a meaningful JSON message
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid username or password");
	    }
	    return ResponseEntity.ok(user); // Return the user object as JSON if credentials are valid
	}
 
	 @PutMapping("/forgotpassword")
	 public ResponseEntity<String> forgot_Password(@RequestBody Forgot_Password fr )
		   	{
			   return Userser.forgot_Password(fr.getUsername(),fr.getMobileno(),fr.getEmail(),fr.getPassword() );   
		   	}
	 
	
}

