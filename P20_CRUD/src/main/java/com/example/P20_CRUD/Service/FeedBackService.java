package com.example.P20_CRUD.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.P20_CRUD.Entity.Feedback;
import com.example.P20_CRUD.Repository.FeedbackRepository;

@Service
public class FeedBackService {

	@Autowired
	FeedbackRepository FRepo;
	

	public List<Feedback> getAllfeedback(int tripid) {
		// TODO Auto-generated method stub
		return FRepo.getAllFeed(tripid);
	}


	
}

