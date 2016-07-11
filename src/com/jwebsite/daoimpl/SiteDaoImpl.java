package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.SiteDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.pub.ObjectType;
import com.jwebsite.vo.SiteConfig;


public class SiteDaoImpl implements SiteDao {
	ObjectType ot=new ObjectType();
	HashMapOperate ho=new HashMapOperate<SiteConfig>();
	//根据ID删除分类
	public void delSite(int SiteID) throws Exception {
		// TODO Auto-generated method stub
		String strSql="delete from siteconfig where SiteID="+SiteID+"";
	    try {			
			DbConn.executeSQL(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除文章分类发生错误！");
			System.out.println(e);
		}
	}
	//添加分类
	public void insertSite(SiteConfig site) throws Exception {
		// TODO Auto-generated method stub
		DbConn.executeInsert(site);
	}
	//查询
	public List<SiteConfig> querySite() throws Exception {
		// TODO Auto-generated method stub		
		String sql="select * from siteconfig";
		System.out.println("查询站点："+sql);
		ArrayList<SiteConfig> sitelist = new ArrayList<SiteConfig>();
		ArrayList<HashMap<String, String>> sitemlist=new ArrayList<HashMap<String,String>>();
		sitemlist =DbConn.executeQuery(sql);
		System.out.println("查询站点："+sitemlist.size());
		sitelist=(ArrayList<SiteConfig>) ho.HashMapToObjectList(sitemlist, SiteConfig.class);
		
		System.out.println("查询站点："+sql);
		System.out.println("站点数量："+sitelist.size());
		return sitelist;
	}
	//更新记录
	public void updateSite(SiteConfig site) throws Exception {
		// TODO Auto-generated method stub
		DbConn.executeUpdate(site, "SiteID");
	}
	//获取一个站点信息	
	public SiteConfig getSite(String SiteID)throws Exception{
		String sql="select * from siteconfig where SiteID = "+SiteID;		
		HashMap<String, String> sm=DbConn.executeQueryOne(sql);			
		SiteConfig site=(SiteConfig) ho.HashMapToPojo(sm, SiteConfig.class);		
		return site;
	}

}
