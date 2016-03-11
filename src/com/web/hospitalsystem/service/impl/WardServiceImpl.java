package com.web.hospitalsystem.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.common.base.IBaseServiceImpl;
import com.web.hospitalsystem.entity.Department;
import com.web.hospitalsystem.entity.Ward;
import com.web.hospitalsystem.service.WardService;
@Service("wardService")
public class WardServiceImpl extends IBaseServiceImpl implements WardService{
	/**
	 * 查找所有的病房
	 * @return
	 */
	public List<Ward> getWards(){
		return dao.find("from Ward ward");
	}
	
	
	/**
	 * 查找病房所有床位个数
	 * @param id
	 * @return
	 */
	public Long getWardsNumByWardId(int id){
		return dao.count("select count(*) from Hospitalbed h where h.ward.wid=?", id);
	}
	
	/**
	 * 查找所有空的床位个数
	 * @param id
	 * @return
	 */
	public Long getEmptyWard(int id){
		return dao.count("select count(*) from Hospitalbed h where h.ward.wid=? and h.state=0", id);
	}
	
	/**
	 * 修改
	 * @param id
	 * @return
	 */
	public boolean Update(int id,String name,String reason,Department department){
		return dao.update("update Ward ward set ward.name=?,ward.department=?,ward.reason=? where ward.wid=?", name,department,reason,id);
	}
	
	/**
	 * 修改ward的空房数目
	 * @param id
	 * @return
	 */
	public boolean selectWard(int id){
		Ward ward = (Ward)dao.findOne("from Ward ward where ward.id=?", id);
		long num = ward.getEmptyBedNum();
		++num;
		return dao.update("update Ward ward set ward.emptyBedNum=? where ward.wid=?", num,id);
				 
	}
}
