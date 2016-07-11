package com.jwebsite.dao;

import java.sql.ResultSet;

import com.jwebsite.vo.SendMessage;

public interface SendMessageDao {
	//添加公告
	public void insertSendMessage(SendMessage SendMessage) throws Exception;
	//删除公告
	public void delSendMessage(int id) throws Exception;
	//修改公告
	public void upDateSendMessage(SendMessage SendMessage) throws Exception;
	//查询所有公告
	public ResultSet queryAllSendMessage() throws Exception;
	//查询一条
	public SendMessage queryOneSendMessage(int id) throws Exception;
	//取消最新
	public void calcelNewSendMessage(int id) throws Exception;
	//查询弹出公告
	public SendMessage querySpringsSendMessage() throws Exception;
	

}
