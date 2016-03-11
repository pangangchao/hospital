package com.web.hospitalsystem.service;

import com.web.common.base.IBaseService;
import com.web.hospitalsystem.entity.Department;

public interface DepartmentService extends IBaseService{
	/**
	 * 查找通过id
	 * @param departmentId
	 * @return
	 */
	public Department findOneById(int departmentId);
}
