package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.GuestBookDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.DAOFactory;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.Admin;
import com.jwebsite.vo.GuestBook;

public class GuestBookDaoImpl implements GuestBookDao {
	HashMapOperate ho = new HashMapOperate<GuestBook>();
	/**
	 * 查询所有留言
	 * @return
	 * @throws Exception
	 */
	public List<GuestBook> showAllGuestBook(int classid) throws Exception {
		List<GuestBook> gbli=null;
		String strSql="select * from guestbook  where Isshow=1 ";
		if(classid==0){
			   strSql+=" and classid= "+classid;
		}
		       strSql+="  order by GuestID desc";					
		try {
		ArrayList<HashMap<String, String>> hmli=DbConn.executeQuery(strSql);
		gbli=ho.HashMapToObjectList(hmli, GuestBook.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}		
		return gbli;
	}
	//显示局长留言
	public List<GuestBook> showGuestBook(int classid) throws Exception {
		List<GuestBook> gbli=null;
		String strSql="select * from guestbook  where  classid="+classid;	
		       strSql=strSql+"  order by GuestID desc";					
		try {
			ArrayList<HashMap<String, String>> hmli=DbConn.executeQuery(strSql);
			gbli=ho.HashMapToObjectList(hmli, GuestBook.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}		
		return gbli;
	}
	
	

//	根据分类显示所有留言
	public List<GuestBook> showGuestBook(int classID,int adminid) throws Exception {
		List<GuestBook> gbli=null;		
		Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(adminid);
		String[] inserts=admin.getArrClass_Input().split(",");		
		String strSql="select * from guestbook where 1=1 ";		
		       strSql=strSql+" and ClassID="+classID+"";		
		if(inserts.length>0&&admin.getPurview()!=1){
			strSql+=" and ClassID in (select ClassID from article_class where 1=2 ";
			for(int i=0;i<inserts.length;i++){
				strSql+=" or ClassID="+inserts[i];
			}
			    strSql+=")";
		}
		strSql=strSql+" order by GuestID desc";		
		System.out.println("网站留言查询："+strSql);		
		try {
			ArrayList<HashMap<String, String>> hmli=DbConn.executeQuery(strSql);
			gbli=ho.HashMapToObjectList(hmli, GuestBook.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}		
		return gbli;
	}
	//删除留言
	public void delGuestBook(int guestBookID) throws Exception{		
		String strSql="delete from guestbook where GuestID= "+guestBookID;
		try {
			DbConn.executeQuery(strSql);
		}catch (Exception e){
			// TODO Auto-generated catch block
			System.out.println("删除留言出错！");
			System.out.println(e);
		}	
	}
	public GuestBook queryGuestBook(int id) throws Exception{		
		GuestBook guestBook=new GuestBook();
		String strSql="select * from guestbook where GuestID= "+id;				
		try {
			HashMap<String, String> hm=DbConn.executeQueryOne(strSql);
			guestBook = (GuestBook) ho.HashMapToPojo(hm, GuestBook.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}		
		return guestBook;		
	}
	public void ShowGuestBook(int id) throws Exception{		
		String strSql="update guestbook set IsShow=1 where GuestID="+id;
		try {
			DbConn.executeQuery(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("回复留言出错！");
			System.out.println(e);
		}			
	}
	public void UpdateGuestBook(GuestBook guestBook) throws Exception{	
		try {
			DbConn.executeUpdate(guestBook, "GuestID");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("回复留言出错！");
			System.out.println(e);
		}
	}
	public void insertGuestBook(GuestBook guestBook) throws Exception
	{
		try {
			DbConn.executeInsert(guestBook);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("出错！");
			System.out.println(e);
		}
		
	}
}
