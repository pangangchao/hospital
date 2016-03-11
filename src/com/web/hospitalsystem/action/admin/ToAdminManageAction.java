package com.web.hospitalsystem.action.admin;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.hospitalsystem.entity.Admin;
import com.web.hospitalsystem.service.AdminService;

@Namespace("/admin")
@ParentPackage("struts-default")
public class ToAdminManageAction {
	@Autowired
	private AdminService adminService;
	
	@Action(value="adminManage",results={@Result(name="input",type="redirect",location="/background/Application/Admin/manage.jsp")})
	public String turntoUrl(){
		List<Admin> admins = adminService.getAll();
		ServletActionContext.getRequest().getSession().setAttribute("admins", admins);
		return "input";
	}
}
