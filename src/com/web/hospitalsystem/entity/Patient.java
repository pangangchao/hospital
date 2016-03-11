package com.web.hospitalsystem.entity;

import java.io.Serializable;
import java.util.Date;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name="hospital_patient")
public class Patient implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int id ;				//编号
	private String name ;			//姓名
	private int sex ;			    //性别
	private int age ;			    //年龄
	private String identity_card ;  //身份证号
	private String address;			//地址
	private String professional;	//职业
	private String allergic_History;//是否有过敏你是
	private Date admission_time;//进院时间
	private Date discharge_time;//出院时间
	private int department_id;//所属科室
	private String username; //用户名
	private int atstate=1;//是否在医院，默认在
	private String content;//住院原因
	private int sickroomId;//病房号
	private int bedId;//病床号
	
	
	
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId() {
		return id;
	}
	
	
	public String getUsername() {
		return username;
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


	public void setUsername(String username) {
		this.username = username;
	}



	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public void setId(int id) {
		this.id = id;
	}
	
	@Column
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	
	
	@Column
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Column
	public String getIdentity_card() {
		return identity_card;
	}

	public void setIdentity_card(String identity_card) {
		this.identity_card = identity_card;
	}
	


	@Column
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	

	@Column
	public String getProfessional() {
		return professional;
	}
	
	public void setProfessional(String professional) {
		this.professional = professional;
	}

	
	

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	public Date getAdmission_time() {
		return admission_time;
	}

	@Column
	public String getAllergic_History() {
		return allergic_History;
	}


	public void setAllergic_History(String allergic_History) {
		this.allergic_History = allergic_History;
	}


	public void setAdmission_time(Date admission_time) {
		this.admission_time = admission_time;
	}

	@Temporal(TemporalType.DATE)
	public Date getDischarge_time() {
		return discharge_time;
	}


	public void setDischarge_time(Date discharge_time) {
		this.discharge_time = discharge_time;
	}



	
	public int getAtstate() {
		return atstate;
	}


	public void setAtstate(int atstate) {
		this.atstate = atstate;
	}


	@Column
	public int getDepartment_id() {
		return department_id;
	}
		
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}


	@Override
	public String toString() {
		return "Patient [id=" + id + ", name=" + name + ", sex=" + sex
				+ ", age=" + age + ", identity_card=" + identity_card
				+ ", address=" + address + ", professional=" + professional
				+ ", allergic_History=" + allergic_History
				+ ", admission_time=" + admission_time + ", discharge_time="
				+ discharge_time + ", department_id=" + department_id
				+ ", username=" + username + ", atstate=" + atstate
				+ ", content=" + content + ", sickroomId=" + sickroomId
				+ ", bedId=" + bedId + "]";
	}

	
	
}
