package com.web.hospitalsystem.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="department")
public class Department implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;//科室编号
	private String departmentName;//科室名称
	
	private Set<Ward> wards = new HashSet<Ward>(); 

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column()
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(nullable=false,unique = false)
	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	@OneToMany(mappedBy="department", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public Set<Ward> getWards() {
		return wards;
	}

	public void setWards(Set<Ward> wards) {
		this.wards = wards;
	}
	
	
	
}
