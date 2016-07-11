package com.jwebsite.dao;

import java.util.List;

import com.jwebsite.vo.UserGroup;

public interface UserGroupDao {
	
	//根据ID删除用户组
	public void delUserGroup(int ID) throws Exception;
	//更新记录
	public void updateUserGroup(UserGroup usergroup) throws Exception;
	//添加用户组
	public void insertUserGroup(UserGroup usergroup) throws Exception; 
	//查询
	public List<UserGroup> queryUserGroup()throws Exception; 
	//获取一个用户组
	public UserGroup getUserGroup(String ID)throws Exception; 

}
