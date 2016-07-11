package com.jwebsite.dao;

import java.sql.*;
import java.util.List;

import com.jwebsite.vo.FriendSite;

public interface FriendSiteDao {
  //显示所有友情链接
  public ResultSet showAllFs() throws Exception;
  public ResultSet showAllFs(String view) throws Exception;
  public ResultSet showAClassFs(String ClassId) throws Exception;
  //添加友情链接
  public void insertFs(FriendSite friendSite)  throws Exception;
  //删除友情链接
  public void delFs(FriendSite friendSite) throws Exception;
  //更新友情链接
  public void updateFs(FriendSite friendSite) throws Exception;
  //查询一条 
  public FriendSite quaryOneFs(int ID) throws Exception;
  //根据类别查找友情链接
  public List<FriendSite> getOneClassFriendSite(int ClassId) throws Exception;
  
}
