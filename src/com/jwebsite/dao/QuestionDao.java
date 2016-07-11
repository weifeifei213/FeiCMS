package com.jwebsite.dao;

import java.sql.ResultSet;

import com.jwebsite.vo.Question;

public interface QuestionDao {
	//添加试题
	public void insertQuestion(Question question) throws Exception;
	//修改试题
	public void updateQuestion(Question question) throws Exception;
	//删除试题
	public void delQuestion(int id) throws Exception;
	//显示所有试题
	public ResultSet showAllQuestion() throws Exception;
	//查询一个
	public Question showQuestion(int id)  throws Exception;
	//根据试卷查询试题
	public ResultSet queryQuestion(int testID,int type) throws Exception;
   //判断答案是否正确
	public boolean  checkQuestion(int questionID,String answer) throws Exception;
}
