package com.jwebsite.dao;

import java.sql.*;

import com.jwebsite.vo.ArticleClass;

public interface ArticleClassDao {
	//根据ID删除分类
	public void delClass(int classID) throws Exception;
	//更新记录
	public void updateClass(ArticleClass articleClass) throws Exception;
	//添加分类
	public void insertClass(ArticleClass articleClass) throws Exception;
	//根据ID查询一条记录
	public ResultSet queryByID(int classID) throws Exception;
	//显示顶级类
	public String  queryAllTop(int parentID,int classID) throws Exception;
	public String  showAllTopClassByPage(String PageUrl) throws Exception;
	public String  showAllTopClass() throws Exception;
	
	public String  queryOneTop(int parentID,int classID) throws Exception;
	public String  queryOneTop(String parentID,int classID) throws Exception;
	public String  queryOneTop(String parentID,int classID,boolean deptno) throws Exception;
	
	public String  queryAllTop(int parentID,int classID,int adminid) throws Exception;
    //显示栏目名称
	//public String getClassName(int classID) throws Exception;
	//取得父类ID
	public int getParentID(int classID) throws Exception;
    //显示栏目名称
	public String  queryClassNameByID(int classID) throws Exception;
	//显示所有子类
	public String queryChildClass(int parentID, String strNbsp,String purview_View,String purview_Input,String purview_Check,String purview_Manage) throws Exception;
	

}
