package com.jwebsite.dao;

import com.jwebsite.vo.Email;

public interface EmailDao {
	//添加邮件
	public void InsertEmail(Email email ) throws Exception;	
	//修改邮件
	public void UpdateEmail(Email emailinfo ) throws Exception;	
	//获取邮件
	public Email GetEmailInfo() throws Exception;
	//删除邮件
	
	
}
