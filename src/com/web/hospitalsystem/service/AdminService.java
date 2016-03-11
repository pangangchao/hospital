package com.web.hospitalsystem.service;

import java.util.List;

import com.web.common.base.IBaseService;
import com.web.hospitalsystem.entity.Admin;

public interface AdminService extends IBaseService {
	/**
	 * 管理员登陆
	 * @param username管理员账号
	 * @param password 管理员密码
	 * @return
	 */
	public Admin login(String username,String password);
	
	/**
	 * 添加管理员
	 * @param username 账号
	 * @param password 密码
	 * @return
	 */
	public boolean add(String username,String password);
	
	/**
	 *获取所有admin 
	 * @return
	 */
	public List<Admin> getAll();
	
	/**
	 * 通过账号删除
	 * @param username
	 * @return
	 */
	public boolean delete(String username);
}
