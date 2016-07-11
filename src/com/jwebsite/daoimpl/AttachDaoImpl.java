package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.AttachDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.Attach;
import com.jwebsite.vo.SiteClass;

public class AttachDaoImpl implements AttachDao {
	
	HashMapOperate ho=new HashMapOperate<SiteClass>();
	//添加附件
	public void AddAttach(Attach attach)throws Exception{		
		 DbConn.executeInsert(attach);
	}
	//删除附件
	public void DelAttach(int ID)throws Exception{
		String sql="delete from  attach o where o.ID = "+ID;
		DbConn.executeSQL(sql);		
	}
	//修改附件
	public int UpdateAttach(Attach attach)throws Exception{
		DbConn.executeUpdate(attach, "ID");
		return 0;
	}
	//查看附件
	public List<Attach> QureyAttach(String ArticleID)throws Exception{
		List<Attach> li=new ArrayList<Attach>();		
		String sql=" select * from attach o where o.ArticleID =" +ArticleID;
		ArrayList<HashMap<String, String>> hmli = DbConn.executeQuery(sql);
		li= ho.HashMapToObjectList(hmli, Attach.class);		
		return li;
	}
	//清除过期附件
	public void ClearAttach(String time)throws Exception{
		String sql=" delete from attach o where o.UploadTime like '%"+time+"%'";
		DbConn.executeSQL(sql);		
	}
}
