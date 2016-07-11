package com.jwebsite.dao;

import java.sql.ResultSet;

import com.jwebsite.vo.*;

public interface VoteDao {
	//添加调查
	public void insertVote(Vote vote) throws Exception;
	//删除调查
	public void delVote(int id) throws Exception;
	//修改调查
	public void upDateVote(Vote vote) throws Exception;
	//查询所有调查
	public ResultSet queryAllVote() throws Exception;
	//查询一条
	public ResultSet queryOneVote(int id) throws Exception;
	//启用调查
	public void startVote(int id) throws Exception;
	//更新调查数据
	public void upDateVoteNum(Vote vote) throws Exception;

}
