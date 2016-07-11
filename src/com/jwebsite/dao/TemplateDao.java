package com.jwebsite.dao;

import java.util.List;

import com.jwebsite.vo.Template;

public interface TemplateDao {
	//根据ID删除模板
	public void delTemplate(int TpID) throws Exception;
	//更新记录
	public void updateTemplate(Template Tp) throws Exception;
	//添加模板
	public void insertTemplate(Template Tp) throws Exception; 
	//查询模板
	public List<Template> queryTemplate()throws Exception; 
	public List<Template> queryTemplate(String sql)throws Exception; 
	//获取一个模板	
	public Template getTemplate(String TpID)throws Exception; 
	//执行一个sql
	public int ExecuteSQL(String sql)throws Exception;
	//修改状态
	public int UpdateState(String Action,String ID)throws Exception;
}
