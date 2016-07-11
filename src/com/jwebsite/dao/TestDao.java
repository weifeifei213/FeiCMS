package com.jwebsite.dao;

import java.sql.ResultSet;

import com.jwebsite.vo.Test;

public interface TestDao {
	//添加试卷
	public void insertTest(Test test) throws Exception;
	//修改试卷
	public void updateTest(Test test) throws Exception;
	//删除试卷
	public void delTest(int id) throws Exception;
	//显示所有试卷
	public ResultSet showAllTest() throws Exception;
	//查询一个
	public Test  queryTest(int id) throws Exception;
	//返回试卷名称
	public String getTestName(int id) throws Exception;
	

}
