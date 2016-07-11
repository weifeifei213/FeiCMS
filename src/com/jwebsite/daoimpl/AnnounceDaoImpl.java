package com.jwebsite.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.AnnounceDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.Announce;

public class AnnounceDaoImpl implements AnnounceDao {
	
	HashMapOperate ho=new HashMapOperate<Announce>();
	public void delAnnounce(int id) throws Exception {
		// TODO Auto-generated method stub		
		String strSql="delete from announce where ID=?";
		try {
			DbConn.executeSQL(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除公告出错！");
			System.out.println(e);
		}		
	}

	public void insertAnnounce(Announce announce) throws Exception {
		// TODO Auto-generated method stub
		try {
			DbConn.executeInsert(announce);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("增加公告出错！");
			System.out.println(e);
		}
	}

	public List<Announce> queryAllAnnounce() throws Exception {
		// TODO Auto-generated method stub
		List<Announce> li=null;
		String strSql="select * from announce order by ID";
		//String strSql="select * from announce where id in(select max(id) from announce )";
		System.err.println(strSql);
		try {
			ArrayList<HashMap<String, String>> hmli=DbConn.executeQuery(strSql);
			li=ho.HashMapToObjectList(hmli, Announce.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}		
		return li;
	}

	public Announce queryOneAnnounce(int id) throws Exception {
		// TODO Auto-generated method stub
		Announce announce=new Announce(); 
		String strSql="select * from announce where ID="+id+" order by ID";
		try {
			HashMap<String, String> hm= DbConn.executeQueryOne(strSql);
			announce=(Announce) ho.HashMapToPojo(hm, Announce.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}		
		return announce;
	}

	public void UpdataAnnounce(Announce announce) throws Exception {
		// TODO Auto-generated method stub
		try {
			DbConn.executeUpdate(announce, "ID");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新公告出错！");
			System.out.println(e);
		}
	}
	public void calcelNewAnnounce(int id) throws Exception{
		
		String strSql="update announce set IsSelected=0 where ID="+id;
		try {
			DbConn.executeSQL(strSql);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("取消最新公告出错！");
			System.out.println(e);
		}			
	}
	public Announce querySpringsAnnounce() throws Exception
	{
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		Announce announce=new Announce(); 
		String strSql="select * from announce where ShowType=2 and IsSelected=1  order by DateAndTime";
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
				announce.setID(rs.getInt("ID"));
				announce.setTitle(rs.getString("Title"));
				announce.setContent(rs.getString("Content"));
				announce.setAuthor(rs.getString("Author"));
				announce.setDateAndTime(rs.getString("DateAndtime"));
				announce.setIsSelected(rs.getInt("IsSelected"));
				announce.setShowType(rs.getInt("ShowType"));
				announce.setOutTime(rs.getInt("OutTime"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		rs.close();
		stmt.close();
		conn.closeConnection();
		return announce;
		
		
	}
	
	/**
	 * 
	 * @param ShowType 0 全部，1 滚动 2弹出
	 * @return
	 * @throws Exception
	 */
   public List<Announce> GetAnnounceSY(int ShowType)throws Exception{
		
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String strSql="select * from announce where IsSelected=1 and (ShowType=? or  ShowType=0)  order by DateAndTime";
		
		PreparedStatement pstmt=null;
		List<Announce> annlist=new ArrayList<Announce>();
		try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, ShowType);			
			pstmt.executeQuery();
			rs=pstmt.getResultSet();
			while(rs.next()){
				Announce ann=new Announce();
			    ann.setContent(rs.getString("Content"));
			    
				annlist.add(ann);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示公告出错！");
			System.out.println(e);
		}
		conn.closeConnection();
		
		return annlist;
		
	}

	
	
	
}
