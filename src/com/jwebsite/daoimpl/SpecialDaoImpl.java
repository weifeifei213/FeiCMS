package com.jwebsite.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.SpecialDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.*;
import com.jwebsite.vo.Model;
import com.jwebsite.vo.Special;

public class SpecialDaoImpl implements SpecialDao {
	
	HashMapOperate ho=new HashMapOperate<Model>();	
	public void insertSpecial(Special special) throws Exception {
		// TODO Auto-generated method stub		
		try {
			DbConn.executeInsert(special);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加专题出错！");
			System.out.println(e);
		}		
	}

	public List<Special> quaryAllSpecial() throws Exception {
		// TODO Auto-generated method stub
		List<Special> li=null;
		String strSql="select * from special order by SpecialID";
		try {
			ArrayList<HashMap<String, String>> hmli=DbConn.executeQuery(strSql);
			li=ho.HashMapToObjectList(hmli, Special.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("获取专题列表出错！异常信息");
			System.out.println(e);
		}
		return li;
	}

	public void delOneSpecial(int SpecialID) throws Exception{		
		String strSql="delete from special where SpecialID="+SpecialID;
		try {
			DbConn.executeSQL(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除专题出错！");
			System.out.println(e);
		}	
	}
	
	public Special quaryOneSpecial(int specialID) throws Exception{
		Special special=new Special();
		String strSql="select * from special where SpecialID="+specialID;		
		try {
			HashMap<String, String> hm=DbConn.executeQueryOne(strSql);
			special=(Special) ho.HashMapToPojo(hm, Special.class);
		} catch (Exception e) {
			//TODO Auto-generated catch block
			System.out.println("查询专题出错！");
			System.out.println(e);
		}	   
		return special;
	}
	public void updateSpecial(Special special) throws Exception
	{
		try {
			DbConn.executeUpdate(special, "SpecialID");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新专题出错！");
			System.out.println(e);
		}				
	}
	public String  showSpecialInSel(String specialID) throws Exception
	{
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		StringBuffer specialItem=new StringBuffer();
		String strSql="select SpecialID,SpecialName from special order by SpecialID";
		String id[]=specialID.split(",");
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			while(rs.next())
			{
			    String selected="";
				for(int i=0;i<id.length;i++){
				 if(Integer.parseInt(id[i])==rs.getInt("SpecialID"))
					 selected="selected";
				   
			  }
			  specialItem.append(" <option value="+rs.getInt("SpecialID")+"  "+selected+">"+rs.getString("SpecialName")+"</option>");	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}		
		return specialItem.toString();	
	}
}


