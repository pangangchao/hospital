package com.web.hospitalsystem.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.web.common.base.IBaseServiceImpl;
import com.web.hospitalsystem.entity.Patient;
import com.web.hospitalsystem.service.PatientService;

@Service("patientService")
public class PatientServiceImpl extends IBaseServiceImpl implements PatientService{
	/**
	 * 查找所有的病人
	 * @return
	 */
	public List<Patient> allpatients(){
		return dao.find("from Patient patient");
	}
	
	/**
	 * 查找所有还在医院的病人
	 * @return
	 */
	public List<Patient> allNoLeavePatients(){
		return dao.find("from Patient patient where patient.atstate=1");
	}
	/**
	 * 通过辨认编号办理出院
	 * @param username
	 * @return
	 */
	public boolean outHospital(String username){
	
		
		return dao.update("update Patient p set p.atstate=0 , p.discharge_time=? where p.username=?",new Date(), username);
	}
}
