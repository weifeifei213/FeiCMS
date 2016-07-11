package com.jwebsite.daoimpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.PhotoClassDao;
import com.jwebsite.db.DBManager;
import com.jwebsite.db.DbConn;
import com.jwebsite.db.ConnectionPool.PooledConnection;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.SiteClass;

public class PhotoClassDaoImpl implements PhotoClassDao {	
	 	
	
	HashMapOperate ho=new HashMapOperate<SiteClass>();
	public int AddPhotoClass(SiteClass photoclass) {
		// TODO Auto-generated method stub
		PooledConnection conn = null;
		String sqlStr="";		
		sqlStr="delete from Site_Class  where ClassID =";
		int ID=0;		
		try {
			conn = DBManager.getConnection();
			ID=conn.executeUpdate(sqlStr);
			conn.close();			
		} catch (SQLException e) {			
			e.printStackTrace();	
			System.out.println("添加图片栏目出错"+e);
		}
		finally {
            conn.close();
		}		
		return ID;
	}

	public void DelPhotoClass(int ID) {
		// TODO Auto-generated method stub
		PooledConnection conn = null;
		String sqlStr="delete from Site_Class  where ClassID ="+ID;	
		try {
			conn = DBManager.getConnection();
			conn.executeUpdate(sqlStr);
			conn.close();			
		} catch (SQLException e) {			
			e.printStackTrace();	
			System.out.println(this.toString()+"删除图片栏目出错"+e);
		}
		finally {
            conn.close();
		}
	}

	public List<SiteClass> GetAllChildNode(int ClassID,List<SiteClass> childlist) {
		// TODO Auto-generated method stub
		return null;
	}

	public String GetAllClass() {
		// TODO Auto-generated method stub
		StringBuffer sb=new StringBuffer();
		  List<SiteClass> classlist=GetParentNode("select * from  Site_Class o where o.depth=0 and o.parentId=0");
		  for(SiteClass photoclass:classlist){
			  sb.append("<option value='"+photoclass.getClassID()+"'>"+photoclass.getClassName()+"</option>");
			  List<SiteClass> childlist=new ArrayList<SiteClass>();
			  childlist=GetAllChildNode(photoclass.getClassID(), childlist);
			  for(SiteClass childclass:childlist){
				  sb.append("<option value='"+childclass.getClassID()+"'>");
				  for(int i=0;i<childclass.getDepth();i++){
					  sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");  
				  }				  
				  sb.append("└─"+childclass.getClassName()+"</option>");
			  }			  
		  }	  
		  return sb.toString();		
	}

	public String GetAllClass(int ClassID) {
		// TODO Auto-generated method stub
		 StringBuffer sb=new StringBuffer();
		  List<SiteClass> classlist=GetParentNode("select * from  Site_Class o where o.depth=0 and o.parentId=0");
		  String selected="";
		  for(SiteClass photoclass:classlist){
			  if(photoclass.getClassID()==ClassID){selected="selected='selected'";}else{selected="";}
			  
			  sb.append("<option value='"+photoclass.getClassID()+"' "+selected+" >"+photoclass.getClassName()+"</option>");
			  
			  List<SiteClass> childlist=new ArrayList<SiteClass>();
			  childlist=GetAllChildNode(photoclass.getClassID(), childlist);
			  for(SiteClass childclass:childlist){
				  if(childclass.getClassID()==ClassID){selected="selected='selected'";}else{selected="";}
				  sb.append("<option value='"+childclass.getClassID()+"' "+selected+" >");
				  for(int i=0;i<childclass.getDepth();i++){
					  sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");  
				  }			  
				  sb.append("└─"+childclass.getClassName()+"</option>");
			  }
			  
		  }	  
		  return sb.toString();		
	}

	public String GetClass(String ClassID) {
		// TODO Auto-generated method stub
		ArrayList<HashMap<String, String>> cml=DbConn.executeQuery("select * from site_class where ChannelID =3 ");
		List<SiteClass> classlist=ho.HashMapToObjectList(cml,SiteClass.class);
		SiteClass photoclass=classlist.get(0);		  
		return "<option selected='selected' value='"+photoclass.getClassID()+"'>"+photoclass.getClassName()+"</option>";		
	}

	public List<SiteClass> GetParentNode(String sql) {
		// TODO Auto-generated method stub		
		ArrayList<HashMap<String, String>> cml=DbConn.executeQuery(sql);
 		List<SiteClass> classlist=ho.HashMapToObjectList(cml,SiteClass.class);
 		return classlist;		
	}

	public SiteClass GetPhotoClass(String ClassID) {
		// TODO Auto-generated method stub
		return null;
	}

	public SiteClass GetPhotoClassByID(int ID) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<SiteClass> GetPhotoClassList(String sql) {
		// TODO Auto-generated method stub
		List<SiteClass> pclist=null;
		ArrayList<HashMap<String, String>> list= DbConn.executeQuery(sql);
		if(list!=null&&list.size()>0){	
			for(HashMap<String, String> m:list){
				HashMapOperate<SiteClass> ho=new HashMapOperate<SiteClass>();
				SiteClass pc= (SiteClass)ho.HashMapToPojo(m,SiteClass.class);			
				pclist.add(pc);
			}		
		}	
		return pclist;
	}
	//根据子节点获取所有上级节点
	public List<SiteClass> GetPhotoParent(int ClassID, List<SiteClass> list) {
		// TODO Auto-generated method stub
		HashMap<String, String> cml=DbConn.executeQueryOne("select * from site_class where ClassID ="+ClassID);		
		SiteClass photocla=(SiteClass)ho.HashMapToPojo(cml,SiteClass.class);
		if(photocla==null){}else
		if(photocla.getParentID()==0){
			list.add(photocla);				
		}else{
		list.add(photocla);	
		GetPhotoParent(photocla.getParentID(), list);
		}		
		return list;
	}

	public List<SiteClass> GetphotoByClass(int ClassID) {
		// TODO Auto-generated method stub
		String sql="select * from Site_Class o where o.parentId = "+ClassID+" order by o.classId asc ";
		ArrayList<HashMap<String, String>> cml=DbConn.executeQuery(sql); 		 
 		List<SiteClass> li=ho.HashMapToObjectList(cml,SiteClass.class);
		return li;
	}

	public void UpdatePhotoClass(SiteClass sc) {
		// TODO Auto-generated method stub		
		DbConn.executeUpdate(sc, "classID");		
	}
	
	

}
