package com.jwebsite.dao;

import java.util.List;

import com.jwebsite.vo.SiteConfig;

public interface SiteDao {
	//根据ID删除分类
	public void delSite(int SiteID) throws Exception;
	//更新记录
	public void updateSite(SiteConfig site) throws Exception;
	//添加分类
	public void insertSite(SiteConfig site) throws Exception; 
	//查询
	public List<SiteConfig> querySite()throws Exception; 
	//获取一个站点信息	
	public SiteConfig getSite(String SiteID)throws Exception; 
}
