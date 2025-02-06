package com.example.P20_Auth.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.P20_Auth.Controller.Entity.Users;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UsersService {

	@Autowired
	com.example.P20_Auth.Repository.User_Repository User_repo;
	
	
	
	 public Users validateLogin(String username, String password){
	        
	        
	        Users u = User_repo.findByUsernameAndPassword(username, password);
			
			//System.out.println(u);
			return u;

	          
	 }

		
		public ResponseEntity<String> forgot_Password(String username, String contactno, String email,String password) {
			// TODO Auto-generated method stub
			if(User_repo.findByEmail(username,email,contactno)>0)
			{
				User_repo.updatepassword(username, password);
				return new ResponseEntity<>("Password Updated successfully", HttpStatus.OK);
			}
			return new ResponseEntity<>("Invalid Details", HttpStatus.BAD_REQUEST);
		}


		
	}
	

