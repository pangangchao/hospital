package com.web.hospitalsystem.action.patient;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.hospitalsystem.entity.Patient;
import com.web.hospitalsystem.service.PatientService;

@Namespace("/patient")
@ParentPackage("json-default")
public class OutHospitalAction {
	@Autowired
	private PatientService patientService;
	
	private String result;
	private String username;
	
	
	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	@Action(value="outhospital",results={@Result(name="json",type="json")})
	public String outHosp(){
		boolean re = patientService.outHospital(username);
		List<Patient> patients = patientService.allNoLeavePatients();
		ServletActionContext.getRequest().getSession().setAttribute("patients",patients);
		if(re)
			result = "200";
		else
			result="404";
		return "json";
	}
}
