package com.jwebsite.dao;

import java.util.List;

import com.jwebsite.vo.SiteClass;;

public interface PhotoClassDao {
	//根据ID获取图片分类
	public SiteClass GetPhotoClassByID(int ID);
	//根据sql查询
	public List<SiteClass> GetPhotoClassList(String sql);
	//删除
	public void DelPhotoClass(int ID);
	//增加
	public int AddPhotoClass(SiteClass cs);
	//跟新
	public void UpdatePhotoClass(SiteClass cs);
	// 获取所有一级栏目
	public List<SiteClass> GetParentNode(String sql);
	// 根据一级栏目获取子节点
	public List<SiteClass> GetAllChildNode(int ClassID,List<SiteClass> childlist);
	// 获取所有的栏目
	public String GetAllClass();
	// 根据classID 获取所有子节点
	public String GetAllClass(int ClassID);
	// 获取一个节点  以string 形式返回
	public String GetClass(String ClassID);
	// 获取一个完整的节点 
	public SiteClass GetPhotoClass(String ClassID);
	// 根据父类获取子类
	public List GetphotoByClass(int ClassID);
	// 根据子节点获取所有上级节点
	public List<SiteClass> GetPhotoParent(int ClassID, List<SiteClass> list);

}
