package com.jwebsite.dao;
import com.jwebsite.vo.SiteConfig;

public interface ConfigDao {
	//取得网站配置信息
	public SiteConfig  showConfig(String ID) throws Exception;
	//保存配置信息
	public void updateConfig(SiteConfig config) throws Exception;
	//新建站点配置信息
	public void AddConfig(SiteConfig config) throws Exception;
	//获取站点配置信息
	public SiteConfig ShowSiteConfig(String SiteID)throws Exception;

}
