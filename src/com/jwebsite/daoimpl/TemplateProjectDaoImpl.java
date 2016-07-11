package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.TemplateProjectDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.TemplateProject;

/**
 * 模板
 * @author 木鱼
 *
 */
public class TemplateProjectDaoImpl implements TemplateProjectDao {
	HashMapOperate ho=new HashMapOperate<TemplateProject>();
	//根据ID删除模板方案
	public void delTemplateProject(int TpID) throws Exception{
		String sql=" delete from TemplateProject where TemplateProjectID ="+TpID;
		DbConn.executeSQL(sql);
	}
	//更新记录
	public void updateTemplateProject(TemplateProject Tp) throws Exception{
		DbConn.executeUpdate(Tp, "TemplateProjectID");
	}
	//添加方案
	public void insertTemplateProject(TemplateProject Tp) throws Exception{
		DbConn.executeInsert(Tp);
	} 
	//查询方案
	public List<TemplateProject> queryTemplateProject()throws Exception{
		String sql=" select * from templateproject ";
		ArrayList<HashMap<String, String>> tpmlist=DbConn.executeQuery(sql);
		List<TemplateProject> tplist=ho.HashMapToObjectList(tpmlist, TemplateProject.class);
		return tplist;
	} 
	//获取一个方案信息	
	public TemplateProject getTemplateProject(String TpID)throws Exception{
		String sql=" select * from templateproject where TemplateProjectID ="+TpID;
		HashMap<String, String> tpm=DbConn.executeQueryOne(sql);
		TemplateProject tp=(TemplateProject) ho.HashMapToPojo(tpm, TemplateProject.class);
		return tp;
	} 
	//执行一个sql
	public int ExecuteSQL(String sql)throws Exception{
		return DbConn.executeSQL(sql);
	}
	//修改状态 
	public int UpdateState(String Action, String ID) throws Exception {
		// TODO Auto-generated method stub
		String sql = "UPDATE templateproject SET ";
		if ("IsDefault".equals(Action)) {
			sql += "IsDefault  = '1' ";
		}
		if ("NoDefault".equals(Action)) {
			sql += "IsDefault  = '0' ";
		}
		if ("Disable".equals(Action)) {
			sql += "Enable  = '0' ";
		}
		if ("Enable".equals(Action)) {
			sql += "Enable  = '1' ";
		}
		sql += " WHERE TemplateProjectID = " + ID;		
		return DbConn.executeSQL(sql);
	}
}
