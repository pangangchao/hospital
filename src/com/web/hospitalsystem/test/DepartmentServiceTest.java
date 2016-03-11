package com.web.hospitalsystem.test;


import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.hospitalsystem.entity.Admin;
import com.web.hospitalsystem.entity.Department;
import com.web.hospitalsystem.service.AdminService;
import com.web.hospitalsystem.service.DepartmentService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/applicationContext.xml")
public class DepartmentServiceTest {
	
	@Autowired
	private DepartmentService departmentService;
	
	@Test
	public void find(){
		Department de = departmentService.findOneById(3);
		System.out.println(de.getDepartmentName());
	}
}
