package com.jwebsite.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.jwebsite.dao.TestDao;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.vo.Test;

public class TestDaoImpl implements TestDao {
	
	public void delTest(int id) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="delete from test where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除试卷出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public void insertTest(Test test) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="insert into  test (TestName,Status,CreateTime,EndTime,Readme) values (?,?,?,?,?)";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, test.getTestName());
			pstmt.setInt(2, test.getStatus());
			pstmt.setString(3, test.getCreateTime());
			pstmt.setString(4, test.getEndTime());
			pstmt.setString(5, test.getReadMe());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加试卷出错！");
			System.out.println(e);
		}
		conn.closeConnection();
	}

	public Test queryTest(int id) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		Test test=new Test();
		String strSql="select * from test where  ID="+id+"";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
				test.setTestName(rs.getString("TestName"));
				test.setStatus(rs.getInt("Status"));
				test.setCreateTime(rs.getString("CreateTime"));
				test.setEndTime(rs.getString("EndTime"));
				test.setReadMe(rs.getString("Readme"));
				
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除试卷出错！");
			System.out.println(e);
		}
		conn.closeConnection();
		return test;
	}

	public ResultSet showAllTest() throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from test ";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询试卷出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
		return rs;
	}

	public void updateTest(Test test) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=null;
		PreparedStatement pstmt=null;
		String strSql="update  test  set TestName=?,Status=?,CreateTime=?,EndTime=?,Readme=? where ID=?";
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, test.getTestName());
			pstmt.setInt(2, test.getStatus());
			pstmt.setString(3, test.getCreateTime());
			pstmt.setString(4, test.getEndTime());
			pstmt.setString(5, test.getReadMe());
			pstmt.setInt(6, test.getID());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("修改试卷出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}
	public String getTestName(int id) throws Exception
	{
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String testName=null;
		String strSql="select * from test where ID="+id+"";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
				
				testName=rs.getString("TestName");
				
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询试卷出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
		return testName;
		
		
	}

}
