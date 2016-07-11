package com.jwebsite.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.jwebsite.dao.PhotoDao;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.vo.Photo;
import java.io.*;
import javax.persistence.Entity;

@Entity
public class PhotoDaoImpl implements PhotoDao {

	public void delPhoto(int ID) throws Exception {
		// TODO Auto-generated method stub

		DbConnection conn = null;
		PreparedStatement pstmt = null;
		String strSql = "delete from photo where ID=?";
		try {
			conn = new DbConnection();
			pstmt = conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, ID);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除图片信息出错！" + this.toString());
			System.out.println(e);
		}
		conn.closeConnection();

	}

	public void insertPhoto(Photo p) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn = null;
		PreparedStatement pstmt = null;
		String strSql = "insert into photo (ID, Tid, KeyWords, Title, PhotoUrl, PicUrls, PictureContent, Author,"
				+ "Origin, Rank, LastHitsTime, Hits, HitsByDay, HitsByWeek, HitsByMonth, "
				+ "AddDate, ModifyDate, JSID, TemplateID, Fname, RefreshTF, Recommend, "
				+ "Rolls, Strip, Popular, Verific, Comment, IsTop, Score, Slide, DelTF, "
				+ "InfoPurview, ArrGroupID, ReadPoint, ChargeType, PitchTime, ReadTimes, "
				+ "DividePercent, Inputer, WapTemplateID, showstyle, PageNum, MapMarker, "
				+ "SEOTitle, SEOKeyWord, SEODescript,Status ,SpecialID)	values "
				+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
		try {
			conn = new DbConnection();
			pstmt = conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, p.getID());
			pstmt.setString(2, p.getTid());
			pstmt.setString(3, p.getKeyWords());
			pstmt.setString(4, p.getTitle());
			pstmt.setString(5, p.getPhotoUrl());
			pstmt.setString(6, p.getPicUrls());
			pstmt.setString(7, p.getPictureContent());
			pstmt.setString(8, p.getAuthor());
			pstmt.setString(9, p.getOrigin());
			pstmt.setString(10, p.getRank());
			pstmt.setString(11, p.getLastHitsTime());
			pstmt.setInt(12, p.getHits());
			pstmt.setInt(13, p.getHitsByDay());
			pstmt.setInt(14, p.getHitsByWeek());
			pstmt.setInt(15, p.getHitsByMonth());
			pstmt.setString(16, p.getAddDate());
			pstmt.setString(17, p.getModifyDate());
			pstmt.setString(18, p.getJSID());
			pstmt.setString(19, p.getTemplateID());
			pstmt.setString(20, p.getFname());
			pstmt.setInt(21, p.getRefreshTF());
			pstmt.setInt(22, p.getRecommend());
			pstmt.setInt(23, p.getRolls());
			pstmt.setInt(24, p.getStrip());
			pstmt.setInt(25, p.getPopular());
			pstmt.setInt(26, p.getVerific());
			pstmt.setInt(27, p.getComment());
			pstmt.setInt(28, p.getIsTop());
			pstmt.setInt(29, p.getScore());
			pstmt.setInt(30, p.getSlide());
			pstmt.setInt(31, p.getDelTF());
			pstmt.setInt(32, p.getInfoPurview());
			pstmt.setString(33, p.getArrGroupID());
			pstmt.setInt(34, p.getReadPoint());
			pstmt.setInt(35, p.getChargeType());
			pstmt.setInt(36, p.getPitchTime());
			pstmt.setInt(37, p.getReadTimes());
			pstmt.setInt(38, p.getDividePercent());
			pstmt.setString(39, p.getInputer());
			pstmt.setString(40, p.getWapTemplateID());
			pstmt.setInt(41, p.getShowStyle());
			pstmt.setInt(42, p.getPageNum());
			pstmt.setString(43, p.getMapMarker());
			pstmt.setString(44, p.getSEOTitle());
			pstmt.setString(45, p.getSEOKeyWord());
			pstmt.setString(46, p.getSEODescript());
			pstmt.setInt(47, p.getStatus());
			pstmt.setInt(48, p.getSpecialID());

			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("添加值班信息出错！");
			System.out.println(e);
		}
		conn.closeConnection();
	}

	public Photo quaryOnePhoto(int ID) throws Exception {
		// TODO Auto-generated method stub

		Photo p = new Photo();
		DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String strSql = "select * from photo where ID=" + ID + "";
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);
			if (rs.next()) {
				p.setID(rs.getInt("ID"));
				p.setAddDate(rs.getString("AddDate"));
				p.setArrGroupID(rs.getString("ArrGroupID"));
				p.setAuthor(rs.getString("Author"));
				p.setChargeType(rs.getInt("ChargeType"));
				p.setComment(rs.getInt("Comment"));
				p.setDelTF(rs.getInt("DelTF"));
				p.setDividePercent(rs.getInt("DividePercent"));
				p.setFname(rs.getString("Fname"));
				p.setHits(rs.getInt("Hits"));
				p.setHitsByDay(rs.getInt("HitsByDay"));
				p.setHitsByMonth(rs.getInt("HitsByMonth"));
				p.setHitsByWeek(rs.getInt("HitsByWeek"));
				p.setInfoPurview(rs.getInt("InfoPurview"));
				p.setInputer(rs.getString("Inputer"));
				p.setIsTop(rs.getInt("IsTop"));
				p.setJSID(rs.getString("JSID"));
				p.setKeyWords(rs.getString("KeyWords"));
				p.setLastHitsTime(rs.getString("LastHitsTime"));
				p.setMapMarker(rs.getString("MapMarker"));
				p.setModifyDate(rs.getString("ModifyDate"));
				p.setOrigin(rs.getString("Origin"));
				p.setPageNum(rs.getInt("PageNum"));
				p.setPhotoUrl(rs.getString("PhotoUrl"));
				p.setPictureContent(rs.getString("PictureContent"));
				p.setPicUrls(rs.getString("PicUrls"));
				p.setPitchTime(rs.getInt("PitchTime"));
				p.setPopular(rs.getInt("Popular"));
				p.setRank(rs.getString("Rank"));
				p.setReadPoint(rs.getInt("ReadPoint"));
				p.setReadTimes(rs.getInt("ReadTimes"));
				p.setRecommend(rs.getInt("Recommend"));
				p.setRefreshTF(rs.getInt("RefreshTF"));
				p.setRolls(rs.getInt("Rolls"));
				p.setScore(rs.getInt("Score"));
				p.setSEODescript(rs.getString("SEODescript"));
				p.setSEOKeyWord(rs.getString("SEOKeyWord"));
				p.setSEOTitle(rs.getString("SEOTitle"));
				p.setShowStyle(rs.getInt("ShowStyle"));
				p.setSlide(rs.getInt("Slide"));
				p.setStrip(rs.getInt("Strip"));
				p.setTemplateID(rs.getString("TemplateID"));
				p.setTid(rs.getString("Tid"));
				p.setTitle(rs.getString("Title"));
				p.setVerific(rs.getInt("Verific"));
				p.setWapTemplateID(rs.getString("WapTemplateID"));
				p.setStatus(rs.getInt("Status"));
				p.setSpecialID(rs.getInt("SpecialID"));

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询一条图片出错！");
			System.out.println(e);
		}
		conn.closeConnection();

		return p;
	}

	public ResultSet showAllPhoto() throws Exception {
		// TODO Auto-generated method stub

		DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String strSql = "select * from photo order by ID";
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示全部图片出错！");
			System.out.println(e);
		}
		//conn.closeConnection();

		return rs;

	}

	public String showSel(String selstr) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public void updatePhoto(Photo p) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn = null;
		PreparedStatement pstmt = null;
		String strSql = "update photo set  Tid=?,KeyWords=?,Title=?,"
				+ "PhotoUrl=?,PicUrls=?,PictureContent=?,Author=?,Origin=?,"
				+ "Rank=?,LastHitsTime=?,Hits=?,HitsByDay=?,HitsByWeek=?,"
				+ "HitsByMonth=?,AddDate=?,ModifyDate=?,JSID=?,TemplateID=?,"
				+ "Fname=?,RefreshTF=?,Recommend=?,Rolls=?,Strip=?,Popular=?,Verific=?,"
				+ "Comment=?,IsTop=?,Score=?,Slide=?,DelTF=?,InfoPurview=?,ArrGroupID=?,"
				+ "ReadPoint=?,ChargeType=?,PitchTime=?,ReadTimes=?,DividePercent=?,Inputer=?,"
				+ "WapTemplateID=?,showstyle=?,PageNum=?,MapMarker=?,SEOTitle=?,SEOKeyWord=?,"
				+ "SEODescript=?, Status=?, SpecialID=? where ID=?";
		try {
			conn = new DbConnection();
			pstmt = conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, p.getTid());
			pstmt.setString(2, p.getKeyWords());
			pstmt.setString(3, p.getTitle());
			pstmt.setString(4, p.getPhotoUrl());
			pstmt.setString(5, p.getPicUrls());
			pstmt.setString(6, p.getPictureContent());
			pstmt.setString(7, p.getAuthor());
			pstmt.setString(8, p.getOrigin());
			pstmt.setString(9, p.getRank());
			pstmt.setString(10, p.getLastHitsTime());
			pstmt.setInt(11, p.getHits());
			pstmt.setInt(12, p.getHitsByDay());
			pstmt.setInt(13, p.getHitsByWeek());
			pstmt.setInt(14, p.getHitsByMonth());
			pstmt.setString(15, p.getAddDate());
			pstmt.setString(16, p.getModifyDate());
			pstmt.setString(17, p.getJSID());
			pstmt.setString(18, p.getTemplateID());
			pstmt.setString(19, p.getFname());
			pstmt.setInt(20, p.getRefreshTF());
			pstmt.setInt(21, p.getRecommend());
			pstmt.setInt(22, p.getRolls());
			pstmt.setInt(23, p.getStrip());
			pstmt.setInt(24, p.getPopular());
			pstmt.setInt(25, p.getVerific());
			pstmt.setInt(26, p.getComment());
			pstmt.setInt(27, p.getIsTop());
			pstmt.setInt(28, p.getScore());
			pstmt.setInt(29, p.getSlide());
			pstmt.setInt(30, p.getDelTF());
			pstmt.setInt(31, p.getInfoPurview());
			pstmt.setString(32, p.getArrGroupID());
			pstmt.setInt(33, p.getReadPoint());
			pstmt.setInt(34, p.getChargeType());
			pstmt.setInt(35, p.getPitchTime());
			pstmt.setInt(36, p.getReadTimes());
			pstmt.setInt(37, p.getDividePercent());
			pstmt.setString(38, p.getInputer());
			pstmt.setString(39, p.getWapTemplateID());
			pstmt.setInt(40, p.getShowStyle());
			pstmt.setInt(41, p.getPageNum());
			pstmt.setString(42, p.getMapMarker());
			pstmt.setString(43, p.getSEOTitle());
			pstmt.setString(44, p.getSEOKeyWord());
			pstmt.setString(45, p.getSEODescript());
			pstmt.setInt(46, p.getStatus());
			pstmt.setInt(47, p.getSpecialID());
			pstmt.setInt(48, p.getID());

			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新值班信息出错！");
			System.out.println(e);
		}
		conn.closeConnection();

	}

	// 删除图片文件
	public void delPhotofile(int ID,String url) throws Exception {
		// TODO Auto-generated method stub

		try{
		Photo p = this.quaryOnePhoto(ID);
		String PhotoUrl = p.getPhotoUrl();
		System.out.println(url+PhotoUrl);
		File Photofile = new File(url+PhotoUrl);		
		Photofile.delete();
		//
		Photofile=new File(PhotoUrl.replace(".jpg", "_S.jpg"));
		
		
		// 解析图片路径
		String PicUrl = p.getPicUrls();
		String picArr[] = PicUrl.split("\\|");
		for (int i = 0; i < picArr.length; i++) {
			if (picArr[i] != null
					&& (picArr[i].endsWith(".jpg") || picArr[i]
							.endsWith(".gif"))) {
				System.out.println(url+picArr[i]);
				File f = new File(url+picArr[i]);				
				f.delete();
			}

		}
		
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("删除图片文件出错");
		}
	}

	public void recPhoto(int ID) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn = null;
		PreparedStatement pstmt = null;
		String strSql = "update photo set DelTF=?  where ID=?";
		try {
			conn = new DbConnection();
			pstmt = conn.getConnection().prepareStatement(strSql);			
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, ID);
			pstmt.executeUpdate();

			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("图片回收出错！");
			System.out.println(e);
		}
		conn.closeConnection();
	}

	public ResultSet quaryOnePhotoRS(int ID) throws Exception {
		// TODO Auto-generated method stub
		
		DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String strSql = "select * from photo where ID=" + ID + "";
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);		

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("查询一条图片信息出错！");
			System.out.println(e);
		}
		//conn.closeConnection();
		return rs;
		
	}

	public void SetIsTop(int ID, String type) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=new DbConnection();
		PreparedStatement pstmt=null;
		String strSql=null;
		if(type.equals("set"))
	       strSql="update photo set IsTop=1 where ID=?";
		else
		   strSql="update photo set IsTop=0 where ID=?";
	    try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, ID);
			pstmt.executeUpdate();
			conn.closeConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("固顶图片发生错误！");
			System.out.println(e);
		}
		
	}

	public void SetRecommend(int ID, String type) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=new DbConnection();
		PreparedStatement pstmt=null;
		String strSql=null;
		if(type.equals("set"))
	       strSql="update photo set Recommend=1 where ID=?";
		else
		   strSql="update photo set Recommend=0 where ID=?";
	    try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, ID);
			pstmt.executeUpdate();
			conn.closeConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("推荐图片发生错误！");
			System.out.println(e);
		}
	}
	/**
	 * 审核图片，修正图片得分
	 * @param PhotoID 图片ID
	 * @param score     分数
	 * @param struts   状态 标志修改类型
	 * @throws Exception
	 */
	
	public void checkArticle(int PhotoID,int score,String struts) throws Exception
	{
		DbConnection conn=new DbConnection();
		PreparedStatement pstmt=null;
		String strSql=null;
		if(struts.equals("set"))
	      strSql="update Article set Status=1 where ArticleID=?";
		if(struts.equals("no"))
		  strSql="update Article set Status=0 where ArticleID=?";
		if(struts.equals("get"))
		  strSql="update Article set Status=-1 where ArticleID=?";
		if(struts.equals("setScore"))
			  strSql="update Article set num="+score+",Status=1 where ArticleID=?";
	    try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, PhotoID);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(" 审核图片发生错误！");
			System.out.println(e);
		}
	    
		conn.closeConnection();
		
	}

	public void CheckPhoto(int ID, String struts) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=new DbConnection();
		PreparedStatement pstmt=null;
		String strSql=null;
		if(struts.equals("set"))
	      strSql="update Photo set Status=1 where ID=?";
		if(struts.equals("no"))
		  strSql="update Photo set Status=0 where ID=?";
		if(struts.equals("get"))
		  strSql="update Photo set Status=-1 where ID=?";
		
	    try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, ID);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(" 审核图片发生错误！");
			System.out.println(e);
		}
	    
		conn.closeConnection();
		
		
	}
   /**
    * 审核文章
    */
	public void CheckPhoto(int ID, int Score, String struts) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=new DbConnection();
		PreparedStatement pstmt=null;
		String strSql=null;
		if(struts.equals("set"))
	      strSql="update Photo set Status=1 where ID=?";
		if(struts.equals("no"))
		  strSql="update Photo set Status=0 where ID=?";
		if(struts.equals("get"))
		  strSql="update Photo set Status=-1 where ID=?";
		if(struts.equals("setScore"))
			  strSql="update Photo set Score=? where ID=?";
		
	    try {
			conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, Score);
			pstmt.setInt(2, ID);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(" 审核图片发生错误！");
			System.out.println(e);
		}
	    
		conn.closeConnection();
	}
    /**
     * 还原文章
     * one 还原一个
     * all 还原所有
     */
	public void restorePhoto(int ID, String status) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn=new DbConnection();
		Statement stmt=null;
		String strSql="";
		if("one".equals(status)){
	       strSql="update  photo set DelTF=0 where ID="+ID+"";
		}
		else if("all".equals(status)&&ID==0){
	    	strSql="update photo set DelTF=0 ";
		}
	    try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			stmt.execute(strSql);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("还原图片发生错误！");
			System.out.println(strSql);
			System.out.println(e);
		}
	}
	/**
	 * 清空回收站
	 * @throws Exception
	 */
	public void clearRecyclebin() throws Exception
	{
		
		DbConnection conn=new DbConnection();
		Statement stmt=null;
	    String strSql="delete from  Photo where  DelTF=1";
	    try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			stmt.execute(strSql);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("清空回收站发生错误！");
			System.out.println(e);
		}
	    
		
	}

}
