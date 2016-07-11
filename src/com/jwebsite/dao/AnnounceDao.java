package com.jwebsite.dao;

import java.util.List;
import com.jwebsite.vo.Announce;

public interface AnnounceDao {
	//添加公告
	public void insertAnnounce(Announce announce) throws Exception;
	//删除公告
	public void delAnnounce(int id) throws Exception;
	//修改公告
	public void UpdataAnnounce(Announce announce) throws Exception;
	//查询所有公告
	public List<Announce> queryAllAnnounce() throws Exception;
	//查询一条
	public Announce queryOneAnnounce(int id) throws Exception;
	//取消最新
	public void calcelNewAnnounce(int id) throws Exception;
	//查询弹出公告
	public Announce querySpringsAnnounce() throws Exception;	
	/**
	 * 
	 * @param ShowType 0 全部，1 滚动 2弹出
	 * @return
	 * @throws Exception
	 */
   public List<Announce> GetAnnounceSY(int ShowType)throws Exception;

}
