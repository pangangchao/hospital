package com.web.hospitalsystem.test;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.hospitalsystem.service.AdminService;
import com.web.hospitalsystem.service.HospitalBedService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/applicationContext.xml") 
public class HospitalBedServiceTest {
	@Autowired
	private HospitalBedService hospitalBedService;
	
	@Test
	public  void selectBed(){
		System.out.println(hospitalBedService.selectBed(1));
		System.out.println(hospitalBedService.emptyBed(1));
	}
	
	
}
