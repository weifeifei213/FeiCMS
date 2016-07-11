package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.FriendSiteClassDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.FriendSiteClass;;

public class FriendSiteClassDaoImpl implements FriendSiteClassDao {
	
	HashMapOperate ho=new HashMapOperate<FriendSiteClass>();
	
	public void DelFriendSiteClass(int ClassID) throws Exception {
		// TODO Auto-generated method stub		
		String strSql="delete from friendsiteclass where ClassID = "+ClassID;
		try {
			DbConn.executeSQL(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除友情链接出错！");
			System.out.println(e);
		}		
	}

	public void InsertFriendSiteClass(FriendSiteClass fsc) throws Exception {
		// TODO Auto-generated method stub		
		try {
			DbConn.executeInsert(fsc);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加友情链接出错！");
			System.out.println(e);
		}
	}

	public void UpdateFriendSiteClass(FriendSiteClass fsc) throws Exception {
		// TODO Auto-generated method stub		
		try {
			DbConn.executeUpdate(fsc, "ClassID");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加友情链接出错！");
			System.out.println(e);
		}
	}
	public String QueryFriendSiteName(int classID) throws Exception
	{
		// TODO Auto-generated method stub		
		String className="";
		String strSql="select * from  friendsiteclass where ClassID="+classID+"";
		try {
			HashMap<String, String> hm=DbConn.executeQueryOne(strSql);
			className=hm.get("ClassName");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		return className;
	}
	
	public List<FriendSiteClass> QuaryAllClass() throws Exception{
		
		List<FriendSiteClass> fslist=new ArrayList<FriendSiteClass>();
		String strSql="select * from  friendsiteclass order by ClassID";		
		try {			
			ArrayList<HashMap<String, String>> fslm=DbConn.executeQuery(strSql);			
			fslist=ho.HashMapToObjectList(fslm, FriendSiteClass.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		return fslist;
	}
	
	public List<FriendSiteClass> QueryFriendSiteClassBySql(String sql) throws Exception {
		// TODO Auto-generated method stub		   		
			List<FriendSiteClass> fsclist=new ArrayList<FriendSiteClass>();		
			try {
				ArrayList<HashMap<String, String>> fslm=DbConn.executeQuery(sql);			
				fsclist=ho.HashMapToObjectList(fslm, FriendSiteClass.class);	   	
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			}	
		return fsclist;
	}

	public FriendSiteClass QueryOneFriendSiteClass(int classID) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from  friendsiteclass where ClassID="+classID;
		HashMap<String, String> fscm=DbConn.executeQueryOne(sql);
		FriendSiteClass fsc=(FriendSiteClass) ho.HashMapToPojo(fscm, FriendSiteClass.class);		
		return fsc;
	}	

}
