package com.jwebsite.dao;

import java.sql.ResultSet;
import java.util.*;

public interface OnstageDao {
	public String showNews(int ClassID,int rowNum,int maxChar,String className, boolean updateTime) throws Exception;
	public String showNews(int ClassID,int rowNum,int maxChar,String className, boolean updateTime,String pageUls) throws Exception;
	public String showNewsTwo(int ClassID,int rowNum,int maxChar,String className, boolean updateTime) throws Exception;
	public String showNews23(int ClassID, int rowNum, int maxChar, String className, boolean updateTime,int datewidth ,int hight) throws Exception;
	public String showNews(int ClassID,int rowNum,int maxChar,String className, boolean updateTime,int widht) throws Exception;
	public String showNews1(int ClassID,int rowNum,int maxChar,String className, boolean updateTime) throws Exception;
	public String showNews1(int ClassID,int rowNum,int maxChar,String className, boolean updateTime,String pageUls) throws Exception;
	public String showNews12(int ClassID,int rowNum,int maxChar,String className, boolean updateTime) throws Exception;
	public String showNews2(int ClassID,int rowNum,int maxChar,String className, boolean updateTime) throws Exception;
	public String showNews007(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception;
	public String showNewsandWord(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception;
	public String showNewsAll(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception;
	
	
	public String showNewsandWord1(int ClassID, int rowNum, int maxChar, String className, boolean updateTime,String pagename) throws Exception;
    //显示相关新闻
	public String showAboutNews(String keyword,int rowNum,int articleID) throws Exception;
	//显示幻灯新闻
	public String showFlashNews(int ClassID) throws Exception;
	public String showFlashNews(int ClassID,String pageUls) throws Exception;
	public String showFlashNews11(int ClassID) throws Exception;
	//显示图片新闻
	public String showPicNews(int picNum,int width,int height,boolean ifShowTitle) throws Exception;
	public String showPicNews1(int ClassID,int picNum,int width,int height,boolean ifShowTitle) throws Exception;
	public String showPicNews2(int ClassID) throws Exception;
	//显示所有最新新闻
	public String showAllNews(int rowNum,int maxChar)throws Exception;
	//显示推荐新闻
	public String showEliteNews(int rowNum,int maxChar)throws Exception;
	//显示热点新闻 
	public String showHotNews(int rowNum,int maxChar)throws Exception;
	//显示滚动公告
	public String showRollsAnnounce(int rowNum,int maxChar) throws Exception;
	//显示弹出公告
	//public String showSpringsAnnounce(int rowNum,int maxChar) throws Exception;
	//显示友情链接
	public String showLink(int tid) throws Exception;
	//图片动态显示
	public String showImgLink(int tid, String stylecss,int twith,int thight) throws Exception;
	public String showImgLink(int tid,int twith,int thight,int rowwidth) throws Exception;
	
	
	
	//显示友情链接基础部、信息管理系、采矿系
	public String showJcbLink(int tid,int content) throws Exception;
	//显示网站调查
	public String showVote() throws Exception;
	public String showVote(int voteID) throws Exception;
	//显示子栏目新闻
	public String showChildNews(int ClassID,int rowNum,int maxChar,String className,String imgUrl,boolean showMore) throws Exception;
    //双列显示新闻栏目
	public String showChildNewsTwo(int ClassID,int rowNum,int maxChar,String className,String imgUrl,boolean showMore) throws Exception;
	//显示子栏目新闻列表
	public ResultSet showNewsList(int ClassID) throws Exception;
	//显示栏目列表

	public String showClassList(int ParentID) throws Exception;
	
	//得到子栏目列表
	public List  getClassList(int ParentID) throws Exception;
	
	//页面导航
	public String showClassList1(int ParentID) throws Exception;
	//页面导航
	public String showNav(int classID) throws Exception;
	//显示领导风采
	public String showLDFC() throws Exception;
	
	public String showNames(int ID,String className,boolean status) throws Exception;
}
