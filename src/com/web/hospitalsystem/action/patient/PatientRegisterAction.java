package com.web.hospitalsystem.action.patient;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.hospitalsystem.entity.Patient;
import com.web.hospitalsystem.entity.Ward;
import com.web.hospitalsystem.service.HospitalBedService;
import com.web.hospitalsystem.service.PatientService;
import com.web.hospitalsystem.service.WardService;
import com.web.hospitalsystem.util.GenerateIDUtil;


@Namespace("/patient")
@ParentPackage("json-default")
public class PatientRegisterAction {
	
	private String name ;			//姓名
	private int sex ;			    //性别
	private int age;			//年龄
	private String identity_card ;  //身份证号
	private String address;			//地址
	private String professional;	//职业
	private String  allergic_History;//是否有过敏你是
	private String hospital_bed_number;//病床号
	private int department_id;//所属科室
	private String username; //用户编号
	private int sickroomId;//病房号
	private int bedId;//病床号
	private String content;//住院原因
	
	
	private String result;
	
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	public String getResult() {
		return result;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getIdentity_card() {
		return identity_card;
	}

	public void setIdentity_card(String identity_card) {
		this.identity_card = identity_card;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProfessional() {
		return professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public String getAllergic_History() {
		return allergic_History;
	}
	public void setAllergic_History(String allergic_History) {
		this.allergic_History = allergic_History;
	}
	
	public String getHospital_bed_number() {
		return hospital_bed_number;
	}

	public void setHospital_bed_number(String hospital_bed_number) {
		this.hospital_bed_number = hospital_bed_number;
	}

	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public int getSickroomId() {
		return sickroomId;
	}

	public void setSickroomId(int sickroomId) {
		this.sickroomId = sickroomId;
	}

	public int getBedId() {
		return bedId;
	}

	public void setBedId(int bedId) {
		this.bedId = bedId;
	}

	@Autowired
	private PatientService patientService;
	@Autowired
	private HospitalBedService hospitalBedService;
	@Autowired
	private WardService wardService;
	
	public Patient create(){
		Patient patient = new Patient();
		patient.setName(name);
		patient.setSex(sex);
		patient.setAge(age);
		patient.setIdentity_card(identity_card);
		patient.setAddress(address);
		patient.setProfessional(professional);
		patient.setAllergic_History(allergic_History);
		patient.setAdmission_time(new Date());
		patient.setDepartment_id(department_id);
		patient.setSickroomId(sickroomId);
		patient.setBedId(bedId);
		patient.setContent(content);
		String id=GenerateIDUtil.generatePatientID();
		patient.setUsername(id);
		hospitalBedService.selectBed(bedId);//选中的病床号为空
		return patient;
		
	}
	
	@Action(value="register",results={@Result(name="input",type="json")})
	public String register(){
		Patient patient = this.create();
		boolean save_result = patientService.save(patient);
		//修改空床位号
		wardService.selectWard(sickroomId);
		if(save_result){
			result = "200";
			List<Ward> wards = wardService.getWards();
			ServletActionContext.getRequest().getSession().setAttribute("wards", wards);
		}
		else
			result = "400";
		return "input";
	}
}
