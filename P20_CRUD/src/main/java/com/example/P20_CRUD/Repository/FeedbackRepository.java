package com.example.P20_CRUD.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.P20_CRUD.Entity.Feedback;

@Repository
public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {

	@Query("SELECT f FROM Feedback  f WHERE f.packageid = :packageid")
	public List<Feedback> getAllFeed(@Param("packageid")int packageid);

}
