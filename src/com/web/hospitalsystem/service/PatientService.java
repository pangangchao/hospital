package com.web.hospitalsystem.service;

import java.util.List;

import com.web.common.base.IBaseService;
import com.web.hospitalsystem.entity.Patient;

public interface PatientService extends IBaseService {
	/**
	 * 查找所有的病人
	 * @return
	 */
	public List<Patient> allpatients();
	
	/**
	 * 查找所有还在医院的病人
	 * @return
	 */
	public List<Patient> allNoLeavePatients();
	/**
	 * 通过辨认编号办理出院
	 * @param username
	 * @return
	 */
	public boolean outHospital(String username);
	
}
