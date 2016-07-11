package com.jwebsite.db;



import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.jwebsite.db.ConnectionPool.PooledConnection;
import com.jwebsite.pub.ObjectType;


public class DbConn {

	public DbConn() {

	}

	public static void cleanUP(Connection con, Statement stmt, ResultSet rs) {
		try {
			try {
				if (rs != null) {
					rs.close();
				}
			} finally {
				try {
					if (stmt != null) {
						stmt = null;
					}
				} finally {
					if (con != null) {
						con.close();
					}
				}
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			System.out
					.println("##Close DB Connection error_____print by zsx##");
		}
	}

	public static void cleanUP(Connection con, PreparedStatement pstmt,ResultSet rs) {
		try {
			try {
				if (rs != null) {
					rs.close();
				}
			} finally {
				try {
					if (pstmt != null) {
						pstmt = null;
					}
				} finally {
					if (con != null) {
						con.close();
					}
				}
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			System.out
					.println("##Close DB Connection error_____print by zsx##");
		}
	}

	//查询操作 返回值是 ArrayList<HashMap<String, String>>
	public static ArrayList<HashMap<String, String>> executeQuery(
			String sqlQueryStmt) {
		// System.out.println("SQL String is"+sqlQueryStmt);
		ArrayList<HashMap<String, String>> rows = new ArrayList<HashMap<String, String>>();
		PooledConnection conn = null;
		ResultSet rs = null;
		try {
			sqlQueryStmt = StringtoSql(sqlQueryStmt);
			sqlQueryStmt = SqltoString(sqlQueryStmt);
			conn = DBManager.getConnection();
			rs = conn.executeQuery(sqlQueryStmt);
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			while (rs.next()) {
				System.out.println("【数据库连】接查询多条记录测试");
				HashMap<String, String> row = new HashMap<String, String>();
				for (int i = 0; i < columnCount; i++) {
					/*
					 * String cname=rsmd.getColumnName(i);
					 * //System.out.println("ColumnName is  "+cname);
					 * if(rs.getObject(i)==null ||
					 * rs.getObject(i).toString().length()<=0 ||
					 * rs.getObject(i).toString().equals("null")) {
					 * row.put(cname, "");
					 * //System.out.println("ColumnName is  "+cname
					 * +"        ["+rs.getObject(i).toString()+"]"); } else {
					 * row.put(cname, rs.getObject(i).toString());
					 * //System.out.println("ColumnName is  "+cname
					 * +"        ["+rs.getObject(i).toString()+"]"); }
					 */
					row.put(rsmd.getColumnLabel(i + 1),
							rs.getObject(i + 1) == null ? "" : rs.getObject(
									i + 1).toString());
				}
				rows.add(row);
			}
			return rows;
		} catch (Exception e) {
			System.out.println("查询数据库出错，SQL语句为：" + sqlQueryStmt + "/n错误信息为："
					+ e.getMessage());
			return null;
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println("释放连接出错，错误信息为：" + e.getMessage());
			}
		}
	}
	//查询一条记录 
	public static HashMap<String, String> executeQueryOne(String sqlQueryStmt) {
		PooledConnection conn = null;
		ResultSet rs = null;	
		HashMap<String, String> row=null;
		try {
			sqlQueryStmt = StringtoSql(sqlQueryStmt);
			sqlQueryStmt = SqltoString(sqlQueryStmt);
			conn = DBManager.getConnection();
			rs = conn.executeQuery(sqlQueryStmt);
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			while (rs.next()) {
				System.out.println("【数据库连】接查询一条记录测试");
			 row = new HashMap<String, String>();
			for (int i = 0; i < columnCount; i++) {			
				row.put(rsmd.getColumnLabel(i + 1),
						rs.getObject(i + 1) == null ? "" : rs.getObject(
								i + 1).toString());
			}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println("释放连接出错，错误信息为：" + e.getMessage());
			}
		}
		return row;
	}
	public static void executeInsert(Object obj){
		PooledConnection conn = null;
		conn= DBManager.getConnection();
		String sql=ObjectType.ObjectToSqlInsert(obj);
		System.out.println("根据数据模型生成SQL:"+sql);
		PreparedStatement psmt=conn.getPreparedStatement(sql);
		try {
			conn.execute(psmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println("释放连接出错，错误信息为：" + e.getMessage());
			}
		}
	}
	public static void executeUpdate(Object obj,String Primarykey ){
		PooledConnection conn = null;
		conn= DBManager.getConnection();
		String sql=ObjectType.ObjectToSqlUpdate(obj, Primarykey);
		PreparedStatement psmt=conn.getPreparedStatement(sql);
		try {
			conn.execute(psmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println("释放连接出错，错误信息为：" + e.getMessage());
			}
		}
	}
	public static int executeSQL(String sql){
		PooledConnection conn = null;
		int Result=0;				
		try {
			conn= DBManager.getConnection();
			Result=	conn.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println("释放连接出错，错误信息为：" + e.getMessage());
			}
		}
		return Result;
	}

	/* 对输入的字符串进行一次编码转换,防止SQL注入 */
	public static String StringtoSql(String str) {
		str = nullToString(str, "");
		try {
			str = str.trim().replace('\'', (char) 1);
		} catch (Exception ex) {
			return "";
		}
		return str;
	}

	/* 对字符串进行二次编码转换，防止出库时异常发生 */
	public static String SqltoString(String str) {
		str = nullToString(str, "");
		try {
			str = str.replace((char) 1, '\'').trim();
		} catch (Exception ex) {
			return "";
		}
		return str;
	}

	public static String nullToString(String str1, String str2) {
		return str1 == null ? str2 : str1;
	}

	/* 空字符串处理方法 */
	public String chStr(String str) {
		return str == null ? "" : str;
	}

	/*
	 * 将多行数据集转换为list
	 * 
	 * @param rs
	 * 
	 * @return
	 * 
	 * @throws Exception
	 */
	public static ArrayList<HashMap<String, String>> DataSetToList(ResultSet rs)
			throws Exception {
		ResultSetMetaData rsmd = rs.getMetaData();
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		while (rs.next()) {
			HashMap<String, String> rsdata = new HashMap<String, String>();
			for (int i = 0; i < rsmd.getColumnCount(); i++) {
				rsdata.put(rsmd.getColumnLabel(i + 1),
						rs.getObject(i + 1) == null ? "" : rs.getObject(i + 1)
								.toString());
			}
			list.add(rsdata);

		}
		return list;
	}

	// 将单行数据集转为map

	public static HashMap<String, String> DataSetToMap(ResultSet rs)
			throws Exception {
		ResultSetMetaData rsmd = rs.getMetaData();
		HashMap<String, String> mp = new HashMap<String, String>();
		if (rs.next()) {
			mp = new HashMap<String, String>();
			for (int i = 0; i < rsmd.getColumnCount(); i++) {
				mp.put(rsmd.getColumnName(i + 1),
						rs.getObject(i + 1) == null ? "" : rs.getObject(i + 1)
								.toString());

			}
		}
		return mp;
	}
		 
}
