package com.web.hospitalsystem.action.ward;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.hospitalsystem.entity.Department;
import com.web.hospitalsystem.entity.Hospitalbed;
import com.web.hospitalsystem.entity.Ward;
import com.web.hospitalsystem.service.DepartmentService;
import com.web.hospitalsystem.service.WardService;

@Namespace("/wardmanage")
@ParentPackage("json-default")
public class WardManageAction {
	private int wid;//病房编号
	private String name;//病房所属科
	private String reason;//开设病床原因
	private int departmentId;//所属科
	private Long bedNum;//床位个数
	private Long emptyBedNum;//空床位个数
	
	@Autowired
	private WardService wardService;
	
	@Autowired
	private DepartmentService departmentService;
	
	
	private String result;//返回结果
	
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	@JSON(serialize = false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@JSON(serialize = false)
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@JSON(serialize = false)
	public Long getBedNum() {
		return bedNum;
	}
	public void setBedNum(Long bedNum) {
		this.bedNum = bedNum;
	}
	@JSON(serialize = false)
	public Long getEmptyBedNum() {
		return emptyBedNum;
	}
	public void setEmptyBedNum(Long emptyBedNum) {
		this.emptyBedNum = emptyBedNum;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	public String getResult() {
		return result;
	}
	
	@JSON(serialize=false)
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	
	public Ward create(){
		Ward ward = new Ward();
		Department department = departmentService.findOneById(departmentId);
		ward.setDepartment(department);
		ward.setName(name);
		ward.setBedNum(bedNum);
		ward.setEmptyBedNum(bedNum);
		ward.setReason(reason);
		
		Set<Hospitalbed> hospitalbeds = new HashSet<Hospitalbed>();
		for(int i=0;i<bedNum;i++){
			Hospitalbed hospitalbed = new Hospitalbed();
			hospitalbed.setState(0);
			hospitalbed.setWard(ward);
			hospitalbeds.add(hospitalbed);
		}
		ward.setHospitalbeds(hospitalbeds);	
		return ward;
	}
	
	@Action(value="add",results = {@Result(name="json",type="json")})
	public String add(){
		Ward ward =this.create();
		boolean save_result = wardService.save(ward);
		if(save_result)
			result = "200";
		else
			result="404";
		return "json";
	}
	
	@Action(value="update",results={@Result(name="json",type="json")})
	public String update(){
		Department department = departmentService.findOneById(departmentId);
		boolean update_result = wardService.Update(wid, name,reason, department);
		//更新Session
		List<Ward> wards = wardService.getWards();
		ServletActionContext.getRequest().getSession().setAttribute("wards",wards);
		
		if(update_result)
			result = "200";
		else
			result = "404";
		return "json";
	}
	
	
	
	
}
