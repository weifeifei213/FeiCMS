package com.jwebsite.dao;

import java.util.List;

import com.jwebsite.vo.TemplateProject;

/**
 * 模板方案接口
 * @author 魏飞飞
 */
public interface TemplateProjectDao {
	//根据ID删除模板方案
	public void delTemplateProject(int TpID) throws Exception;
	//更新记录
	public void updateTemplateProject(TemplateProject Tp) throws Exception;
	//添加方案
	public void insertTemplateProject(TemplateProject Tp) throws Exception; 
	//查询方案
	public List<TemplateProject> queryTemplateProject()throws Exception; 
	//获取一个方案信息	
	public TemplateProject getTemplateProject(String TpID)throws Exception; 
	//执行一个sql
	public int ExecuteSQL(String sql)throws Exception;
	//修改状态
	public int UpdateState(String Action,String ID)throws Exception;
}
