package com.example.P20_CRUD.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.P20_CRUD.DummyUseEntities.DummyUser;
import com.example.P20_CRUD.Entity.Role;
import com.example.P20_CRUD.Entity.Users;
import com.example.P20_CRUD.Repository.Role_Repository;
import com.example.P20_CRUD.Repository.User_Repository;

import jakarta.transaction.Transactional;




@Service
@Transactional
public class UsersService {

	@Autowired
	User_Repository User_repo;
	
	@Autowired
	Role_Repository Role_repo;
	

		 public ResponseEntity<String> registerUser(DummyUser ur) {
			 
			 System.out.print(ur);
		        // Check if the username already exists
		        if (User_repo.findByUsername(ur.getUsername())>0) {
		            return new ResponseEntity<>("Username already taken", HttpStatus.BAD_REQUEST);
		        }

		        // Set Role_Id and Account_Status if not provided
		       
			   	   
			   	   Users newuser=new Users();
			   	   newuser.setFirstname(ur.getFirstname());
			   	   newuser.setLastname(ur.getLastname());
			   	   newuser.setUsername(ur.getUsername());
			   	   newuser.setPassword(ur.getPassword());
			   	   newuser.setContactno(ur.getContactno());
			   	   newuser.setEmail(ur.getEmail());
			   	   newuser.setAddress(ur.getAddress());
			   	   newuser.setAccountstatus(1);
			   	   
			   	   Role role= Role_repo.findById(2).orElseThrow(() -> new RuntimeException("Role not found with ID: "));
			   	   
			   	   newuser.setRole_id(role);
		            
		        
		        if (ur.getFirstname() == null || ur.getLastname().isEmpty()) {
		            throw new IllegalArgumentException("First name cannot be null or empty");
		        }

		        // Validate all fields are not null
		        if (ur.getUsername() == null || ur.getPassword() == null || ur.getFirstname() == null ||
		            ur.getLastname() == null || ur.getContactno() == null || ur.getEmail() == null ||
		            ur.getAddress() == null) {
		            return new ResponseEntity<>("All fields are required", HttpStatus.BAD_REQUEST);
		        }

		        // Save the new user
		        User_repo.save(newuser);
		        return new ResponseEntity<>("User registered successfully", HttpStatus.OK);
		    }

            public ResponseEntity<String> registerAdmin(DummyUser ur) {
			 
			 //System.out.print(ur);
		        // Check if the username already exists
		        if (User_repo.findByUsername(ur.getUsername())>0) {
		            return new ResponseEntity<>("Username already taken", HttpStatus.BAD_REQUEST);
		        }

		        // Set Role_Id and Account_Status if not provided
		       
			   	   
			   	   Users newuser=new Users();
			   	   newuser.setFirstname(ur.getFirstname());
			   	   newuser.setLastname(ur.getLastname());
			   	   newuser.setUsername(ur.getUsername());
			   	   newuser.setPassword(ur.getPassword());
			   	   newuser.setContactno(ur.getContactno());
			   	   newuser.setEmail(ur.getEmail());
			   	   newuser.setAddress(ur.getAddress());
			   	   newuser.setAccountstatus(1);
			   	   
			   	   Role role= Role_repo.findById(1).orElseThrow(() -> new RuntimeException("Role not found with ID: "));
			   	   
			   	   newuser.setRole_id(role);
		            
		        
		        if (ur.getFirstname() == null || ur.getLastname().isEmpty()) {
		            throw new IllegalArgumentException("First name cannot be null or empty");
		        }

		        // Validate all fields are not null
		        if (ur.getUsername() == null || ur.getPassword() == null || ur.getFirstname() == null ||
		            ur.getLastname() == null || ur.getContactno() == null || ur.getEmail() == null ||
		            ur.getAddress() == null) {
		            return new ResponseEntity<>("All fields are required", HttpStatus.BAD_REQUEST);
		        }

		        // Save the new user
		        User_repo.save(newuser);
		        return new ResponseEntity<>("User registered successfully", HttpStatus.OK);
		    }

		public List<Users> getAllUsers() {
			// TODO Auto-generated method stub
			return User_repo.getAllUser(2);
		}

		public int deleteUser(int uid) {
			// TODO Auto-generated method stub
			return User_repo.Update(uid);
		}

		public int findUserByEmail(String email) {
	        return User_repo.findByEmail(email);  // Assuming a method in the repository
	    }


		
	}
	

