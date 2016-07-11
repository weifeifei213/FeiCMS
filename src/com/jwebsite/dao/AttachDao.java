package com.jwebsite.dao;

import java.util.List;

import com.jwebsite.vo.Attach;

/**
 * 附件管理
 * @author 木鱼
 */
public interface AttachDao {
	//添加附件
	public void AddAttach(Attach attach)throws Exception;
	//删除附件
	public void DelAttach(int ID)throws Exception;
	//修改附件
	public int UpdateAttach(Attach attach)throws Exception;
	//查看附件
	public List<Attach> QureyAttach(String ArticleID)throws Exception;
	//清除过期附件
	public void ClearAttach(String time)throws Exception;
}
