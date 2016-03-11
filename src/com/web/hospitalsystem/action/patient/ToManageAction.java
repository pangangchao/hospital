package com.web.hospitalsystem.action.patient;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.web.hospitalsystem.entity.Patient;
import com.web.hospitalsystem.service.PatientService;


@Namespace("/patient")
@ParentPackage("struts-default")
public class ToManageAction {
	@Autowired
	private PatientService patientService;
	
	@Action(value="all",results={@Result(name="input",type="redirect",location="/background/Application/Patient/manage.jsp")})
	public String getAllNoOutPatient(){
		
		List<Patient> patients = patientService.allpatients();
		ServletActionContext.getRequest().getSession().setAttribute("patients",patients);
		
		return "input";
	}
}
