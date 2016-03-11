package com.web.hospitalsystem.action.hospitalbed;

import java.util.Iterator;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.hospitalsystem.entity.Hospitalbed;
import com.web.hospitalsystem.service.HospitalBedService;

@Namespace("/hospitalbed")
@ParentPackage("json-default")
public class HospitalbedInfoAction {
	@Autowired
	private HospitalBedService hospitalBedService;
	
	private int id;
	private String result;
	
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
	
	@Action(value="bedinfo",results = {@Result(name="input",type="json")})	
	public String getAllBedInfo(){
		List<Hospitalbed> list = hospitalBedService.getHostHospitalbeds(id);
		StringBuilder json = new StringBuilder();
		json.append("[");
		Iterator<Hospitalbed>  hospitalbeds = list.iterator();
		while(hospitalbeds.hasNext()){
			Hospitalbed hospitalbed = hospitalbeds.next();
			json.append("{");
			json.append("\"id\":\"").append(hospitalbed.getHid()).append("\",");
			json.append("\"state\":\"").append(hospitalbed.getState()).append("\",");
			json.append("\"name\":\"").append(hospitalbed.getWard().getName()).append("\"");
			json.append("},");
		}
		json.deleteCharAt(json.length()-1);
		json.append("]");
		result=json.toString();
		return "input";
	}
}
