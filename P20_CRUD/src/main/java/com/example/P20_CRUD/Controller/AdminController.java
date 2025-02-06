package com.example.P20_CRUD.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.P20_CRUD.DummyUseEntities.DummyUser;
import com.example.P20_CRUD.Entity.Company;
import com.example.P20_CRUD.Entity.Trips;
import com.example.P20_CRUD.Entity.Users;
import com.example.P20_CRUD.Service.Company_Service;
import com.example.P20_CRUD.Service.Trips_Package_Service;
import com.example.P20_CRUD.Service.Trips_Service;
import com.example.P20_CRUD.Service.UsersService;

@RestController
@CrossOrigin(origins = "http://localhost:3020")
public class AdminController {

	@Autowired
	UsersService Userser;
	
	@Autowired
	Trips_Service tservice;
	
	@Autowired
	Company_Service ComSer;
	
	@Autowired
	Trips_Package_Service tpservice;
	
	
	
	@PostMapping("/newAdmin")
   	public ResponseEntity<String> new_Admin(@RequestBody DummyUser ur )
   	{
	   return Userser.registerAdmin(ur);   
   	}
	
	@GetMapping("/getactivetrips")
	public List<Trips> getAllTrips(){
		return tservice.getallTrips();
	}
	
	@GetMapping("/getallCompnies")
	public List<Company> getAllCompanies(){
		return ComSer.getallCompany();
	}
	
	@GetMapping("/alluser")
    public List<Users> getallUser() {
        return Userser.getAllUsers();
    }
	
	@PutMapping("/deletecompany")
	public String deleteCompany(@RequestBody int companyId)
	{
		 if(Userser.deleteUser(companyId) >= 0 )
		 {
			 return "Company delete successfully"; 
		 }
		 return "Company delete Unsuccessfully";
	}
	 
	@PutMapping("/deleteuser")
	public String deleteUser(@RequestParam int uid)
	{
		 if(Userser.deleteUser(uid) >= 0 )
		 {
			 return "User delete successfully"; 
		 }
		 return "User delete Unsuccessfully";
	}
	
	@PutMapping("/deletetrips")
	public String deleteTrip(@RequestBody int tripId)
	{
		if(tservice.deletrip(tripId) >= 0 )
		 {
			 return "Trip delete successfully"; 
		 }
		 return "Trip delete Unsuccessfully";
	}
	


 
}

