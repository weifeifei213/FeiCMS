package com.jwebsite.db;

import java.sql.SQLException;

import com.jwebsite.db.ConnectionPool.PooledConnection;



public class DBManager {
	private static PooledConnection conn;
	private static ConnectionPool connectionPool;
	private static DBManager inst;

	public void close() {
		try {
			connectionPool.closeConnectionPool();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public DBManager() {
		if (inst != null)
			return;
		try {
			ConfigPara rc = null;
			String filePath = "dbconn.properties";
			rc = new ConfigPara(filePath);
			String host = rc.getValue("host");
			String dbDriver = rc.getValue("Driver");
			String dbname = rc.getValue("dbname");
			String dbuser = rc.getValue("dbuser");
			String dbpassword = rc.getValue("dbpassword");
			String maxConnections = rc.getValue("maxConnections");
			/*String host = "localhost";
			
			String dbDriver = "com.mysql.jdbc.Driver";
			String dbname = "zhcms";
			String dbuser = "root";
			String dbpassword = "gy19790612";
			String maxConnections = "20";*/

/*			System.out.println(host);
			System.out.println(dbDriver);
			System.out.println(dbname);
			System.out.println(dbuser);
			System.out.println(dbpassword);
			System.out.println(maxConnections);*/
			connectionPool = new ConnectionPool(
					dbDriver,
					"jdbc:mysql://"
							+ host
							+ ":3306/"
							+ dbname
							+ "?useUnicode=true&characterEncoding=utf8&autoReconnect=true",
					dbuser, dbpassword);
			connectionPool.setMaxConnections(Integer.parseInt(maxConnections));
			connectionPool.createPool();
			inst = this;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static PooledConnection getConnection() {
		if (inst == null)
			new DBManager();
		try {
			conn = connectionPool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void main(String[] args) {

	}

}
