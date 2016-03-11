package com.web.hospitalsystem.service.impl;

import org.springframework.stereotype.Service;

import com.web.common.base.IBaseServiceImpl;
import com.web.hospitalsystem.entity.Department;
import com.web.hospitalsystem.service.DepartmentService;

@Service("DepartmentService")
public class DepartmentServiceImpl extends IBaseServiceImpl implements DepartmentService{
	/**
	 * 查找通过id
	 * @param departmentId
	 * @return
	 */
	public Department findOneById(int departmentId){
		return (Department) dao.findOne("from Department d where d.id=?", departmentId);
	}
}
