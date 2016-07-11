package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.SiteClassDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.DAOFactory;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.pub.ObjectType;
import com.jwebsite.vo.Admin;
import com.jwebsite.vo.SiteClass;

public class SiteClassDaoImpl implements SiteClassDao {
	ObjectType ot=new ObjectType();
	HashMapOperate ho=new HashMapOperate<SiteClass>();
	// 根据ID删除分类
	public void delClass(int classID) throws Exception {		
	    String strSql="delete from siteclass where ClassID="+classID+"";
	    try {			
			DbConn.executeSQL(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除文章分类发生错误！");
			System.out.println(e);
		}
	}
	// 更新记录
	public void updateClass(SiteClass sc) throws Exception {
		DbConn.executeUpdate(sc, "ClassID");
	}

	// 添加分类
	public void insertClass(SiteClass sc) throws Exception {
		DbConn.executeInsert(sc);
	}

	// 根据ID查询一条记录
	public SiteClass queryByID(int classID) throws Exception {
		String sql="select * from siteclass o where o.ClassID="+classID;
		HashMap<String, String>  scm= DbConn.executeQueryOne(sql);
		SiteClass sc=(SiteClass) ho.HashMapToPojo(scm, SiteClass.class);
		return sc;
	}
	//查询顶级类 --只查询顶级类
	public List<SiteClass> queryTopClassList() throws Exception{
		ArrayList<SiteClass> sclist = new ArrayList<SiteClass>();
		ArrayList<HashMap<String, String>> scmlist=new ArrayList<HashMap<String,String>>();
		String strSql = "select ClassName,ClassID from siteclass where Depth=0";
		scmlist=DbConn.executeQuery(strSql);
		sclist=(ArrayList<SiteClass>) ho.HashMapToObjectList(scmlist, SiteClass.class);
		return sclist;
	}
	// 显示顶级类
	public List<SiteClass> queryAllTop(String parentID, String classID) throws Exception {		
		ArrayList<SiteClass> sclist = new ArrayList<SiteClass>();
		ArrayList<HashMap<String, String>> scmlist=new ArrayList<HashMap<String,String>>();
		String sql = "select * from siteclass where ParentID="+ parentID;
		System.out.println(sql);
		try {			
			scmlist =DbConn.executeQuery(sql);
			for (HashMap<String, String> m:scmlist) {
				SiteClass sc=(SiteClass) ho.HashMapToPojo(m, SiteClass.class);
				sclist.add(sc);
				queryAllChild(sc.getClassID().toString(),classID,sclist);				
			}
		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + sql + ex.getMessage());
		}		
		return sclist;
	}
	//显示所有子类
	public ArrayList<SiteClass> queryAllChild(String parentID, String classID,ArrayList<SiteClass> sclist)throws Exception{
		ArrayList<HashMap<String, String>> scmlist=new ArrayList<HashMap<String,String>>();		
		String sql = "select * from siteclass where ParentID="+ parentID;
		System.out.println(sql);
		try {
			scmlist =DbConn.executeQuery(sql);
			for (HashMap<String, String> m:scmlist) {				
				SiteClass sc=(SiteClass) ho.HashMapToPojo(m, SiteClass.class);
				sclist.add(sc);
				queryAllChild(sc.getClassID().toString(),classID,sclist);
			}
		} catch (Exception ex) {
			System.out.println("检索子类出错" + sql + ex);
		}		
		return sclist;
	}
	// 显示顶级类 根据 AdminID 超级管理员
	public ArrayList<SiteClass> queryOneTop(int parentID,int AdminID) throws Exception {
		
		ArrayList<SiteClass> sclist = new ArrayList<SiteClass>();
		ArrayList<HashMap<String, String>> scmlist=new ArrayList<HashMap<String,String>>();			
		Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(AdminID);
		String strSql = "select * from siteclass where ParentID="+ parentID;
		System.out.println("管理员：Purview"+admin.getPurview());
		if(admin.getPurview()==1){
			
		}else{
			String[] inserts=admin.getArrClass_Input().split(",");		
			if(inserts.length>0&&admin.getPurview()!=1)
			{
			strSql+=" and ( 1=2 ";			
			strSql+=" or ( 1=2 ";
				for(int i=0;i<inserts.length;i++)
				{
					strSql+=" or ClassID="+inserts[i];
				}
				strSql+=")";
			}	
			System.out.println("  查询文章栏目   "+strSql);	
			
		}		
		try {
			scmlist =DbConn.executeQuery(strSql);
			for (HashMap<String, String> m:scmlist) {				
				SiteClass sc=(SiteClass) ho.HashMapToPojo(m, SiteClass.class);
				sclist.add(sc);
				queryOneChild(m.get("ClassID"),sclist,AdminID);				
			}
		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + strSql + ex.getMessage());
		}
		return sclist;		
	}
	//显示所有子类 根据 adminid 没有ClassID
	public ArrayList<SiteClass> queryOneChild(String parentID, ArrayList<SiteClass> sclist,int adminid)throws Exception{
		ArrayList<HashMap<String, String>> scmlist=new ArrayList<HashMap<String,String>>();		
		Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(adminid);
		String[] inserts=admin.getArrClass_Input().split(",");
		int i = 1;
		String strSql = "select * from siteclass where ParentID="+ parentID + " ";		
		if(inserts.length>0&&admin.getPurview()!=1)
		{
			strSql+=" and ( 1=2 ";			
			//strSql+=" or ( 1=2 ";			
			for(int a=0;a<inserts.length;a++)
			{
				strSql+=" or ClassID="+inserts[a];
			}
			strSql+=")";
		}		
		System.out.println("查询子栏目："+strSql);		
		try {
			scmlist =DbConn.executeQuery(strSql);
			for (HashMap<String, String> m:scmlist) {				
				SiteClass sc=(SiteClass) ho.HashMapToPojo(m, SiteClass.class);
				sclist.add(sc);
				queryOneChild(m.get("ClassID"),sclist,adminid);
			}
		} catch (Exception ex) {
			System.out.println("检索子类出错" + strSql + ex);
		}		
		return sclist;
	}
	// 显示顶级类 根据 adminid ClassID
	public ArrayList<SiteClass> queryAllTop(String parentID, String classID, String adminid)
			throws Exception {
		ArrayList<SiteClass> sclist = new ArrayList<SiteClass>();
		ArrayList<HashMap<String, String>> scmlist=new ArrayList<HashMap<String,String>>();			
		Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(adminid));
		String[] inserts=admin.getArrClass_Input().split(",");		
		String strSql = "select * from siteclass where ParentID="+ parentID;
		if(inserts.length>0&&admin.getPurview()!=1)
		{
		strSql+=" and ( 1=2 ";			
		strSql+=" or ( 1=2 ";
			for(int i=0;i<inserts.length;i++)
			{
				strSql+=" or ClassID="+inserts[i];
			}
			strSql+=")";
		}	
		System.out.println("  查询文章栏目   "+strSql);		
		try {
			scmlist =DbConn.executeQuery(strSql);
			for (HashMap<String, String> m:scmlist) {				
				SiteClass sc=(SiteClass) ho.HashMapToPojo(m, SiteClass.class);
				sclist.add(sc);
				sclist.addAll(queryAllChild(m.get("ClassID"), classID,sclist,adminid));				
			}
		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + strSql + ex.getMessage());
		}
		return sclist;
	}
	//显示所有子类 根据 adminid 有ClassID
	public ArrayList<SiteClass> queryAllChild(String parentID, String classID, ArrayList<SiteClass> sclist,String adminid)throws Exception{
		ArrayList<HashMap<String, String>> scmlist=new ArrayList<HashMap<String,String>>();		
		Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(Integer.parseInt(adminid));
		String[] inserts=admin.getArrClass_Input().split(",");
		int i = 1;
		String strSql = "select * from siteclass where ParentID="+ parentID + " ";		
		if(inserts.length>0&&admin.getPurview()!=1)
		{
			strSql+=" and ( 1=2 ";			
			//strSql+=" or ( 1=2 ";			
			for(int a=0;a<inserts.length;a++)
			{
				strSql+=" or ClassID="+inserts[a];
			}
			strSql+=")";
		}		
		System.out.println("查询子栏目："+strSql);		
		try {
			scmlist =DbConn.executeQuery(strSql);
			for (HashMap<String, String> m:scmlist) {				
				SiteClass sc=(SiteClass) ho.HashMapToPojo(m, SiteClass.class);
				sclist.add(sc);
				sclist.addAll(queryAllChild(m.get("ClassID"), classID,sclist,adminid));
			}
		} catch (Exception ex) {
			System.out.println("检索子类出错" + strSql + ex);
		}		
		return sclist;
	}
	
	// 显示栏目名称
	public String getClassName(int classID) throws Exception {
		return null;
	}

	// 取得父类ID
	public int getParentID(int classID) throws Exception {
		return 0;
	}

	// 显示栏目名称
	public String queryClassNameByID(int classID) throws Exception {
		return null;
	}

	// 显示所有子类
	public String queryChildClass(int parentID, String strNbsp,
			String purview_View, String purview_Input, String purview_Check,
			String purview_Manage) throws Exception {
		return null;
	}

	

}
