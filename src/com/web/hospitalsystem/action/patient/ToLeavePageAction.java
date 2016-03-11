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
@ParentPackage("struts-default")
public class ToLeavePageAction {
	@Autowired
	private PatientService patientService;
	
	@Action(value="dealOutHospital",results={@Result(name="input",type="redirect",location="/background/Application/Patient/leavemanage.jsp")})
	public String  outHospitalurl(){
		List<Patient> patients = patientService.allNoLeavePatients();
		ServletActionContext.getRequest().getSession().setAttribute("patients",patients);
		return "input";
	}
}
