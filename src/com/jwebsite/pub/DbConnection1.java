package com.jwebsite.pub;

import java.sql.*;

public class DbConnection1 {
	private final String DBDRIVER = "org.gjt.mm.mysql.Driver";
	private final String DBURL = "jdbc:mysql://127.0.0.1:3306/etcs?useUnicode=true&characterEncoding=GBK";
	private final String DBUSER = "root";
	private final String DBPASSWORD = "root";
	private Connection conn = null;
	private Statement stmt=null;
	private ResultSet rs=null;

	public DbConnection1() {
		try {
			Class.forName(DBDRIVER);
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("连接数据库出错！！");
			System.out.println(e);
		}
		

	}

	public Connection getConnection() {

		return this.conn;
	}

	public void closeConnection() {
		try {
			this.conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}

	}

	public void executeSql(String strSql) {
		try {
			stmt = this.conn.createStatement();
			stmt.execute(strSql);

		} catch (Exception ex) {
			System.out.println("执行SQL语句失败！");
			System.out.println(strSql);
			System.out.println(ex);
		}

	}

	public ResultSet executeQuerySql(String strSql) {
          
		try {
			stmt = this.conn.createStatement();
			rs = stmt.executeQuery(strSql);

		} catch (Exception ex) {
			System.out.println("执行SQL语句失败！");
			System.out.println(strSql);
			System.out.println(ex);

		}

		return rs;
	}

public static void main(String args[])
{
	DbConnection1 conn=null;
	String strSql="insert into article_class (ParentID,ClassDir,Readme) values (0,'newsdir','爱你以往哈')";
	try{
		conn=new DbConnection1();
		conn.executeSql(strSql);
		
		
	}
	catch(Exception ex)
	{
		
		
	}
	

}

}
