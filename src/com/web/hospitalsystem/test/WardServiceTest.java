package com.web.hospitalsystem.test;


import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.hospitalsystem.entity.Ward;
import com.web.hospitalsystem.service.WardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/applicationContext.xml") 
public class WardServiceTest {
	@Autowired
	private WardService wardService;
	
	@Test
	public void testWards(){
		List<Ward> wards = wardService.getWards();
		Iterator<Ward> allward = wards.iterator();
		while(allward.hasNext()){
			Ward ward = allward.next();
			System.out.println(ward);
		}
		long num = wardService.getWardsNumByWardId(1);
		long empty = wardService.getEmptyWard(1);
		System.out.println(empty+"/"+num);
	}

}
