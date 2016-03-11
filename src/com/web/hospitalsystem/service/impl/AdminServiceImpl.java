package com.web.hospitalsystem.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.common.base.IBaseServiceImpl;
import com.web.hospitalsystem.entity.Admin;
import com.web.hospitalsystem.service.AdminService;
import com.web.hospitalsystem.util.MD5Util;

@Service("adminService")
public class AdminServiceImpl extends IBaseServiceImpl implements AdminService {
	/**
	 * 管理员登陆
	 * @param username管理员账号
	 * @param password 管理员密码
	 * @return
	 */
	public Admin login(String username,String password){
		Admin  admin = (Admin)dao.findOne("from Admin admin where admin.jobID=? ", username);
		if(admin!=null){
			if(MD5Util.MD5Validate(password, admin.getPassword()))
				return admin; 
		}
		return null;
	}
	/**
	 * 添加管理员
	 * @param username 账号
	 * @param password 密码
	 * @return
	 */
	public boolean add(String username,String password){
		
		String key = MD5Util.MD5(password);
		Admin admin = new Admin();
		admin.setJobID(username);
		admin.setPassword(key);
		
		return dao.save(admin);
	}
	
	/**
	 *获取所有admin 
	 * @return
	 */
	public List<Admin> getAll(){
		return dao.find("from Admin admin");
	}
	
	/**
	 * 通过账号删除
	 * @param username
	 * @return
	 */
	public boolean delete(String username){
		return dao.delete("delete Admin admin where admin.jobID=?",username);
	}
}
