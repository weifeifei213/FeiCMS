package com.jwebsite.dao;

import java.util.List;

import com.jwebsite.vo.User;

public interface UserDao {
	//根据ID删除用户
	public void delUser(int ID) throws Exception;
	//更新记录
	public void updateUser(User us) throws Exception;
	//添加用户
	public void insertUser(User us) throws Exception; 
	//查询用户
	public List<User> queryUser(int GroupID)throws Exception; 
	public List<User> queryUser(String sql)throws Exception; 
	//获取一个模型	
	public User getUser(String ID)throws Exception; 
	//执行一个sql
	public int ExecuteSQL(String sql)throws Exception;
	//修改登录时间
	public int UpdateLoginTime(String ID)throws Exception;
	//修改登录IP
	public int UpdateLoginIP(String IP,String ID)throws Exception;
	//修改登录次数
	public int UpdateLoginTimes(String ID)throws Exception;
	//修改用户锁定状态
	public int UpdateIsLocked(String Action,String ID)throws Exception;
	
}
