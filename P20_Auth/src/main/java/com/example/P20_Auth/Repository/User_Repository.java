package com.example.P20_Auth.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.P20_Auth.Controller.Entity.Users;


@Repository
public interface User_Repository extends JpaRepository<Users, Integer>{

	
   @Query("SELECT u from Users u where username =:username and password=:pwd and accountstatus=1")
   public Users findByUsernameAndPassword(@Param("username")String username,@Param("pwd")String pwd);
   
    @Modifying
	@Query("update Users set password=:pwd where username =:username")
	public int updatepassword(@Param("username")String username,@Param("pwd")String pwd);

//    @Query("Select count(*) from Users u where email=:em")
//   	public int findByEmail(@Param("em")String em);
	 	  
    @Query("SELECT count(*) from Users where username =:username and email=:email and contactno=:contact and accountstatus=1")
    public int findByEmail(@Param("username")String username,@Param("email")String email,@Param("contact")String contact);
 	
   
    Optional<Users> findByEmail(String email);
    
    @Query("SELECT count(*) from Users where username =:username")
    public int findByUsername(@Param("username")String username);
    
    @Query("SELECT count(*) from Users where contactno =:contactno")
	public int findByContact(@Param("contact")String contactno);
    
}
