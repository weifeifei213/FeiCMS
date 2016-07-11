package com.jwebsite.dao;

import java.util.ArrayList;
import java.util.List;

import com.jwebsite.vo.SiteClass;;

public interface SiteClassDao {
	//根据ID删除分类
	public void delClass(int classID) throws Exception;
	//更新记录
	public void updateClass(SiteClass sc) throws Exception;
	//添加分类
	public void insertClass(SiteClass sc) throws Exception;
	//根据ID查询一条记录
	public SiteClass queryByID(int classID) throws Exception;
	
	//查询顶级类 --只查询顶级类
	public List<SiteClass> queryTopClassList() throws Exception;
	
	//获取栏目结构 --顶级节点
	public List<SiteClass> queryAllTop(String parentID,String classID)throws Exception;
	//获取栏目结构 --子节点节点
	public ArrayList<SiteClass> queryAllChild(String parentID, String classID,ArrayList<SiteClass> sclist)throws Exception; 	
	
	//获取栏目结构 --顶级节点	 根据 AdminID
	public ArrayList<SiteClass>  queryOneTop(int parentID,int AdminID) throws Exception;
	//获取栏目结构 --子节点节点 根据 AdminID
	public ArrayList<SiteClass> queryOneChild(String parentID, ArrayList<SiteClass> sclist,int AdminID)throws Exception; 
	
	//获取栏目结构 --顶级节点     根据 adminid 有ClassID
	public ArrayList<SiteClass>  queryAllTop(String parentID,String classID,String adminid) throws Exception;
	//获取栏目结构 --子节点节点  根据 adminid 有ClassID
	public ArrayList<SiteClass> queryAllChild(String parentID, String classID, ArrayList<SiteClass> sclist,String adminid)throws Exception; 
    
	//显示栏目名称
	public String getClassName(int classID) throws Exception;
	//取得父类ID
	public int getParentID(int classID) throws Exception;
    //显示栏目名称
	public String  queryClassNameByID(int classID) throws Exception;
	//显示所有子类
	public String queryChildClass(int parentID, String strNbsp,String purview_View,String purview_Input,String purview_Check,String purview_Manage) throws Exception;
	

}
