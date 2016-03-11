package com.web.hospitalsystem.action.admin;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.web.hospitalsystem.entity.Admin;
import com.web.hospitalsystem.service.AdminService;


@Namespace("/admin")
@ParentPackage("json-default")  
public class AdminManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String username;
	private int sex;
	private String password;
	private String professional;
	private int age;
	
	private int id;
	
	
	private String result;

	@Autowired
	private AdminService adminService;
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	public String getResult() {
		return result;
	}
	
	@JSON(serialize=false)
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@JSON(serialize=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@JSON(serialize = false)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@JSON(serialize = false)
	public int getSex() {
		return sex;
	}
	
	public void setSex(int sex) {
		this.sex = sex;
	}
	
	@JSON(serialize = false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@JSON(serialize = false)
	public String getProfessional() {
		return professional;
	}


	public void setProfessional(String professional) {
		this.professional = professional;
	}

	
	public Admin create(){
		Admin admin = new Admin();
		admin.setJobID(username);
		admin.setPassword(password);
		admin.setName(name);
		admin.setProfessional(professional);
		admin.setSex(sex);
		admin.setAge(age);
		return admin;
	}
	

	public void refushSession(){
		List<Admin> admins = adminService.getAll();
		ServletActionContext.getRequest().getSession().setAttribute("admins", admins);
	}
	
	@Action(value="add",results={@Result(name="input",type="json")})
	public String  addAdmin(){
		Admin admin  =this.create();
		boolean saveResult = adminService.save(admin);
		if(saveResult)
			result = "200";
		else
			result = "404";
		return "input";
	}
	
	@Action(value="delete",results={@Result(name="input",type="json")})
	public String delete(){
		boolean delteResult = adminService.delete(username);
		List<Admin> admins = adminService.getAll();
		ServletActionContext.getRequest().getSession().setAttribute("admins", admins);
		if(delteResult)
			result ="200";
		else
			result = "404";
		return "input";
	}
	
	
	@Action(value="edit",results={@Result(name="input",type="json")})
	public  String edit(){
		
		Admin admin = this.create();
		admin.setId(id);
		//更新
		boolean save_result = adminService.update(admin);
		//刷新session
		this.refushSession();
		
		if(save_result)
			result ="200";
		else
			result = "404";	
		return "input";
	}
	
}
