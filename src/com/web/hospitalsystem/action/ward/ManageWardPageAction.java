package com.web.hospitalsystem.action.ward;

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
public class ManageWardPageAction {
	
	@Autowired
	private WardService wardService;
	
	@Action(value="add",results={@Result(name="into",type="redirect",location="/background/Application/SickRoom/add.jsp")})
	public String add(){
		return "into";
	}
	
	@Action(value="manage",results={@Result(name="into",type="redirect",location="/background/Application/SickRoom/sickroom.jsp")})
	public String manage(){
		List<Ward> wards = wardService.getWards();
		ServletActionContext.getRequest().getSession().setAttribute("wards", wards);
		return "into";
	}
	
	
}
