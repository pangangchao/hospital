package com.web.hospitalsystem.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.common.base.IBaseServiceImpl;
import com.web.hospitalsystem.entity.Hospitalbed;
import com.web.hospitalsystem.service.HospitalBedService;

@Service("hospitalBedService")
public class HospitalBedServiceImpl extends IBaseServiceImpl implements HospitalBedService {
	/**
	 * 选择床号
	 * @param id
	 * @return
	 */
	public boolean selectBed(int id){
		
		return dao.update("update Hospitalbed h set h.state=1 where h.hid=?",id );
	}
	
	/**
	 * 空出床号
	 * @param id
	 * @return
	 */
	public boolean emptyBed(int id){
		return dao.update("update Hospitalbed h set h.state=0 where h.hid=?",id );
	}
	
	/**
	 * 获取某个病房所有床位
	 * @param id
	 * @return
	 */
	public List<Hospitalbed> getHostHospitalbeds(int id){
		return dao.find("from Hospitalbed hospitalbed where hospitalbed.ward.wid=?",id);
	}
	
}
