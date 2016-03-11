package com.web.hospitalsystem.test;


import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.hospitalsystem.entity.Patient;
import com.web.hospitalsystem.service.AdminService;
import com.web.hospitalsystem.service.PatientService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/applicationContext.xml") 
public class PatientServiceTestAction {
	@Autowired
	private PatientService patientService;
	@Test
	public void test(){
		List<Patient> list	=patientService.allpatients();
		Iterator<Patient> patients = list.iterator();
		while(patients.hasNext()){
			Patient patient = patients.next();
			System.out.println(patient);
		}
	}
	
	@Test
	public void testOut(){
		System.out.println(patientService.outHospital("201504140210112"));
	}
}
