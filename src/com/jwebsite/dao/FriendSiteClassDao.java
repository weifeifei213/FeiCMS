package com.jwebsite.dao;

import java.util.List;
import com.jwebsite.vo.FriendSiteClass;;

public interface FriendSiteClassDao {
	//添加友情链接分类
	public void InsertFriendSiteClass(FriendSiteClass siteClass) throws Exception;
	//删除友情链接
	public void DelFriendSiteClass(int ClassID) throws Exception;
	//修改友情链接
	public void UpdateFriendSiteClass(FriendSiteClass siteClass) throws Exception;
	//显示友情链接
	public String QueryFriendSiteName(int classID) throws Exception;  
    //查询全部
    public List<FriendSiteClass> QuaryAllClass() throws Exception;   
    //查询一个
    public FriendSiteClass QueryOneFriendSiteClass(int classID) throws Exception;
    //根据sql 获取友情链接
    public List<FriendSiteClass> QueryFriendSiteClassBySql(String sql)throws Exception; 
    

}
