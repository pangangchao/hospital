package com.web.hospitalsystem.action.admin;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

@Namespace("/admin")
@ParentPackage("struts-default")
public class ToAdminAddAction {
	@Action(value="newAdmin",results={@Result(name="to",type="redirect",location="/background/Application/Admin/add.jsp")})
	public String toAdminPage(){
		return "to";
	}
}
