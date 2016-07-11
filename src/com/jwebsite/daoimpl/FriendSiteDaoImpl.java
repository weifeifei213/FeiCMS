package com.jwebsite.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jwebsite.dao.FriendSiteDao;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.vo.FriendSite;

public class FriendSiteDaoImpl implements FriendSiteDao {
	
	public void delFs(FriendSite friendSite) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="delete from friendsite where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, friendSite.getID());			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除友情链接出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public void insertFs(FriendSite friendSite) throws Exception {
		// TODO Auto-generated method stub
	DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="insert into friendsite (ClassID,SiteName,SiteUrl,LogoUrl,SiteEmail,SiteIntro,UpdateTime) values (?,?,?,?,?,?,?)";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, friendSite.getClassID());
			pstmt.setString(2, friendSite.getSiteName());
			pstmt.setString(3, friendSite.getSiteUrl());
			pstmt.setString(4, friendSite.getLogoUrl());
			pstmt.setString(5, friendSite.getSiteEmail());
			pstmt.setString(6, friendSite.getSiteIntro());
			pstmt.setString(7, friendSite.getUpdateTime());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加友情链接出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public ResultSet showAllFs() throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from friendsite order by ID";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();			
			rs=stmt.executeQuery(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示全部友情链接出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
        
		return rs;
	}
	/**
	 * 当登陆非超级管理员时使用这个查询友情链接
	 */
	public ResultSet showAllFs(String view) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from friendsite  where classid in (select classid from site_class where id in ("+view+"))order by ID";
		
		System.out.println(strSql);
		try {
		conn=new DbConnection();
			stmt=conn.getConnection().createStatement();			
			rs=stmt.executeQuery(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示全部友情链接出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
        
		return rs;
	}

	public void updateFs(FriendSite friendSite) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update friendsite set  ClassID=?,SiteName=?,SiteUrl=?,LogoUrl=?,SiteEmail=?,SiteIntro=?,UpdateTime=? where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, friendSite.getClassID());
			pstmt.setString(2, friendSite.getSiteName());
			pstmt.setString(3, friendSite.getSiteUrl());
			pstmt.setString(4, friendSite.getLogoUrl());
			pstmt.setString(5, friendSite.getSiteEmail());
			pstmt.setString(6, friendSite.getSiteIntro());
			pstmt.setString(7, friendSite.getUpdateTime());
			pstmt.setInt(8, friendSite.getID());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新友情链接出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}
	public FriendSite quaryOneFs(int ID) throws Exception		
	{
		FriendSite fs=new FriendSite(); 
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from friendsite where ID="+ID+"";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();			
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
				fs.setID(rs.getInt("ID"));
				fs.setSiteName(rs.getString("SiteName"));
				fs.setSiteUrl(rs.getString("SiteUrl"));
				fs.setSiteEmail(rs.getString("SiteEmail"));
				fs.setClassID(rs.getInt("ClassID"));
				fs.setLogoUrl(rs.getString("LogoUrl"));
				fs.setUpdateTime(rs.getString("UpdateTime"));
				fs.setSiteIntro(rs.getString("SiteIntro"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询友情链接出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
        
		return fs;

	}

	public List<FriendSite> getOneClassFriendSite(int ClassId) throws Exception {
		// TODO Auto-generated method stub
			
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from friendsite where ClassID ="+ClassId;
		List<FriendSite> list=new ArrayList<FriendSite>();
		
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();			
			rs=stmt.executeQuery(strSql);
			while(rs.next())
			{   FriendSite fs=new FriendSite(); 
				fs.setID(rs.getInt("ID"));
				fs.setSiteName(rs.getString("SiteName"));
				fs.setSiteUrl(rs.getString("SiteUrl"));
				fs.setSiteEmail(rs.getString("SiteEmail"));
				fs.setClassID(rs.getInt("ClassID"));
				fs.setLogoUrl(rs.getString("LogoUrl"));
				fs.setUpdateTime(rs.getString("UpdateTime"));
				fs.setSiteIntro(rs.getString("SiteIntro"));
				list.add(fs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询友情链接出错！ on get on class   ");
			System.out.println(e);
		}
		
		
		
		return list;
	}

	public ResultSet showAClassFs(String ClassId) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from friendsite  where classid ="+ClassId;
		
		System.out.println(strSql);
		try {
		conn=new DbConnection();
			stmt=conn.getConnection().createStatement();			
			rs=stmt.executeQuery(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示全部友情链接出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
		return rs;
	}
	
	
	
	
}
