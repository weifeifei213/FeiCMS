package com.jwebsite.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.jwebsite.dao.SendMessageDao;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.vo.SendMessage;

public class SendMessageDaoImpl implements SendMessageDao {

	public void delSendMessage(int id) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="delete from SendMessage where deptid=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除信息报送出错！");
			System.out.println(e);
		}
		conn.closeConnection();
	}

	public void insertSendMessage(SendMessage SendMessage) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="insert into SendMessage (deptname,deptnum,deptadmin,depttime,deptqy,fenshu) values (?,?,?,?,?,?)";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, SendMessage.getDeptname());
			pstmt.setString(2, SendMessage.getDeptnum());
			pstmt.setString(3, SendMessage.getDeptadmin());
			pstmt.setString(4, SendMessage.getDepttime());
			pstmt.setString(5, SendMessage.getQuyu());
			pstmt.setInt(6, SendMessage.getFenshu());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("增加信息报送出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public ResultSet queryAllSendMessage() throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from SendMessage order by deptid";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		return rs;
	}

	public SendMessage queryOneSendMessage(int id) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		SendMessage SendMessage=new SendMessage(); 
		String strSql="select * from SendMessage where deptid="+id+" order by deptid";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
				SendMessage.setDeptid(id);
				SendMessage.setDeptname(rs.getString("deptname"));
				SendMessage.setDeptnum(rs.getString("deptnum"));
				SendMessage.setDeptadmin(rs.getString("deptadmin"));
				SendMessage.setDepttime(rs.getString("depttime"));
				SendMessage.setQuyu(rs.getString("deptqy"));
				SendMessage.setFenshu(Integer.parseInt(rs.getString("fenshu")));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		
		return SendMessage;
	}

	public void upDateSendMessage(SendMessage SendMessage) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update SendMessage set deptname=?,deptnum=?,deptadmin=?,depttime=?,deptqy=?,fenshu=? where deptid=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, SendMessage.getDeptname());
			pstmt.setString(2, SendMessage.getDeptnum());
			pstmt.setString(3, SendMessage.getDeptadmin());
			pstmt.setString(4, SendMessage.getDepttime());
			pstmt.setString(5, SendMessage.getQuyu());
			pstmt.setInt(6, SendMessage.getFenshu());
			pstmt.setInt(7, SendMessage.getDeptid());
			
			pstmt.executeUpdate();
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新信息报送出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}
	
	
	
	public void calcelNewSendMessage(int id) throws Exception
	{
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update SendMessage where deptid=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新信息报送出错！");
			System.out.println(e);
		}
		conn.closeConnection();
		
		
	}
	public SendMessage querySpringsSendMessage() throws Exception
	{
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		SendMessage SendMessage=new SendMessage(); 
		String strSql="select * from SendMessage  order by DateAndTime";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
//				SendMessage.setId(rs.getInt("ID"));
//				SendMessage.setTitle(rs.getString("Title"));
//				SendMessage.setContent(rs.getString("Content"));
//				SendMessage.setAuther(rs.getString("Author"));
//				SendMessage.setDateAndTime(rs.getString("DateAndtime"));
//				SendMessage.setIsSelected(rs.getInt("IsSelected"));
//				SendMessage.setShowType(rs.getInt("ShowType"));
//				SendMessage.setOutTime(rs.getInt("OutTime"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		
		return SendMessage;
		
		
	}
}
