package com.web.hospitalsystem.action.admin;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.web.hospitalsystem.entity.Admin;
import com.web.hospitalsystem.service.AdminService;

@Namespace("/admin")
@ParentPackage("json-default")  
public class HSLoginAction {
	@Autowired
	private AdminService adminService;
	private String username;
	private String password;
	
	private String result;//结果
	
	
	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Action(value="login", results={@Result(name="input",type="json")})
	public String loginAction(){
		Admin admin = adminService.login(username, password);
		if(admin!=null){
			result="200";
			String username = admin.getName();
			ServletActionContext.getRequest().getSession().setAttribute("username",username );
		}
		else
			result="404";	
		return "input";
	}
}
