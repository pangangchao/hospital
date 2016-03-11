package com.web.hospitalsystem.service;

import java.util.List;

import com.web.common.base.IBaseService;
import com.web.hospitalsystem.entity.Hospitalbed;

public interface HospitalBedService extends IBaseService {
	/**
	 * 选择床号
	 * @param id
	 * @return
	 */
	public boolean selectBed(int id);
	
	/**
	 * 空出床号
	 * @param id
	 * @return
	 */
	public boolean emptyBed(int id);
	
	/**
	 * 获取某个病房所有床位
	 * @param id
	 * @return
	 */
	public List<Hospitalbed> getHostHospitalbeds(int id);
}
