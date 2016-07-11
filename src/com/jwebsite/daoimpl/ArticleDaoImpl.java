package com.jwebsite.daoimpl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jwebsite.dao.ArticleDao;
import com.jwebsite.db.DbConn;
import com.jwebsite.pub.HashMapOperate;
import com.jwebsite.vo.Article;

public class ArticleDaoImpl implements ArticleDao {

	HashMapOperate ho = new HashMapOperate<Article>();

	// 彻底删除文章
	public void delArticle(int articleID) throws Exception {
		String strSql = "delete from Article where ArticleID=" + articleID;
		DbConn.executeSQL(strSql);
	}

	// 将文章移到回收站
	public void recArticle(int articleID) throws Exception {
		String strSql = "update  Article set Deleted=1 where ArticleID="
				+ articleID;
		DbConn.executeSQL(strSql);
	}

	// 清空回收站
	public void clearRecyclebin() throws Exception {
		String strSql = "delete from  Article where  Deleted=1";
		DbConn.executeSQL(strSql);
	}

	// 还原文章
	public void restoreArticle(int articleID, String status) throws Exception {
		String strSql = "";
		if ("one".equals(status)) {
			strSql = "update  Article set Deleted=0 where ArticleID="
					+ articleID + "";
		} else if ("all".equals(status) && articleID == 0) {
			strSql = "update Article set Deleted=0 ";
		}
		DbConn.executeSQL(strSql);
	}

	// 根据文章分类删除文章
	public void delArticleByClassID(int classID) throws Exception {
		String strSql = "delete from Article where ClassID=" + classID;
		DbConn.executeSQL(strSql);
	}
	// 固顶文章
	public void setOnTop(int articleID, String struts) throws Exception {
		String strSql = "update Article ";
		if (struts.equals("set")) {
			strSql += " set OnTop=1 ";
		} else {
			strSql += " set OnTop=0 ";
		}
		strSql += " where ArticleID=" + articleID;
		DbConn.executeSQL(strSql);
	}

	// 推荐文章
	public void setElite(int articleID, String struts) throws Exception {
		String strSql = " update Article  ";
		if (struts.equals("set")) {
			strSql += " set Elite=1 ";
		} else {
			strSql += " set Elite=0 ";
		}
		strSql += " where ArticleID=" + articleID;
		DbConn.executeSQL(strSql);
	}

	// 审核文章
	public void checkArticle(int articleID, String struts) throws Exception {
		String strSql = null;
		if (struts.equals("set"))
			strSql = "update Article set Status=1 where ArticleID=" + articleID;
		if (struts.equals("no"))
			strSql = "update Article set Status=0 where ArticleID=" + articleID;
		if (struts.equals("get"))
			strSql = "update Article set Status=-1 where ArticleID="
					+ articleID;

		DbConn.executeSQL(strSql);
	}
	// 添加文章
	public void insertArticle(Article article) throws Exception {
		DbConn.executeInsert(article);
	}
	// 更新文章
	public void updateArticle(Article article) throws Exception {
		DbConn.executeUpdate(article, "ArticleID");
	}
	// 查询文章
	public Article queryOneArticle(int articleID) throws Exception {
		String strSql = "select * from Article where ArticleID="+articleID;
		HashMap<String, String> hm = DbConn.executeQueryOne(strSql);
		Article art = (Article) ho.HashMapToPojo(hm, Article.class);
		return art;

	}

	// 更新点击数
	public void updateHits(int hits, int articleID) throws Exception {

		String strSql = "update  Article set Hits=" + hits
				+ " where ArticleID=" + articleID + "";
		DbConn.executeSQL(strSql);

	}
	//获取置顶文章
	public List<Article> getOnTop(int ClassID) throws Exception {
		// TODO Auto-generated method stub
		
		String Sqlstr = "select * from  article where (Status= 1 and Deleted=0  and ClassID="
				+ ClassID
				+ " or ClassID In (select ClassID From article_class where ParentID="
				+ ClassID + ") )and OnTop=1 order by ArticleID desc";
		ArrayList<HashMap<String, String>> mlist=DbConn.executeQuery(Sqlstr);
		List<Article> alist=ho.HashMapToObjectList(mlist, Article.class);		
		return alist;
	}
	//获取一个栏目下得所有文章
	public List<Article> getArticleSize(int ClassID) throws Exception {
		// TODO Auto-generated method stub
		String Sqlstr = "select * from  article where (Status= 1 and Deleted=0  and ClassID="
				+ ClassID
				+ " or ClassID In (select ClassID From article_class where ParentID="
				+ ClassID + ") )order by ArticleID desc";
		ArrayList<HashMap<String, String>> mlist=DbConn.executeQuery(Sqlstr);
		List<Article> alist=ho.HashMapToObjectList(mlist, Article.class);		
		return alist;

	}
	//执行sql
    public List<Article> executeQuery(String sql) throws Exception{
    	ArrayList<HashMap<String, String>> mlist=DbConn.executeQuery(sql);
		List<Article> alist=ho.HashMapToObjectList(mlist, Article.class);		
		return alist;
    }
    //执行sql
    public int executeSQL(String sql) throws Exception{
    	return DbConn.executeSQL(sql);
    }

}
