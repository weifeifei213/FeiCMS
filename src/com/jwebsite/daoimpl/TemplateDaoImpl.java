package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.TemplateDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.Template;

public class TemplateDaoImpl implements TemplateDao {
	HashMapOperate ho=new HashMapOperate<Template>();
	// 根据ID删除模板
	public void delTemplate(int TpID) throws Exception {
		String sql=" DELETE FROM template WHERE TemplateID = "+TpID;
		DbConn.executeSQL(sql);
	}
	// 更新记录
	public void updateTemplate(Template Tp) throws Exception {
		DbConn.executeUpdate(Tp, "TemplateID");
	}
	// 添加模板
	public void insertTemplate(Template Tp) throws Exception {
		DbConn.executeInsert(Tp);
	}
	// 查询模板
	public List<Template> queryTemplate() throws Exception {
		String sql=" SELECT * FROM template ";
		ArrayList<HashMap<String, String>> alist=DbConn.executeQuery(sql);
		List<Template> tlist=ho.HashMapToObjectList(alist, Template.class);
		return tlist;
	}
	public List<Template> queryTemplate(String sql) throws Exception {		
		ArrayList<HashMap<String, String>> alist=DbConn.executeQuery(sql);
		List<Template> tlist=ho.HashMapToObjectList(alist, Template.class);
		return tlist;
	}
	// 获取一个模板
	public Template getTemplate(String TpID) throws Exception {
		String sql="SELECT * FROM template WHERE TemplateID = "+TpID;
		HashMap<String, String> hm=DbConn.executeQueryOne(sql);
		Template tp=(Template) ho.HashMapToPojo(hm, Template.class);
		return tp;
	}
	// 执行一个sql
	public int ExecuteSQL(String sql) throws Exception {		
		return DbConn.executeSQL(sql);
	}
	// 修改状态
	public int UpdateState(String Action, String ID) throws Exception {
		String sql = "UPDATE template SET ";
		if ("IsDefault".equals(Action)) {
			sql += "IsDefault  = '1' ";
		}
		if ("NoDefault".equals(Action)) {
			sql += "IsDefault  = '0' ";
		}
		if ("IsDefaultInProject".equals(Action)) {
			sql += "IsDefaultInProject  = '1' ";
		}
		if ("NoDefaultInProject".equals(Action)) {
			sql += "IsDefaultInProject  = '0' ";
		}
		sql += " WHERE TemplateID = " + ID;		
		return DbConn.executeSQL(sql);
	}
}
