package com.web.hospitalsystem.util;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class GenerateIDUtil {
		
	/**
	 * 生成工作号
	 * @param id 用户编号
	 * @param type 类型 0 护士，1医生，3管理员
	 * @param deparmentId 部门id
	 * @return 工作号
	 */
	public static String generateJobId(int id,int type ,int deparmentId){
		//生成时间
		String pattern = "yyyyMM";
		DateFormat df = new SimpleDateFormat(pattern);
		String data = df.format(new Date());
		
		
		StringBuffer username = new StringBuffer();
		switch (type) {
		case 0:
			username.append("n");
			break;
		case 1:
			username.append("d");
			break;
		case 3:
			username.append("a");
			break;
		default:
			break;
		}
		username.append(data);
		username.append(deparmentId);
		username.append(id);
	
		return username.toString();
	}
	
	public static String generatePatientID(){
		
		String pattern = "yyyyMMddHHmmSS";
		DateFormat df = new SimpleDateFormat(pattern);
		String data = df.format(new Date());
		StringBuffer username = new StringBuffer();
		username.append(data);
		
		Random random = new Random();
		for(int i=0;i<5;i++){
			username.append(random.nextInt(5)+1);
		}
		return username.toString();
	}
	
	/**
	 * 
	 * @param doctorID
	 * @return
	 */
	public static String generateMedicalInformationID(int doctorID){
		String pattern = "yyyyMMddmm";
		DateFormat df = new SimpleDateFormat(pattern);
		String data = df.format(new Date());
		StringBuffer medicalID = new StringBuffer();
		medicalID.append(data);
		medicalID.append(doctorID);
		return medicalID.toString();
	}
	
	public static void main(String[] args){
//		String username =generateJobId(122, 1, 212);
//		String username2  = GenerateIDUtil.generatePatientID(2);
//		System.out.println(username);
		//生成遗嘱单
		String medical = GenerateIDUtil.generateMedicalInformationID(122);
		System.err.println(medical);
		String id=GenerateIDUtil.generatePatientID();
		System.out.println(id);
	}
}
