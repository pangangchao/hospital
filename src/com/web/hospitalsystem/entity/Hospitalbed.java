package com.web.hospitalsystem.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 病床
 * @author 
 *
 */

@Entity
@Table(name="hospitalbed")
public class Hospitalbed  implements Serializable{

	private static final long serialVersionUID = 1L;
	private int hid;//编号
	private int state;//是否为空床位
	
	private Ward ward;//病房
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@ManyToOne(cascade = CascadeType.ALL, optional = false)
	@JoinColumn(name="wardId",referencedColumnName="wid")//外键为wardId ，与ward的wid关联
	public Ward getWard() {
		return ward;
	}
	public void setWard(Ward ward) {
		this.ward = ward;
	}

	
}
