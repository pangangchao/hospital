package com.web.hospitalsystem.service;

import java.util.List;

import com.web.common.base.IBaseService;
import com.web.hospitalsystem.entity.Department;
import com.web.hospitalsystem.entity.Ward;

public interface WardService extends IBaseService {
	/**
	 * 查找所有的病房
	 * @return
	 */
	public List<Ward> getWards();
	
	/**
	 * 查找病房所有床位个数
	 * @param id
	 * @return
	 */
	public Long getWardsNumByWardId(int id);
	
	/**
	 * 查找所有空的床位个数
	 * @param id
	 * @return
	 */
	public Long getEmptyWard(int id);
	
		
	/**
	 * 修改病房设置
	 * @param id
	 * @param name
	 * @param reason
	 * @param department
	 * @return
	 */
	public boolean Update(int id,String name,String reason,Department department);
	
	
	/**
	 * 修改空病房数目
	 * @param num
	 * @param id
	 * @return
	 */
	public boolean selectWard(int id);
	
	
}
