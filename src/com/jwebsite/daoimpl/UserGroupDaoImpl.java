package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.UserGroupDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.UserGroup;

public class UserGroupDaoImpl implements UserGroupDao{
	HashMapOperate ho=new HashMapOperate<UserGroup>();
	//根据ID删除用户组
	public void delUserGroup(int ID) throws Exception{
		String sql=" delete usergroup where GroupID = "+ID;
		DbConn.executeSQL(sql);
	};
	//更新记录
	public void updateUserGroup(UserGroup usergroup) throws Exception{
		DbConn.executeUpdate(usergroup, "GroupID");
	};
	//添加用户组
	public void insertUserGroup(UserGroup usergroup) throws Exception{
		DbConn.executeInsert(usergroup);
	}; 
	//查询
	public List<UserGroup> queryUserGroup()throws Exception{
		String sql=" select * from usergroup ";
		ArrayList<HashMap<String, String>> mli = DbConn.executeQuery(sql);
		List<UserGroup> li=ho.HashMapToObjectList(mli, UserGroup.class);
		return li;
	}; 
	//获取一个用户组
	public UserGroup getUserGroup(String ID)throws Exception{
		String sql=" select * from usergroup where GroupID ="+ID;
		HashMap<String, String> m=DbConn.executeQueryOne(sql);
		UserGroup ug=(UserGroup)ho.HashMapToPojo(m, UserGroup.class);
		return ug;
	}; 
}
