package com.web.hospitalsystem.test;


import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.hospitalsystem.entity.Admin;
import com.web.hospitalsystem.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/applicationContext.xml") 
public class AdminServiceTest {
	@Autowired
	private AdminService adminService;
	
	@Test 
	public void testAdd() {
		boolean result = adminService.add("admin", "12345");
		System.out.println(result);
	}
	
	@Test
	public void testAll(){
		List<Admin> list = adminService.getAll();
		Iterator<Admin> admins = list.iterator();
		while(admins.hasNext()){
			Admin admin = admins.next();
			System.out.println(admin);
		}
	}
}
