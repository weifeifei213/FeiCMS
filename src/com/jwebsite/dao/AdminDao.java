package com.jwebsite.dao;

import java.sql.ResultSet;

import com.jwebsite.vo.Admin;

public interface AdminDao {
	//添加管理员
	public void insertAdmin(Admin admin) throws Exception;
	//修改管理员密码
	public void updateAdminPwd(Admin admin) throws Exception;
	//删除管理员
	public void delAdmin(int adminID) throws Exception;
	//显示所有管理员
	public ResultSet showAllAdmin() throws Exception;
	//查询一个
	public Admin showAdmin(int adminID) throws Exception;
	//验证登录
	public boolean checkAdmin(String admin_name,String password) throws Exception;
	//根据用户名取得用户信息
	public Admin getAdminInfo(String adminName) throws Exception;
	//修改用户登录信息
	public void setAdminLoginInfo(Admin admin) throws Exception;
	//验证管理员权限
	public boolean checkAdminPopedom(int adminID,String popNum) throws Exception;
	public boolean checkAdminInputPop(int adminID,int classID) throws Exception;
	public boolean checkAdminViewPop(int adminID,int classID) throws Exception;
	public boolean checkAdminCheckPop(int adminID,int classID) throws Exception;
	public boolean checkAdminManagePop(int adminID,int classID) throws Exception;
	//修改管理员权限
	public void updateAdminPop(Admin admin) throws Exception;

}
