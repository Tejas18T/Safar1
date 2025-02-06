package com.example.P20_CRUD.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.P20_CRUD.DummyUseEntities.AddPackages;
import com.example.P20_CRUD.DummyUseEntities.AddTrips;
import com.example.P20_CRUD.DummyUseEntities.DummyCompany;
import com.example.P20_CRUD.DummyUseEntities.GetCompnayId;
import com.example.P20_CRUD.DummyUseEntities.PackageIDDummy;
import com.example.P20_CRUD.Entity.Company;
import com.example.P20_CRUD.Entity.Feedback;
import com.example.P20_CRUD.Entity.Trips;
import com.example.P20_CRUD.Entity.Trips_Package;
import com.example.P20_CRUD.Entity.Users;
import com.example.P20_CRUD.Service.Company_Service;
import com.example.P20_CRUD.Service.FeedBackService;
import com.example.P20_CRUD.Service.Trips_Package_Service;
import com.example.P20_CRUD.Service.Trips_Service;
import com.example.P20_CRUD.Service.UsersService;
 


@CrossOrigin(origins = "http://localhost:3020")
@RestController
public class CompanyController {
	
	@Autowired
	Company_Service ComSer;
	
	@Autowired
	Trips_Package_Service Tpservice;
	
	@Autowired
	Trips_Service tserv;
	
	@Autowired
	UsersService ur;
	
	@Autowired
	FeedBackService fbs;

    @PostMapping("/newCompany")
   	public ResponseEntity<String> new_Company(@RequestBody DummyCompany ducom )
   	{
	   Company com=new Company();
   	   com.setCompany_name(ducom.getCompany_name());
   	   com.setCompany_reg_no(ducom.getCompanyreg_no());
   	   Users ur=new Users();
   	   ur.setUsername(ducom.getUsername());
   	   ur.setPassword(ducom.getPassword());
   	   ur.setContactno(ducom.getContactno());
   	   ur.setEmail(ducom.getEmail());
   	   ur.setAddress(ducom.getAddress());
   	   com.setUser_id(ur);
       return ComSer.registerCompnay(com); 
   	}
    
    @PostMapping("/getpackages")
	public List<Trips_Package> getAll(@RequestBody GetCompnayId com)
	{
		return Tpservice.allPackages(com.getUserid());
	}
	
	@PostMapping("/addpackage")
    public String addTrip(@RequestBody AddPackages ap) {
        return Tpservice.AddPackage(ap);
    }
	
	@PostMapping("/gettripsforcom")
    public List<Trips> addTrip(@RequestBody GetCompnayId com) {
        return tserv.getTrips(com);
    }
   
	
	@PostMapping("/addtrip")
    public String addTrip(@RequestBody AddTrips trip) {
        return tserv.newTrips(trip);
    }
	
	
	@PostMapping("/getfeedbacks")
    public List<Feedback> getFeedbackbyypackage(@RequestBody PackageIDDummy gt) {
        return fbs.getAllfeedback(gt.getPackageid());
    }
	
	@PutMapping("/updatePackage")
	public int UpdatePakage(@RequestBody AddPackages upk)
	{
		return Tpservice.updatePakage(upk);
		
	}
	
	@PutMapping("/deletePackage")
	public int DePakage(@RequestBody PackageIDDummy dp)
	{
		return Tpservice.deletePack(dp.getPackageid());
		
	}
	


}
