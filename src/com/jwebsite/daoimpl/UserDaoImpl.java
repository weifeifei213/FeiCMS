package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.UserDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.DateTimeUtils;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.pub.ObjectType;
import com.jwebsite.vo.Model;
import com.jwebsite.vo.SiteConfig;
import com.jwebsite.vo.User;

public class UserDaoImpl implements UserDao {
	ObjectType ot=new ObjectType();
	HashMapOperate ho=new HashMapOperate<SiteConfig>();
	//根据ID删除用户
	public void delUser(int ID) throws Exception {
		String sql=" select * from user o where o.UserID = "+ID;
		DbConn.executeSQL(sql);
	}
	//更新记录
	public void updateUser(User us) throws Exception {
		DbConn.executeUpdate(us, "UserID");
	}
	//添加用户
	public void insertUser(User us) throws Exception {
		DbConn.executeInsert(us);
	} 
	//查询用户 根据 用户组
	public List<User> queryUser(int UserType)throws Exception {
		String sql=" select * from users  where UserType = "+UserType;
		ArrayList<HashMap<String, String>> hml= DbConn.executeQuery(sql);
		List<User> li=ho.HashMapToObjectList(hml, Model.class);
		return li;
	} 
	public List<User> queryUser(String sql)throws Exception {		
		ArrayList<HashMap<String, String>> hml= DbConn.executeQuery(sql);
		List<User> li=ho.HashMapToObjectList(hml, Model.class);
		return li;
	} 
	//获取一个模型	
	public User getUser(String ID)throws Exception {
		String sql=" select * from users where UserID ="+ID;
		HashMap<String, String> hm=DbConn.executeQueryOne(sql);
		User model=(User) ho.HashMapToPojo(hm, User.class);
		return null;
	} 
	//执行一个sql
	public int ExecuteSQL(String sql)throws Exception {
		return DbConn.executeSQL(sql);
	}
	//修改登录时间
	public int UpdateLoginTime(String ID)throws Exception {		
		String sql="  UPDATE users SET LastLoginTime ='"+DateTimeUtils.getDateTime("yyyy-MM-dd HH:mm:ss")+"'  WHERE UserID = "+ID;		
		return DbConn.executeSQL(sql);
	}
	//修改登录IP
	public int UpdateLoginIP(String IP,String ID)throws Exception {
		String sql="  UPDATE users SET LastLoginIP ='"+IP+"'  WHERE UserID = "+ID;		
		return DbConn.executeSQL(sql);
	}
	//修改登录次数
	public int UpdateLoginTimes(String ID)throws Exception {
		String sql="  UPDATE users SET LoginTimes = LoginTimes+1  WHERE UserID = "+ID;		
		return DbConn.executeSQL(sql);
	}
	//修改用户锁定状态
	public int UpdateIsLocked(String Action,String ID)throws Exception {
		String sql="  UPDATE users "; 	
		if(Action.equals("Locked")){
			sql+=" SET IsLocked = 1 ";
		}else{
			sql+=" SET IsLocked = 0 ";
		}	
		sql+=" WHERE UserID = "+ID;
		return DbConn.executeSQL(sql);
	}
}
