package com.jwebsite.dao;

import java.util.List;

import com.jwebsite.vo.Model;

public interface ModelDao {
	//根据ID删除模型
	public void delModel(int ID) throws Exception;
	//更新记录
	public void updateModel(Model md) throws Exception;
	//添加模型
	public void insertModel(Model md) throws Exception; 
	//查询模型
	public List<Model> queryModel(int SiteID)throws Exception; 
	public List<Model> queryModel(String sql)throws Exception; 
	//获取一个模型	
	public Model queryAModel(String ID)throws Exception; 
	//执行一个sql
	public int ExecuteSQL(String sql)throws Exception;
	//修改状态
	public int UpdateState(String Action,String ID)throws Exception;
}
