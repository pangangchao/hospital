package com.web.hospitalsystem.action.patient;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.web.hospitalsystem.entity.Patient;
import com.web.hospitalsystem.service.PatientService;
import com.web.hospitalsystem.util.GenerateIDUtil;


@Namespace("/patient")
@ParentPackage("json-default")
public class PatientMangeAction {
	@Autowired
	private PatientService patientService;
	
	private int id;//编号
	private String name ;			//姓名
	private int sex ;			    //性别
	private int age;			//年龄
	private String address;			//地址
	private String professional;	//职业
	private String  allergic_History;//是否有过敏你是
	
	private Date discharge_time;//出院时间
	
	private int department_id;//所属科室

	private String content;//住院原因

	private String identity_card ;  //身份证号

	private Date admission_time;//进院时间
	private String username; //用户名
	private int atstate=1;//是否在医院，默认在
	private int bedId;//病床号
	
	private String result;//返回结果
	
	public void setId(int id) {
		this.id = id;
	}
	@JSON(serialize= false)
	public int getId() {
		return id;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	public String getResult() {
		return result;
	}
	
	@JSON(serialize = false)
	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}


	@JSON(serialize = false)
	public int getSex() {
		return sex;
	}



	public void setSex(int sex) {
		this.sex = sex;
	}


	@JSON(serialize = false)
	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}


	
	@JSON(serialize = false)
	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}


	@JSON(serialize = false)
	public String getProfessional() {
		return professional;
	}



	public void setProfessional(String professional) {
		this.professional = professional;
	}


	@JSON(serialize = false)
	public String getAllergic_History() {
		return allergic_History;
	}



	public void setAllergic_History(String allergic_History) {
		this.allergic_History = allergic_History;
	}


		@JSON(serialize = false)
	public String getContent() {
		return content;
	}


	@JSON(serialize = false)	
	public Date getDischarge_time() {
			return discharge_time;
		}
	public void setDischarge_time(Date discharge_time) {
		this.discharge_time = discharge_time;
	}
	@JSON(serialize = false)
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@JSON(serialize = false)
	public String getIdentity_card() {
		return identity_card;
	}
	public void setIdentity_card(String identity_card) {
		this.identity_card = identity_card;
	}
	@JSON(serialize = false)
	public Date getAdmission_time() {
		return admission_time;
	}
	public void setAdmission_time(Date admission_time) {
		this.admission_time = admission_time;
	}
	@JSON(serialize = false)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@JSON(serialize = false)
	public int getBedId() {
		return bedId;
	}
	public void setBedId(int bedId) {
		this.bedId = bedId;
	}
	public Patient create(){
		Patient patient = new Patient();
		patient.setId(id);
		patient.setName(name);
		patient.setSex(sex);
		patient.setAge(age);
		patient.setAddress(address);
		patient.setProfessional(professional);
		patient.setAllergic_History(allergic_History);
		patient.setDischarge_time(discharge_time);
		patient.setDepartment_id(department_id);
		patient.setContent(content);
		patient.setAtstate(atstate);
		patient.setBedId(bedId);
		patient.setDischarge_time(discharge_time);
		patient.setAdmission_time(admission_time);
		patient.setIdentity_card(identity_card);
		patient.setUsername(username);
		return patient;
		
	}
	

	@Action(value="update",results={@Result(name="json",type="json")})
	public String updatePatient(){
		Patient patient = create();
		System.out.println(patient);
		boolean updateresult = patientService.update(patient);
		List<Patient> patients = patientService.allpatients();
		ServletActionContext.getRequest().getSession().setAttribute("patients",patients);
		if(updateresult)
			result = "200";
		else
			result="400";
		return "json";
	}
	
	//删除，修改为不再医院
	@Action(value="delete",results = {@Result(name="json",type="json")})
	public String deletePatient(){
		boolean delete_result = patientService.outHospital(username);
		List<Patient> patients = patientService.allpatients();
		ServletActionContext.getRequest().getSession().setAttribute("patients",patients);
		if(delete_result)
			result = "200";
		else
			result = "404";	
		return "json";
	}
	
}
