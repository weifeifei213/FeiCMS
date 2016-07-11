package com.jwebsite.dao;

import java.util.List;

import com.jwebsite.vo.GuestBook;

public interface GuestBookDao {
	//根据分类显示所有留言
	public List<GuestBook> showGuestBook(int classID,int adminid) throws Exception ;
	//删除留言
	public void delGuestBook(int guestBookID) throws Exception;
	//根据ID查询留言
	public GuestBook queryGuestBook(int id) throws Exception;
	//回复留言
	public void UpdateGuestBook(GuestBook guestBook) throws Exception;
	//改变回复状态
	public void ShowGuestBook(int id) throws Exception;
	//添加留言
	public void insertGuestBook(GuestBook guestBook) throws Exception;
	//根据ClassID查询所有guestbook 
	public List<GuestBook> showAllGuestBook(int classid) throws Exception ;
	//根据ClassID查询guestbook 
	public List<GuestBook> showGuestBook(int classid) throws Exception;
		
}
