package com.jwebsite.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.ModelDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.Model;

public class ModelDaoImpl implements ModelDao {
	HashMapOperate ho=new HashMapOperate<Model>();
	// 根据ID删除模型
	public void delModel(int ID) throws Exception {
		String sql=" delete from model where ModelID ="+ID;
		DbConn.executeSQL(sql);
	}
	// 更新记录
	public void updateModel(Model md) throws Exception {
		DbConn.executeUpdate(md, "ModelID");
	}
	// 添加模型
	public void insertModel(Model md) throws Exception {
		DbConn.executeInsert(md);
	}
	// 查询模型
	public List<Model> queryModel(int SiteID) throws Exception {
		String sql=" select * from model where SiteID ="+SiteID;
		ArrayList<HashMap<String, String>> hml= DbConn.executeQuery(sql);
		List<Model> li=ho.HashMapToObjectList(hml, Model.class);
		return li;
	}
	public List<Model> queryModel(String sql) throws Exception {
		ArrayList<HashMap<String, String>> hml= DbConn.executeQuery(sql);
		List<Model> li=ho.HashMapToObjectList(hml, Model.class);
		return li;
	}
	// 获取一个模型
	public Model queryAModel(String ID) throws Exception {
		String sql=" select * from model where ModelID ="+ID;
		HashMap<String, String> hm=DbConn.executeQueryOne(sql);
		Model model=(Model) ho.HashMapToPojo(hm, Model.class);
		return model;
	}
	// 执行一个sql
	public int ExecuteSQL(String sql) throws Exception {
		return DbConn.executeSQL(sql);
	}
	// 修改状态
	public int UpdateState(String Action, String ID) throws Exception {
		return 0;
	}
}
