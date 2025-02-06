package com.example.P20_CRUD.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.P20_CRUD.Entity.Users;


@Repository
public interface User_Repository extends JpaRepository<Users, Integer>{

   @Query("SELECT count(*) from Users where username =:username")
   public int findByUsername(@Param("username")String username);

    @Query("SELECT count(*) from Users where contactno =:contactno")
	public int findByContact(@Param("contact")String contactno);
    
    @Query("Select u from Users u where u.role_id.role_id=:role_id")
    public List<Users> getAllUser(@Param("role_id")int role_id);

    @Modifying
	@Query("update Users set accountstatus=0  where user_id =:uid")
	public int Update(@Param("uid")int uid);

    @Query("Select count(*) from Users u where email=:em")
	public int findByEmail(@Param("em")String em);

    
	 	  
    

}

