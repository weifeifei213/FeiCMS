package com.jwebsite.dao;


import java.util.List;

import com.jwebsite.vo.*;

public interface ArticleDao {
	//彻底删除文章
	public void delArticle(int articleID) throws Exception;
	//清空回收站
	public void clearRecyclebin() throws Exception;
	//根据分类ID删除文章
	public void delArticleByClassID(int classID) throws Exception;
	//文章固顶
	public void setOnTop(int articleID,String struts) throws Exception;
	//显示固顶文章
	public List<Article> getOnTop(int ClassID) throws Exception;
	public List<Article> getArticleSize(int ClassID) throws Exception;	
	//推荐文章
	public void setElite(int articleID,String struts) throws Exception;
	//审核文章	
	public void checkArticle(int articleID,String struts) throws Exception;	
	//将文章移入回收站
	public void recArticle(int articleID) throws Exception; 
	//还原文章
	public void restoreArticle(int articleID,String status) throws Exception;
	//添加文章
    public void insertArticle(Article article) throws Exception;
    //更新文章
    public void updateArticle(Article artilce) throws Exception;
    //查询一个
    public Article queryOneArticle(int articleID) throws Exception;
    //更新点击数
    public void updateHits(int hits,int articleID) throws Exception;
    //执行sql
    public List<Article> executeQuery(String sql) throws Exception;
    //执行sql
    public int executeSQL(String sql) throws Exception;
}
