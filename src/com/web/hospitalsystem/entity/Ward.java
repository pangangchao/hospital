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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 病房
 * @author 
 *
 */
@Entity
@Table(name="ward")
public class Ward implements Serializable{
	private static final long serialVersionUID = 1L;
	private int wid;//病房编号
	private String name;//病房名称
	private String reason;//开设病床原因
	private Long bedNum;//床位个数
	private Long emptyBedNum;//空床位个数
	
	private Set<Hospitalbed> hospitalbeds = new HashSet<Hospitalbed>();
	
	private Department department;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	
	@Column(unique=true,nullable=false)
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	

	
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@OneToMany(mappedBy = "ward", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public Set<Hospitalbed> getHospitalbeds() {
		return hospitalbeds;
	}
	public void setHospitalbeds(Set<Hospitalbed> hospitalbeds) {
		this.hospitalbeds = hospitalbeds;
	}
	
	
	public Long getBedNum() {
		return bedNum;
	}
	public void setBedNum(Long bedNum) {
		this.bedNum = bedNum;
	}
	public Long getEmptyBedNum() {
		return emptyBedNum;
	}
	public void setEmptyBedNum(Long emptyBedNum) {
		this.emptyBedNum = emptyBedNum;
	}
	
	@ManyToOne(cascade = CascadeType.ALL, optional = false)
	@JoinColumn(name="departmentId",referencedColumnName="id")//外键为wardId ，与Depatement的wid关联
	public Department getDepartment() {
		return department;
	}
	
	public void setDepartment(Department department) {
		this.department = department;
	}
	@Override
	public String toString() {
		return "Ward [wid=" + wid + ", name=" + name + ", reason=" + reason
				+ ", bedNum=" + bedNum + ", emptyBedNum=" + emptyBedNum
				+ ", hospitalbeds=" + hospitalbeds + ", department="
				+ department + "]";
	}
	
	
}
