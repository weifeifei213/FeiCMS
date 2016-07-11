package com.jwebsite.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.jwebsite.dao.AdminDao;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.vo.Admin;

public class AdminDaoImpl implements AdminDao {
	
	public void delAdmin(int adminID) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="delete from admin where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, adminID);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除管理员出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public void insertAdmin(Admin admin) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="insert into admin (AdminName,Password,Purview,AdminPopList,arrClass_View,arrClass_Input,arrClass_Check,arrClass_Manage,sendmessageid) values " +
				"(?,?,?,?,?,?,?,?,?)";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, admin.getAdminName());
			pstmt.setString(2, admin.getPassword());
			pstmt.setInt(3, admin.getPurview());
			pstmt.setString(4, admin.getAdminPopList());
			pstmt.setString(5,admin.getArrClass_View());
			pstmt.setString(6, admin.getArrClass_Input());
			pstmt.setString(7, admin.getArrClass_Check());
			pstmt.setString(8, admin.getArrClass_Manage());
			pstmt.setInt(9, admin.getSendmessageid());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加管理员出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public Admin showAdmin(int adminID) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		Admin admin=new Admin();
		String strSql="select * from admin where ID="+adminID+"";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
				admin.setId(rs.getInt("ID"));
				admin.setAdminName(rs.getString("AdminName"));
				admin.setPurview(rs.getInt("Purview"));
				admin.setAdminPopList(rs.getString("AdminPopList"));
				admin.setArrClass_Check(rs.getString("ArrClass_Check"));
				admin.setArrClass_Input(rs.getString("ArrClass_Input"));
				admin.setArrClass_Manage(rs.getString("ArrClass_Manage"));
				admin.setArrClass_View(rs.getString("ArrClass_View"));
				admin.setSendmessageid(rs.getInt("sendmessageid"));
						
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询管理员出错！");
			System.out.println(e);
		}finally{
			conn.closeConnection();
		}
		
       return admin;
	}

	public ResultSet showAllAdmin() throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from admin order by ID";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示所有管理员出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
		return rs;
	}

	public void updateAdminPwd(Admin admin) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update admin set Password=? where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, admin.getPassword());
			pstmt.setInt(2, admin.getId());
			pstmt.executeUpdate();
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("修改管理员密码出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}
	public void updateAdminPop(Admin admin) throws Exception
	{
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update admin set Purview=?,AdminPopList=?,arrClass_View=?,arrClass_Input=?,arrClass_Check=?,arrClass_Manage=? where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, admin.getPurview());
			pstmt.setString(2, admin.getAdminPopList());
			pstmt.setString(3,admin.getArrClass_View());
			pstmt.setString(4, admin.getArrClass_Input());
			pstmt.setString(5, admin.getArrClass_Check());
			pstmt.setString(6, admin.getArrClass_Manage());
			pstmt.setInt(7, admin.getId());
			pstmt.executeUpdate();
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("修改管理员权限出错！");
			System.out.println(e);
		}
		conn.closeConnection();
		
		
	}
	public boolean checkAdmin(String admin_name,String password)
	{
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		boolean isLogin=false;
		String strSql="select * from admin where AdminName='"+admin_name+"' and Password='"+password+"'";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
			   isLogin=true;
							
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除管理员出错！");
			System.out.println(e);
		}
		conn.closeConnection();
       return isLogin;
		
		
		
	}
	public Admin getAdminInfo(String adminName) throws Exception
	{
		Admin admin=new Admin();
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from admin where AdminName='"+adminName+"'";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
			    admin.setPurview(rs.getInt("Purview"));
			    admin.setLoginTimes(rs.getInt("LoginTimes"));
				admin.setId(rs.getInt("ID"));
				admin.setAdminPurview_Article(rs.getString("AdminPurview_Article"));
				admin.setAdminPurview_Others(rs.getString("AdminPurview_Others"));
				admin.setSendmessageid(Integer.parseInt(rs.getString("sendmessageid")));
				
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(" 取得管理员信息出错！");
			System.out.println(e);
		}
		conn.closeConnection();
		
		return admin;
	}
	public void setAdminLoginInfo(Admin admin) throws Exception
	{
		
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update admin set LastLoginIP=?,LastLoginTime=?,LoginTimes=? where AdminName=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, admin.getLastLoginIP());
			pstmt.setString(2, admin.getLastLoginTime());
			pstmt.setInt(3, admin.getLoginTimes());
			pstmt.setString(4, admin.getAdminName());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新管理员登录信息出错！");
			System.out.println(e);
		}
		conn.closeConnection();
		
	}
	public boolean checkAdminPopedom(int adminID,String popNum) throws Exception
	{
		boolean isAdminPop=false;
		Admin admin=this.showAdmin(adminID);
		String adminPopList=admin.getAdminPopList();
		String adminPop[]=adminPopList.split(",");
		if(admin.getPurview()==1)
		{
			isAdminPop=true;
			
		}
		for(int i=0;i<adminPop.length;i++)
		{
			if(popNum.equals(adminPop[i]))
			{
				isAdminPop=true;
				
			}
			
			
		}
		
		return isAdminPop;
	}
	public boolean checkAdminInputPop(int adminID,int classID) throws Exception
	{
		
		boolean isAdminPop=false;
		Admin admin=this.showAdmin(adminID);
		String adminPopList=admin.getArrClass_Input();
		if(admin.getPurview()==1)
		{
			isAdminPop=true;
			
		}
		if(adminPopList.indexOf(Integer.toString(classID))>=0)
		{
			
			isAdminPop=true;
			
		}
		
		return isAdminPop;
		
		
	}
	public boolean checkAdminCheckPop(int adminID,int classID) throws Exception
	{
		
		boolean isAdminPop=false;
		Admin admin=this.showAdmin(adminID);
		String adminPopList=admin.getArrClass_Check();
		if(admin.getPurview()==1)
		{
			isAdminPop=true;
			
		}
		if(adminPopList.indexOf(Integer.toString(classID))>=0)
		{
			
			isAdminPop=true;
			
		}
		
		return isAdminPop;
		
		
	}
	public boolean checkAdminViewPop(int adminID,int classID) throws Exception
	{
		
		boolean isAdminPop=false;
		Admin admin=this.showAdmin(adminID);
		String adminPopList=admin.getArrClass_View();
		if(admin.getPurview()==1)
		{
			isAdminPop=true;
			
		}
		if(adminPopList.indexOf(Integer.toString(classID))>0)
		{
			
			isAdminPop=true;
			
		}
		
		return isAdminPop;
		
		
	}
	public boolean checkAdminManagePop(int adminID,int classID) throws Exception
	{
		
		boolean isAdminPop=false;
		Admin admin=this.showAdmin(adminID);
		String adminPopList=admin.getArrClass_Manage();
		if(admin.getPurview()==1)
		{
			isAdminPop=true;
			
		}
		if(adminPopList.indexOf(Integer.toString(classID))>=0)
		{
			
			isAdminPop=true;
			
		}
		
		return isAdminPop;
		
		
	}
}
