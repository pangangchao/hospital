package com.web.hospitalsystem.action.ward;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.hospitalsystem.entity.Ward;
import com.web.hospitalsystem.service.WardService;

@Namespace("/ward")
@ParentPackage("struts-default")
public class WardInfoAction {
	@Autowired
	private WardService wardService;
	
	@Action(value="register", results={@Result(name="input",type="redirect",location="/background/Application/Patient/register.jsp")})
	public String register(){
		List<Ward> wards_new = new ArrayList<Ward>();
		List<Ward> list = wardService.getWards();
		Iterator<Ward> wards = list.iterator();
		while (wards.hasNext()) {
			Ward ward = wards.next();
			
			int id = ward.getWid();
			long allnum = wardService.getWardsNumByWardId(id);
			long emptynum = wardService.getEmptyWard(id);
			ward.setBedNum(allnum);
			ward.setEmptyBedNum(emptynum);
			wardService.update(ward);
			wards_new.add(ward);
		}
		ServletActionContext.getRequest().getSession().setAttribute("wards", wards_new);
		return "input";
	}
}
