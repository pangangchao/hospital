package com.web.hospitalsystem.action.system;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;


@Namespace("/system")
@ParentPackage("struts-default")
public class SystemManageAction {
	@Action(value="logout", results={@Result(name="logout",type="redirect",location="/background/login.html")})
	public String logout(){
		ServletActionContext.getRequest().getSession().removeAttribute("username");
		return "logout";
	}
	@Action(value="index",results={@Result(name="to",type="redirect",location="/background/Application/Home/home.jsp")})
	public String toHomePage(){
		return "to";
	}
}
