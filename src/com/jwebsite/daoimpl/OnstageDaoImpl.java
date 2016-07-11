package com.jwebsite.daoimpl;

import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.jwebsite.dao.*;
import com.jwebsite.pub.*;
import com.jwebsite.vo.ArticleClass;

public   class OnstageDaoImpl implements OnstageDao {
	DbConnection conn=new DbConnection();
	public String showNews(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Status= 1 and Deleted=0 and ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") order by ArticleID desc";
		strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=100%' align=center background=Images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
     	//strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			
			while(rs.next()&&n<rowNum)
			{
				int ID=rs.getInt("ArticleID");
				strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
				strNews.append("<TD height=22   ><SPAN class=biaoti><FONT color=#000000>");
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</SPAN></TD>");
			
				if (updateTime)
		        {
		          strNews.append("<TD height=22 width=90 align=left ><SPAN class=biaoti>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
		        }

		        strNews.append("</TD>");
		        strNews.append("</SPAN></TD>");
		        strNews.append("</TR>");

			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错出错！");
			System.out.println(e);
		}
		//strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	}
	public String showNewsTwo(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Status= 1 and Deleted=0 and ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") order by ArticleID desc";
		strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=100%' align=center background=Images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
     	//strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			while(rs.next()&&n<rowNum)
			{
				int ID=rs.getInt("ArticleID");
				strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
				strNews.append("<TD height=22><SPAN class=biaoti><FONT color=#000000>");
				strNews.append("&nbsp;<img src=Images/ boder=0>&nbsp;<a class=middle href='jxcgClass.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</SPAN></TD>");
				if (updateTime)
		        {
		          strNews.append("<TD height=22 width=90 align=left ><SPAN class=biaoti><FONT size=1px>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
		        }

		        strNews.append("</TD>");
		        strNews.append("</SPAN></TD>");
		        strNews.append("</TR>");

			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错出错！");
			System.out.println(e);
		}
		//strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	}
	
	public String showNews(int ClassID, int rowNum, int maxChar, String className, boolean updateTime,int datewidth ) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Status= 1 and Deleted=0 and ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") order by ArticleID desc";
		strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=100%' align=center background=Images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
     //  System.out.println(ClassID+" ====================== "+className);
		//strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			
			while(rs.next()&&n<rowNum)
			{
				int ID=rs.getInt("ArticleID");
				strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
				strNews.append("<TD height=22   ><SPAN class=biaoti><FONT color=#000000>");
				strNews.append("&nbsp;<img src=Images/ boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</SPAN></TD>");
			
				if (updateTime)
		        {
		          strNews.append("<TD height=22 width="+datewidth+"% align=left ><SPAN class=biaoti><FONT   color=#999999>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
		        }

		        strNews.append("</TD>");
		        strNews.append("</SPAN></TD>");
		        strNews.append("</TR>");

			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错出错！");
			System.out.println(e);
		}
		//strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	}
	
	
	
	public String showNews1(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Status=1 and( ClassID="+ClassID+" or ClassID in(select ClassID  from article_class where ParentID="+ClassID+" ) or ClassID in(select ClassID  from article_class where ParentID in ( select ClassID  from article_class where ParentID="+ClassID+") ) ) order by ArticleID desc";
		System.out.println(strSql);
		strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=98%' align=center background=images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
        strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{
				strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
				strNews.append("<TD height=22><SPAN class=biaoti><FONT color=#000000>");
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</SPAN></TD>");
			
				if (updateTime)
		        {
		          strNews.append("<TD height=22 width=14%><SPAN class=biaoti><FONT color=#999999>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
		        }
		        strNews.append("</TD>");
		        strNews.append("</SPAN></TD>");
		        strNews.append("</TR>");

			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错出错！");
			System.out.println(e);
		}
		strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	}
	
	/**
	 * 查询文章所属顶级栏目
	 */
	public String queryOneClass(int ParentID) throws Exception {
		//DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer showClass = new StringBuffer();
		String strNbsp = "";
		
		String strSql = "select ClassID from article_class where ParentID=0 and (ClassID="+ParentID+" or ClassID=(select ParentID from article_class  where ClassID=(select ParentID from article_class  where ClassID="+ParentID+" ) ) or ClassID=(select ParentID  from article_class  where ClassID="+ParentID+" ) )";
		//System.out.println("++++++++++++tttttttttttt+++++++="+strSql);
		try {
			//conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				
				strNbsp=rs.getString("ClassID");
				
			}

		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + strSql + ex.getMessage());

		}
     // System.out.println("oooooooooooooooooooooooo+="+strNbsp);
		rs.close();
//		conn.closeConnection();
		return strNbsp.toString();

	}
	
	
	public String showNews2(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Deleted=0 and ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") order by ArticleID desc";
		strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=98%' align=center background=images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
        strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{
				strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
				    strNews.append("<TD height=22 colspan='2'><SPAN class=biaoti><FONT color=#000000>");
				        strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				        if(n==0){
				        	strNews.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						    strNews.append(CharType.limitStr(rs.getString("Content"),maxChar+100));
						    strNews.append("......");
				        }
				        strNews.append("</SPAN></TD>");
				        
				if (updateTime)
		        {
		          strNews.append("<TD height=22 width=14%><SPAN class=biaoti><FONT color=#999999>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
		        }
				
		        strNews.append("</SPAN></TD>");
		        strNews.append("</TR>");
		       
			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错出错！");
			System.out.println(e);
		}
		strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	} 

	 //显示相关新闻
	public String showAboutNews(String keyword,int rowNum,int articleID) throws Exception
	{
		StringBuffer aboutNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=1;
		aboutNews.append("<TABLE><TBODY>");
		if("".equals(keyword)||keyword==null)
		{
			aboutNews.append("<tr><td>还没有相关新闻！</td></tr>");
		}
		else
		{
		String  strKeyword[]=keyword.split("|");		
		for(int i=0;i<strKeyword.length;i++)
		{
		String strSql="select ArticleID,Title,UpdateTime from article where ArticleID<>"+articleID+" and Title like '"+strKeyword[i]+"'";
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{
				aboutNews.append("<TR><TD vAlign=top>·</TD><TD ><a target=_blank href='ArticleContent.jsp?ClassID="+rs.getString("ClassID")+"&ID="+rs.getString("ArticleID")+"'>"+rs.getString("Title")+"</a><FONT color=#666666>("+rs.getString("UpdateTime")+")</FONT></TD></TR>");
				
			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示相关新闻出错！");
			System.out.println(e);
		}
		}
		aboutNews.append("</TBODY></TABLE>");
		}
		rs.close();
		conn.closeConnection();
		return aboutNews.toString();
	}
	//显示幻灯新闻
	
	public String showFlashNews(int ClassID) throws Exception
	{
	StringBuffer strFlashNews=new StringBuffer();
	//DbConnection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	String imgUrl="";
	String imgtext="";
	String imgLink="";
	int n=1;
	String strSql="select * from  article where Deleted=0 and IncludePic=1 and( ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") or ClassID In (select ClassID From article_class where ParentID  in (select ClassID From article_class where ParentID="+ClassID+"))) order by ArticleID desc";
try{
	//conn=new DbConnection();
	stmt=conn.getConnection().createStatement();
	rs=stmt.executeQuery(strSql);

	if(rs.next())
	{
			rs.previous();
		while(rs.next()&&n<6)
		{ 		
		if(n==1){
		imgUrl+=rs.getString("DefaultPicUrl");
		}else{
	
		imgUrl+="|"+rs.getString("DefaultPicUrl");
		}
		if(n==1){
		imgtext+=""+CharType.limitStr(rs.getString("Title"), 15)+"";
		}else{
	
		imgtext+="|"+CharType.limitStr(rs.getString("Title"), 15)+"";
		}
		if(n==1){
		imgLink+="ArticleContent.jsp?CLID="+rs.getInt("ArticleID")+"="+rs.getInt("ClassID")+"";
		}else{
		imgLink+="|ArticleContent.jsp?CLID="+rs.getInt("ArticleID")+"="+rs.getInt("ClassID")+"";
		}
		// strFlashNews.append("imgUrl"+n+"="+rs.getString("DefaultPicUrl")+"<br>");
		// strFlashNews.append("imgtext"+n+"="+rs.getString("Title")+"<br>");
		// strFlashNews.append("imgLink"+n+"=ArticleContent.jsp?ID="+rs.getInt("ArticleID")+"&ClassID="+rs.getInt("ClassID")+"<br>");
	
	
		n++; 
		}
	}else
	{
		System.out.print("else--------");
		imgUrl="UserFiles/Image/201012228.jpg";
		imgtext="没有图片显示";
		imgLink="#";
	}

	}catch (Exception e) {
	// TODO Auto-generated catch block
	System.out.println("显示幻灯新闻出错！");
	System.out.println(e);
	}

	strFlashNews.append(imgUrl+";");
	strFlashNews.append(imgtext+";");
	strFlashNews.append(imgLink+";");
//	System.out.println("strFlashNews==============="+strFlashNews);
	rs.close();
	conn.closeConnection();
	return strFlashNews.toString();
	}

	
	
   public static void main(String args[])
   {
	   String strShow="";
	  try {
		 strShow=DAOFactory.getOnstageDaoInstance().showVote();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   System.out.println(strShow);
	   
   }
   public String showPicNews(int picNum,int width,int height,boolean ifShowTitle) throws Exception
   {
	   StringBuffer strPicNews=new StringBuffer();
	  // DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		strPicNews.append("<table><tr>");
		int n=0;
		String strSql="select ArticleID,DefaultPicUrl,Title,ClassID from article where Deleted=0 and IncludePic=1 order by UpdateTime desc";
		try{
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			while(rs.next()&&n<picNum)
			{
				strPicNews.append("<td align=center width="+width+">");
				strPicNews.append("<a href=ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+" target=_blank><img src="+rs.getString("DefaultPicUrl")+"  width="+width+" height="+height+" border=0></a>&nbsp;");
				if(ifShowTitle)
				{
					
					strPicNews.append("<br>"+CharType.limitStr(rs.getString("Title"), 8)+"");	
				}
				strPicNews.append("</TD>");
				 strPicNews.append("</TR>");
			n++;	
			}
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示幻灯新闻出错！");
			System.out.println(e);
		}
		
		 strPicNews.append("</table>");
		rs.close();
		conn.closeConnection();
	   
	   
	   return strPicNews.toString();
   }
   public String showPicNews1(int ClassID,int picNum,int width,int height,boolean ifShowTitle) throws Exception
   {
	   StringBuffer strPicNews=new StringBuffer();
	  // DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		int n=0;
		String strSql="select ArticleID,DefaultPicUrl,Title,ClassID from article where Deleted=0 and IncludePic=1 and ClassID="+ClassID+" order by UpdateTime desc";
		try{
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			while(rs.next()&&n<picNum)
			{
				
				strPicNews.append("<a href=ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+" target=_blank><img src="+rs.getString("DefaultPicUrl")+"  width="+width+" height="+height+" border=0></a>&nbsp;");
				if(ifShowTitle)
				{
					
					strPicNews.append("<br>"+CharType.limitStr(rs.getString("Title"), 8)+"");	
				}
				
			n++;	
			}
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示幻灯新闻出错！");
			System.out.println(e);
		}
		
		 
		rs.close();
		conn.closeConnection();
	   
	   
	   return strPicNews.toString();
   }
   
	   public String showPicNews2(int ClassID) throws Exception
	   {
		   StringBuffer strPicNews=new StringBuffer("");
		 //  DbConnection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			
			int n=1;
		//	String strSql="select DefaultPicUrl from article where  ClassID="+ClassID+" order by UpdateTime desc";
			String strSql="select DefaultPicUrl from  article where ClassID="+ClassID+" or ClassID in(select ClassID  from article_class where ParentID="+ClassID+" ) or ClassID in(select ClassID  from article_class where ParentID in ( select ClassID  from article_class where ParentID="+ClassID+") ) order by ArticleID desc";

			try{
			//	conn=new DbConnection();
				stmt=conn.getConnection().createStatement();
				rs=stmt.executeQuery(strSql);
				System.out.println(rs.getRow()+":"+ClassID+":"+strSql);
				while(rs.next()){
					if (n==1) {
						strPicNews.append(rs.getString("DefaultPicUrl"));
					}else if(n<=6){
						strPicNews.append("|"+rs.getString("DefaultPicUrl"));
					}
					
					n++;
				}
				System.out.println(strSql);
			}catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("显示幻灯新闻出错！");
				System.out.println(e);
			}
			
			 
			rs.close();
			conn.closeConnection();
		   
		   
		   return strPicNews.toString();
	   }
   
   public String showAllNews(int rowNum,int maxChar)throws Exception
   {
	   StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Deleted=0 order by UpdateTime ";
		strNews.append("<TABLE  align=left  border=0 valign=bottom>");
       strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{
				strNews.append("<TR background=images/index_jgtg_hang_bg.jpg>");
				strNews.append("<TD height=20>");
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a  title='"+rs.getString("Title")+"' href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' >"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</TD>");
				strNews.append("</TR>");
			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错！");
			System.out.println(e);
		}
		strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	   
   }
   public String showEliteNews(int rowNum,int maxChar)throws Exception
   {
	   StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Deleted=0 and Elite=1 order by UpdateTime ";
		strNews.append("<TABLE  align=left  border=0 valign=bottom>");
      strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{
				strNews.append("<TR background=images/index_jgtg_hang_bg.jpg>");
				strNews.append("<TD height=20>");
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a title='"+rs.getString("Title")+"'  href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' >"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</TD>");
				strNews.append("</TR>");
			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示推荐新闻出错！");
			System.out.println(e);
		}
		strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	   
	   
   }
   //显示热点新闻
   public String showHotNews(int rowNum,int maxChar)throws Exception
   {
	   
	   StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Deleted=0 order by Hits desc ";
		strNews.append("<TABLE  align=left  border=0 valign=bottom>");
     strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{
				strNews.append("<TR background=images/index_jgtg_hang_bg.jpg>");
				strNews.append("<TD height=20>");
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a title='"+rs.getString("Title")+"'  href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' >"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</TD>");
				strNews.append("</TR>");
			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示热点新闻出错！");
			System.out.println(e);
		}
		strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	   
	   
	   
   }
   public String showRollsAnnounce(int rowNum,int maxChar) throws Exception
   {
	   
	    StringBuffer strRollsAnnounce=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  announce where ShowType=0 or ShowType=1 order by DateAndTime desc";
	
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{
				strRollsAnnounce.append("&nbsp;<img src='images/ar4.gif' border=0 >&nbsp;<a href=javascript:openWindow('AnnounceContent.jsp?ID="+rs.getInt("ID")+"')>"+CharType.limitStr(rs.getString("Title"), maxChar)+"</a><br>");

			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示滚动公告出错！");
			System.out.println(e);
		}
		rs.close();
		conn.closeConnection();
		return strRollsAnnounce.toString();
	   
	   
   }
   //显示友情链接
   public String showLink(int tid) throws Exception
   {
	   StringBuffer strLink=new StringBuffer();
	   DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from  site_class where id="+tid+" order by ClassID desc";
		strLink.append("<Table>");
		try {
			conn=new DbConnection(); 
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next())
			{
				strLink.append("<tr><td>");
				strLink.append("<select onchange='window.location=this.value';>");
				strLink.append("<option  selected>"+rs.getString("ClassName")+"</option>");
				strLink.append(this.showClassLink(rs.getInt("ClassID")));
				strLink.append("</select>");
				strLink.append("</td></tr>");
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示友情链接出错！");
			System.out.println(e);
		}
		strLink.append("</Table>");
		rs.close();
		conn.closeConnection();
	   
	   return strLink.toString();
   }
   
   
   //显示友情链接基础部、信息管理系、采矿系
   public String showJcbLink(int tid,int content) throws Exception
   {
	   StringBuffer strLink=new StringBuffer();
	   DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int cont=1;
		String strSql="select * from  site_class where id="+tid+" order by ClassID desc";
		System.out.println(strSql);
		strLink.append("<Table><tr>");
		try {
			conn=new DbConnection(); 
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next())
			{
				
				
				if(content>=cont)
				{
					strLink.append("<td width=200>");
					strLink.append("<select onchange='window.location=this.value';>");
					strLink.append("<option  selected>..."+rs.getString("ClassName")+"</option>");
					strLink.append(this.showClassLink(rs.getInt("ClassID")));
					strLink.append("</select>");
					strLink.append("</td>");
				}
				
			
				cont++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示友情链接出错！");
			System.out.println(e);
		}
		strLink.append("</tr></Table>");
		rs.close();
		conn.closeConnection();
	   
	   return strLink.toString();
   }
   
   
   //友情链接栏目选择方法
   public String showClassLink(int classID) throws Exception
   {
	   
	   StringBuffer strClassLink=new StringBuffer();
	    DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from  friendsite  where ClassID="+classID+"  order by ID desc";
	
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next())
			{
				strClassLink.append("<option  value='"+rs.getString("SiteUrl")+"'>"+rs.getString("SiteName")+"</option>");
				
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示友情链接出错！");
			System.out.println(e);
		}
		rs.close();
		conn.closeConnection();
	   
	   return strClassLink.toString();
	   
   }
   //显示网站调查
   public String showVote() throws Exception
   {
	    StringBuffer strVote=new StringBuffer();
	    //DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from vote where IsSelected=1 order by VoteTime";
		
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			if(rs.next())
			{
				strVote.append("<form action='VoteShow.jsp?ID="+rs.getInt("ID")+"' method=post name='VoteForm' target=_blank>");
				strVote.append("<table width='100%' >");
				strVote.append("<tr><td>"+rs.getString("Title")+"</td></tr>");
				for(int i=1;i<9;i++)
				{
				if(!(rs.getString("Select"+i+"").equals("null")||"".equals(rs.getString("Select"+i+""))))
				{
			     if(rs.getInt("VoteType")==1){
				   strVote.append("<tr><td><input type='radio' name='Answer"+i+"' value='"+rs.getInt("Answer"+i+"")+"' />"+rs.getString("Select"+i+"")+"</td></tr>");
			     }
			     else
			     {
			       strVote.append("<tr><td><input type='checkbox' name='Answer"+i+"' value='"+rs.getInt("Answer"+i+"")+"' />"+rs.getString("Select"+i+"")+"</td></tr>");
			     }
				}
				}
				strVote.append("<tr><td><input type='submit' name='Submit' value='提 交' /> <input type='reset' name='Submit' value='重 置' /></td></tr>");
				strVote.append("</table>");
				strVote.append("</form>");
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示网站调查出错！");
			System.out.println(e);
		}
		
		rs.close();
		conn.closeConnection();
	   
	   return strVote.toString();
	   
	   
   }
   public String showVote(int voteID) throws Exception
   {
	   StringBuffer strVote=new StringBuffer();
	    //DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from vote where ID="+voteID+"";
		
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			if(rs.next())
			{
				strVote.append("<form action='Vote.jsp?ID="+rs.getInt("ID")+"' method=post name='VoteForm' target=_blank>");
				strVote.append("<table width='100%' >");
				strVote.append("<tr><td>"+rs.getString("Title")+"</td></tr>");
				for(int i=1;i<9;i++)
				{
				if(!(rs.getString("Select"+i+"").equals("null")||"".equals(rs.getString("Select"+i+""))))
				{
			     if(rs.getInt("VoteType")==1){
				   strVote.append("<tr><td><input type='radio' name='Answer"+i+"' value='"+rs.getInt("Answer"+i+"")+"' />"+rs.getString("Select"+i+"")+"</td></tr>");
			     }
			     else
			     {
			       strVote.append("<tr><td><input type='checkbox' name='Answer"+i+"' value='"+rs.getInt("Answer"+i+"")+"' />"+rs.getString("Select"+i+"")+"</td></tr>");
			     }
				}
				}
				strVote.append("<tr><td><input type='submit' name='Submit' value='提 交' /> <input type='reset' name='Submit' value='重 置' /></td></tr>");
				strVote.append("</table>");
				strVote.append("</form>");
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示网站调查出错！");
			System.out.println(e);
		}
		
		rs.close();
		conn.closeConnection();
	   
	   return strVote.toString();
	   
	   
	   
   }
   public String showChildNews(int ClassID,int rowNum,int maxChar,String className,String imgUrl,boolean showMore) throws Exception
   {
	   StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Deleted=0 and ClassID="+ClassID+" ";
		strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=98%' align=center background=images/index_jgtg_hang_bg.jpg border=0 valign=bottom>");
       strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{
				strNews.append("<TR background=images/index_jgtg_hang_bg.jpg>");
				strNews.append("<TD height=22>");
				strNews.append("&nbsp;<img src="+imgUrl+" boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</TD>");
				strNews.append("</TR>");
			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错出错！");
			System.out.println(e);
		}
		if(showMore)
		{
			strNews.append("<tr><td align=right><a target=_blank href=ArticleClass.jsp?ClassID="+ClassID+">更多</a>..</td></tr>");	
			
		}
		strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	   
	   
	   
   }
   public String showChildNewsTwo(int ClassID,int rowNum,int maxChar,String className,String imgUrl,boolean showMore) throws Exception
   {
	   StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Deleted=0 and ClassID="+ClassID+" ";
		strNews.append("<TABLE class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=98%' align=center background=images/index_jgtg_hang_bg.jpg border=0 valign=bottom>");
      strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{
				strNews.append("<TR background=images/index_jgtg_hang_bg.jpg>");
				strNews.append("<TD height=22 width='50%'>");
				strNews.append("&nbsp;<img src="+imgUrl+" boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</TD>");
				rs.next();
				strNews.append("<TD width='50%'>");
				strNews.append("&nbsp;<img src="+imgUrl+" boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</TD>");
				strNews.append("</TR>");
			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错出错！");
			System.out.println(e);
		}
		if(showMore)
		{
			strNews.append("<tr><td align=right colspan=2><a target=_blank href=ArticleClass.jsp?ClassID="+ClassID+">更多</a>..</td></tr>");	
			
		}
		strNews.append("</TBODY>");
		strNews.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	   
	   
   }
   public ResultSet showNewsList(int ClassID) throws Exception
   {
	   
	    //DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from  article where Status=1 and Deleted=0 and ClassID="+ClassID+" order by ArticleID desc";           
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			}
			catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示新闻列表出错出错！");
			System.out.println(e);
		}
		return rs;
	   
	   
   }
   public String showClassList(int ParentID) throws Exception
   {
	    //DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		StringBuffer strClass=new StringBuffer();
		strClass.append("<TABLE width=194>");
		String strSql="select * from  article_class where  ParentID="+ParentID+" ";           
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			while(rs.next())
			{
				strClass.append("<TR><TD class=12b2 height=29 width=194 background=images1/left_btbg.jpg align=center>");
				strClass.append("<strong><a id=ChildColumnList_ctl00_hylName href=ArticleClass.jsp?ClassID="+rs.getInt("ClassID")+">"+rs.getString("ClassName")+"</a></strong>");
				strClass.append("<TD></TR>");
				
			}
			}
			catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示文章分类出错！");
			System.out.println(e);
		}
		strClass.append("</Table>");
		if(rs!=null){
			
			rs.close();	
		}
		
		
		conn.closeConnection();
		return strClass.toString();
	   
	   
   }
   public String showClassList1(int ParentID) throws Exception
   {
	   // DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		StringBuffer strClass=new StringBuffer();
		strClass.append("<TABLE >");
		String strSql="select * from  article_class where ParentID="+ParentID+" ";           
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			while(rs.next())
			{
				strClass.append("<TR><TD  height=24 width=150 >");
				strClass.append("&nbsp;&nbsp;<img src='images/fk.jpg'>&nbsp;<strong> <a id=ChildColumnList_ctl00_hylName href=ArticleClass.jsp?ClassID="+rs.getInt("ClassID")+">"+rs.getString("ClassName")+"</a></strong>");
				strClass.append("<TD></TR>");
				
			}
			}
			catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示文章分类出错！");
			System.out.println(e);
		}
		strClass.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strClass.toString();
	   
	   
   }
   public String showNav(int classID) throws Exception
   {
	   
	   //DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		StringBuffer strNav=new StringBuffer();
		String strSql="select * from  article_class where ClassID="+classID+" ";           
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs!=null&&rs.next())
			{
				strNav.append("您的位置:首页&gt;&gt;");
			    if(rs.getInt("ParentID")!=0)
			    {
			    	
			    	strNav.append(this.showParentNav(rs.getInt("ParentID")));
			    }
			    
			    String str=rs.getString("ClassName");
			    
			    strNav.append(str);
			}
			}
			catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示页面导航出错！");
			System.out.println(e);
		}
		if(rs!=null){
			
			rs.close();	
		}	
		
		conn.closeConnection();
		return strNav.toString();
	   
	   
   }
   public String showParentNav(int parentID) throws Exception
   {
	   
	   // DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		StringBuffer strNav=new StringBuffer();
		String strSql="select * from  article_class where ClassID="+parentID+" ";           
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			if(rs.next())
			{
				strNav.append(rs.getString("ClassName")+"&gt;&gt;");
				
			}
			}
			catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示新闻列表出错出错！");
			System.out.println(e);
		}
		rs.close();
		conn.closeConnection();
		return strNav.toString();
	   
   }
   public String showLDFC() throws Exception
   {
	   
	  // DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		StringBuffer strLdfc=new StringBuffer();
		String strSql="select * from  article where ClassID=101 and IncludePic=1";  
		strLdfc.append("<Table width=100% >");
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			while(rs.next())
			{
				strLdfc.append("<tr>");
				strLdfc.append("<td align=center><a href=ArticleContent.jsp?ClassID=101&ID="+rs.getInt("ArticleID")+" target=_blank><img src="+rs.getString("DefaultPicUrl")+" width=120 height=150 border=0></a> <br>"+rs.getString("Title")+"</td>");
				if(rs.next())
				  strLdfc.append("<td align=center><a href=ArticleContent.jsp?ClassID=101&ID="+rs.getInt("ArticleID")+" target=_blank><img src="+rs.getString("DefaultPicUrl")+" width=120 height=150 border=0></a> <br>"+rs.getString("Title")+"</td>");
				if(rs.next())
				  strLdfc.append("<td align=center><a href=ArticleContent.jsp?ClassID=101&ID="+rs.getInt("ArticleID")+" target=_blank><img src="+rs.getString("DefaultPicUrl")+" width=120 height=150 border=0></a> <br>"+rs.getString("Title")+"</td>");
				strLdfc.append("</tr>");
			}
			}
			catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示新闻列表出错出错！");
			System.out.println(e);
		}
		strLdfc.append("</Table>");
		rs.close();
		conn.closeConnection();
		return strLdfc.toString();
	   
	   
   }
   
   public String showNames(int ID,String className, boolean status) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select ClassName,ClassID from  article_class where ClassID in(select ClassID from article where ArticleID="+ID+")";          
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			if (rs.next()&& status)
		        {
				strNews.append("[");
				strNews.append("<SPAN class=biaoti><a class=middle href='ArticleClass.jsp?ClassID="+rs.getInt("ClassID")+"' target=_blank><FONT color=#FF0000>"+rs.getString("ClassName")+"</font></a></span>");
				strNews.append("]");			
				}  
		        
	
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("显示最新新闻出错出错！");
				System.out.println(e);
			}
			rs.close();
			conn.closeConnection();
			return strNews.toString();
	}

 //首页最新文章
	public String showNews12(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer strNews=new StringBuffer();
		//DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Status=1 and( ClassID="+ClassID+" or ClassID in(select ClassID  from article_class where ParentID="+ClassID+" ) or ClassID in(select ClassID  from article_class where ParentID in ( select ClassID  from article_class where ParentID="+ClassID+") ) ) order by ArticleID desc";
		System.out.println(strSql);
		strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=98%' align=center background=images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
       strNews.append("<TBODY>");            
		try {
			//conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next()&&n<rowNum)
			{	
				
				strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
				strNews.append("<TD height=22><SPAN class=biaoti><FONT color=#000000>");
				
				String parentID=this.queryOneClass(rs.getInt("ClassID"));
				System.out.println(parentID);
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='GxContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"&parentID="+parentID+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
				strNews.append("</SPAN></TD>");
			
				if (updateTime)
		        {
		          strNews.append("<TD height=22 width=14%><SPAN class=biaoti><FONT color=#999999>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
		        }

		        strNews.append("</TD>");
		        strNews.append("</SPAN></TD>");
		        strNews.append("</TR>");

			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错出错！");
			System.out.println(e);
			e.getStackTrace();
		}
		strNews.append("</TBODY>");
		strNews.append("</Table>");
		System.out.println("showNewsl2===="+strNews);
		rs.close();
		conn.closeConnection();
		return strNews.toString();
	}


public String showNews23(int ClassID, int rowNum, int maxChar, String className, boolean updateTime,int datewidth ,int hight ) throws Exception {
	// TODO Auto-generated method stub
	StringBuffer strNews=new StringBuffer();
	//DbConnection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	int n=0;
	String strSql="select * from  article where Status= 1 and Deleted=0 and ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") order by ArticleID desc";
	strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse  cellSpacing=0 cellPadding=0 width=98%' align=center background=images/index_jgtg_hang_bg1.gif border=0 valign=bottom>");
    strNews.append("<TBODY>");             
	try {
		//conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(strSql);
		
		
		while(rs.next()&&n<rowNum)
		{
			int ID=rs.getInt("ArticleID");
			strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
			strNews.append("<TD height="+hight+"><SPAN class=biaoti><FONT color=#000000>");
			strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='mainArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
			strNews.append("</SPAN></TD>");
			
			if (updateTime)
	        {

		          strNews.append("<TD height="+hight+" width=14%><SPAN class=biaoti><FONT color=#999999>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
	        }

	        strNews.append("</TD>");
	        strNews.append("</SPAN></TD>");
	        strNews.append("</TR>");

		n++;
		}
			
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("显示最新新闻出错出错！");
		System.out.println(e);
	}
	strNews.append("</TBODY>");
	strNews.append("</Table>");
	//System.out.println("showNews23===="+strNews);
	rs.close();
	conn.closeConnection();
	return strNews.toString();
}
public String showFlashNews11(int ClassID) throws Exception {
	StringBuffer strFlashNews=new StringBuffer();
	//DbConnection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	String imgUrl="";
	String imgtext="";
	String imgLink="";
	int n=1;
	String strSql="select * from  article where Deleted=0 and IncludePic=1 and( ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") or ClassID In (select ClassID From article_class where ParentID  in (select ClassID From article_class where ParentID="+ClassID+"))) order by ArticleID desc";
System.out.println(strSql);
	try{
	//conn=new DbConnection();
	stmt=conn.getConnection().createStatement();
	rs=stmt.executeQuery(strSql);

	if(rs.next())
	{
			rs.previous();
		while(rs.next()&&n<6)
		{ 		
		if(n==1){
		imgUrl+=""+rs.getString("DefaultPicUrl")+"";
		}else{
	
		imgUrl+="|"+rs.getString("DefaultPicUrl")+"";
		}
		if(n==1){
		imgtext+=""+rs.getString("Title")+"";
		}else{
	
		imgtext+="|"+rs.getString("Title")+"";
		}
		if(n==1){
		imgLink+="mainArticleContent.jsp?CLID="+rs.getInt("ArticleID")+"="+rs.getInt("ClassID")+"";
		}else{
		imgLink+="|mainArticleContent.jsp?CLID="+rs.getInt("ArticleID")+"="+rs.getInt("ClassID")+"";
		}
		// strFlashNews.append("imgUrl"+n+"="+rs.getString("DefaultPicUrl")+"<br>");
		// strFlashNews.append("imgtext"+n+"="+rs.getString("Title")+"<br>");
		// strFlashNews.append("imgLink"+n+"=ArticleContent.jsp?ID="+rs.getInt("ArticleID")+"&ClassID="+rs.getInt("ClassID")+"<br>");
	
	
		n++; 
		}
	}else
	{
		//System.out.print("else--------");
		imgUrl="UserFiles/Image/201012228.jpg";
		imgtext="没有图片显示";
		imgLink="#";
	}

	}catch (Exception e) {
	// TODO Auto-generated catch block
	System.out.println("显示幻灯新闻出错！");
	System.out.println(e);
	}

	strFlashNews.append(imgUrl+";");
	strFlashNews.append(imgtext+";");
	strFlashNews.append(imgLink+";");
//	System.out.println("============图片新闻==========="+strFlashNews);
	rs.close();
	conn.closeConnection();
	return strFlashNews.toString();
}
//改写读取新闻方法横着
public String showNews007(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception {
	// TODO Auto-generated method stub
	StringBuffer strNews=new StringBuffer();
	DbConnection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	int n=0;
	String strSql="select * from  article where Status= 1 and Deleted=0 and ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") order by ArticleID desc";
	
 	//strNews.append("<TBODY>");            
	try {
		conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(strSql);
		while(rs.next()&&n<rowNum)
		{
			int ID=rs.getInt("ArticleID");
		
		
			strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='mainArticleContent.jsp?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
		
		
			if (updateTime)
	        {

	          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
	        }

	      

		n++;
		}
		
		
			
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("显示最新新闻出错出错！");
		System.out.println(e);
	}
	//strNews.append("</TBODY>");
	rs.close();
	conn.closeConnection();
	return strNews.toString();
}

public String showFlashNews(int ClassID, String pageUls) throws Exception {
	StringBuffer strFlashNews=new StringBuffer();
	//DbConnection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	String imgUrl="";
	String imgtext="";
	String imgLink="";
	int n=1;
	String strSql="select * from  article where Deleted=0 and IncludePic=1 and( ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") or ClassID In (select ClassID From article_class where ParentID  in (select ClassID From article_class where ParentID="+ClassID+"))) order by ArticleID desc";
try{
	//conn=new DbConnection();
	stmt=conn.getConnection().createStatement();
	rs=stmt.executeQuery(strSql);

	if(rs.next())
	{
			rs.previous();
		while(rs.next()&&n<6)
		{ 		
		if(n==1){
		imgUrl+=rs.getString("DefaultPicUrl");
		}else{
	
		imgUrl+="|"+rs.getString("DefaultPicUrl");
		}
		if(n==1){
		imgtext+=""+rs.getString("Title")+"";
		}else{
	
		imgtext+="|"+rs.getString("Title")+"";
		}
		if(n==1){
		imgLink+=""+pageUls+"?CLID="+rs.getInt("ArticleID")+"="+rs.getInt("ClassID")+"";
		}else{
		imgLink+="|ArticleContent.jsp?CLID="+rs.getInt("ArticleID")+"="+rs.getInt("ClassID")+"";
		}
		// strFlashNews.append("imgUrl"+n+"="+rs.getString("DefaultPicUrl")+"<br>");
		// strFlashNews.append("imgtext"+n+"="+rs.getString("Title")+"<br>");
		// strFlashNews.append("imgLink"+n+"=ArticleContent.jsp?ID="+rs.getInt("ArticleID")+"&ClassID="+rs.getInt("ClassID")+"<br>");
	
	
		n++; 
		}
	}else
	{
		System.out.print("else--------");
		imgUrl="UserFiles/Image/201012228.jpg";
		imgtext="没有图片显示";
		imgLink="#";
	}

	}catch (Exception e) {
	// TODO Auto-generated catch block
	System.out.println("显示幻灯新闻出错！");
	System.out.println(e);
	}

	strFlashNews.append(imgUrl+";");
	strFlashNews.append(imgtext+";");
	strFlashNews.append(imgLink+";");
	//System.out.println("strFlashNews==============="+strFlashNews);
	rs.close();
	conn.closeConnection();
	return strFlashNews.toString();
}

public String showNews(int ClassID, int rowNum, int maxChar, String className,
		boolean updateTime, String pageUls) throws Exception {
	// TODO Auto-generated method stub
	StringBuffer strNews=new StringBuffer();
	//DbConnection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	int n=0;
	String strSql="select * from  article where Status= 1 and Deleted=0 and ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+") order by ArticleID desc";
	strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=100%' align=center background=Images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
 	//strNews.append("<TBODY>");            
	try {
		//conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(strSql);
		
		
		while(rs.next()&&n<rowNum)
		{
			int ID=rs.getInt("ArticleID");
			strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
			strNews.append("<TD height=22   ><SPAN class=biaoti><FONT color=#000000>");
			strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='"+pageUls+"?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
			strNews.append("</SPAN></TD>");
		
			if (updateTime)
	        {
	          strNews.append("<TD height=22 width=90 align=left ><SPAN class=biaoti>");
	          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
	        }

	        strNews.append("</TD>");
	        strNews.append("</SPAN></TD>");
	        strNews.append("</TR>");

		n++;
		}
			
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("显示最新新闻出错出错！");
		System.out.println(e);
	}
	//strNews.append("</TBODY>");
	strNews.append("</Table>");
	rs.close();
	conn.closeConnection();
	return strNews.toString();
}

public String showNews1(int ClassID, int rowNum, int maxChar, String className,
		boolean updateTime, String pageUls) throws Exception {
	// TODO Auto-generated method stub
	StringBuffer strNews=new StringBuffer();
	//DbConnection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	int n=0;
	String strSql="select * from  article where Status=1 and( ClassID="+ClassID+" or ClassID in(select ClassID  from article_class where ParentID="+ClassID+" ) or ClassID in(select ClassID  from article_class where ParentID in ( select ClassID  from article_class where ParentID="+ClassID+") ) ) order by ArticleID desc";
	System.out.println(strSql);
	strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=98%' align=center background=images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
    strNews.append("<TBODY>");            
	try {
		//conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(strSql);
		
		while(rs.next()&&n<rowNum)
		{
			strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
			strNews.append("<TD height=22><SPAN class=biaoti><FONT color=#000000>");
			strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='"+pageUls+"?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
			strNews.append("</SPAN></TD>");
		
			if (updateTime)
	        {
	          strNews.append("<TD height=22 width=14%><SPAN class=biaoti><FONT color=#999999>");
	          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
	        }
	        strNews.append("</TD>");
	        strNews.append("</SPAN></TD>");
	        strNews.append("</TR>");

		n++;
		}
			
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("显示最新新闻出错出错！");
		System.out.println(e);
	}
	strNews.append("</TBODY>");
	strNews.append("</Table>");
	rs.close();
	conn.closeConnection();
	return strNews.toString();
}
      //显示图片友情链接 图片竖着排放--- 单排
 public String showImgLink(int tid,String stylecss, int twith, int thight) throws Exception {
	   StringBuffer strLink=new StringBuffer();
	   DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from  friendsite  where ClassID = "+tid+" order by ClassID desc";
		strLink.append("<Table  class="+stylecss+"   >");
		try {
			conn=new DbConnection(); 
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			
			while(rs.next())
			{
				strLink.append("<tr><td>");
				strLink.append("<a href=\" "+rs.getString("SiteUrl")+" \" target='_blank'  ><img alt=\" "+rs.getString("SiteName")+"\" width=\" "+(twith-2) +"px \" height=\" "+(thight-2)+"px \" border=\"0px\" src=\""+rs.getString("LogoUrl")+"\"/>  </a>" );
		    	strLink.append("</td></tr>");
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示友情链接出错！");
			System.out.println(e);
		}
		strLink.append("</Table>");
		rs.close();
		conn.closeConnection();
	   
	   return strLink.toString();
}

 //显示图片友情链接 图片横着着排放---  自定义多少行
 public String showImgLink(int tid, int twith, int thight,int rowwidth) throws Exception {
	   StringBuffer strLink=new StringBuffer();
	   DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String strSql="select * from  friendsite  where ClassID = "+tid+" order by ClassID desc";
		strLink.append("<Table  width=\""+twith+"\"  height=\" "+thight+" \" >");
		try {
			conn=new DbConnection(); 
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);
			int i=0;
			strLink.append("<tr>");
			while(rs.next())
			{
				if(i>=rowwidth){
					
					strLink.append("</td></tr>");
					strLink.append("<tr>");
					
				}
				strLink.append("<td>");
				strLink.append("<a href=\" "+rs.getString("SiteUrl")+" \"><img alt=\" "+rs.getString("SiteName")+"\" width=\" "+(twith-2) +"px \" height=\" "+(thight-2)+"px \" border=\"0px\" src=\""+rs.getString("LogoUrl")+"\"/>  </a>" );
		    	strLink.append("</td>");
			}
			strLink.append("</tr>");	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示友情链接出错！");
			System.out.println(e);
		}
		strLink.append("</Table>");
		rs.close();
		conn.closeConnection();
	   
	   return strLink.toString();
}

 
 
//获取新闻列表的方法---新添加的新闻有提示

public String showNewsandWord(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception {
	// TODO Auto-generated method stub
	StringBuffer strNews=new StringBuffer();
	//DbConnection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	int n=0;
	String strSql="select * from  article where Status= 1 and Deleted=0 and( ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+")) order by ArticleID desc";
	strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=100%' align=center background=Images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
 	//strNews.append("<TBODY>");            
	try {
		//conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		
		rs=stmt.executeQuery(strSql);	
		Calendar cal=Calendar.getInstance();
		Date d1=cal.getTime();
		cal.add(Calendar.DATE, -1);
		Date d2=cal.getTime();
		cal.add(Calendar.DATE, -1);
		Date d3=cal.getTime();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");					
						
		
		while(rs.next()&&n<rowNum)
		{
			int ID=rs.getInt("ArticleID");
			String content =rs.getString("Content");
			String updatetimes=CharType.limitStr(rs.getString("updateTime").split(" ")[0],18);
		//	System.out.println(updatetimes.equals(sdf.format(d1)+"")||updatetimes.equals(sdf.format(d2)+"")||updatetimes.equals(sdf.format(d3)+""));
				
			
			
			if(content.startsWith("http://")){
				strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
				strNews.append("<TD height=22   ><SPAN class=biaoti><FONT color=#000000>");
				
				
				
				
				if(updatetimes.equals(sdf.format(d1)+"")||updatetimes.equals(sdf.format(d2)+"")||updatetimes.equals(sdf.format(d3)+"")){
				
				
				strNews.append("&nbsp;<img src=Inc/wordInc.png width='10px' height='10px'  boder=0>&nbsp;<a class=middle href='"+rs.getString("Content")+"' target=_blank>"
						+CharType.limitStr(rs.getString("Title"),maxChar)+"</a><img   src='Inc/NewFlag.gif'>");
			
				
				}else{
					strNews.append("&nbsp;<img src=Inc/wordInc.png width='10px' height='10px'  boder=0>&nbsp;<a class=middle href='"+rs.getString("Content")+"' target=_blank>"
							+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");	
					
					
				}
				
				
				strNews.append("</SPAN></TD>");
			
				if (updateTime)
		        {
		          strNews.append("<TD height=22 width=90 align=left ><SPAN class=biaoti>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
		        }

		        strNews.append("</TD>");
		        strNews.append("</SPAN></TD>");
		        strNews.append("</TR>");	
				
			}else{				
			strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
			strNews.append("<TD height=22   ><SPAN class=biaoti><FONT color=#000000>");
			
			
			
			
			if(updatetimes.equals(sdf.format(d1)+"")||updatetimes.equals(sdf.format(d2)+"")||updatetimes.equals(sdf.format(d3)+"")){
			
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="
						 +rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"
						 +CharType.limitStr(rs.getString("Title"),maxChar)+"</a><img   src='Inc/NewFlag.gif'>");
								
				
			}else{
				
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="
						 +rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"
						 +CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
							
				
				
			}		
			
			strNews.append("</SPAN></TD>");
		
			if (updateTime)
	        {
	          strNews.append("<TD height=22 width=90 align=left ><SPAN class=biaoti>");
	          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
	        }

	        strNews.append("</TD>");
	        strNews.append("</SPAN></TD>");
	        strNews.append("</TR>");
			}
		n++;
		}
			
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("显示最新新闻出错出错！");
		System.out.println(e);
	}
	//strNews.append("</TBODY>");
	strNews.append("</Table>");
	rs.close();
	conn.closeConnection();
	
	System.gc();
	return strNews.toString();
}

//获取全站新闻
public String showNewsAll(int ClassID, int rowNum, int maxChar, String className, boolean updateTime) throws Exception {
	// TODO Auto-generated method stub
	StringBuffer strNews=new StringBuffer();
	//DbConnection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	int n=0;
	String strSql="select * from  article where Status= 1 and Deleted=0  order by ArticleID desc";
	strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=100%' align=center background=Images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
 	//strNews.append("<TBODY>");            
	try {
		//conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		
		rs=stmt.executeQuery(strSql);	
		Calendar cal=Calendar.getInstance();
		Date d1=cal.getTime();
		cal.add(Calendar.DATE, -1);
		Date d2=cal.getTime();
		cal.add(Calendar.DATE, -1);
		Date d3=cal.getTime();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");					
						
		
		while(rs.next()&&n<rowNum)
		{
			int ID=rs.getInt("ArticleID");
			String content =rs.getString("Content");
			String updatetimes=CharType.limitStr(rs.getString("updateTime").split(" ")[0],18);
		//	System.out.println(updatetimes.equals(sdf.format(d1)+"")||updatetimes.equals(sdf.format(d2)+"")||updatetimes.equals(sdf.format(d3)+""));
				
			
			
			if(content.startsWith("http://")){
				strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
				strNews.append("<TD height=22   ><SPAN class=biaoti><FONT color=#000000>");
				
				
				
				
				if(updatetimes.equals(sdf.format(d1)+"")||updatetimes.equals(sdf.format(d2)+"")||updatetimes.equals(sdf.format(d3)+"")){
				
				
				strNews.append("&nbsp;<img src=Inc/wordInc.png width='10px' height='10px'  boder=0>&nbsp;<a class=middle href='"+rs.getString("Content")+"' target=_blank>"
						+CharType.limitStr(rs.getString("Title"),maxChar)+"</a><img   src='Inc/NewFlag.gif'>");
			
				
				}else{
					strNews.append("&nbsp;<img src=Inc/wordInc.png width='10px' height='10px'  boder=0>&nbsp;<a class=middle href='"+rs.getString("Content")+"' target=_blank>"
							+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");	
					
					
				}
				
				
				strNews.append("</SPAN></TD>");
			
				if (updateTime)
		        {
		          strNews.append("<TD height=22 width=90 align=left ><SPAN class=biaoti>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
		        }

		        strNews.append("</TD>");
		        strNews.append("</SPAN></TD>");
		        strNews.append("</TR>");	
				
			}else{				
			strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
			strNews.append("<TD height=22   ><SPAN class=biaoti><FONT color=#000000>");
			
			
			
			
			if(updatetimes.equals(sdf.format(d1)+"")||updatetimes.equals(sdf.format(d2)+"")||updatetimes.equals(sdf.format(d3)+"")){
			
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="
						 +rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"
						 +CharType.limitStr(rs.getString("Title"),maxChar)+"</a><img   src='Inc/NewFlag.gif'>");
								
				
			}else{
				
				strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='ArticleContent.jsp?ClassID="
						 +rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"
						 +CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
							
				
				
			}		
			
			strNews.append("</SPAN></TD>");
		
			if (updateTime)
	        {
	          strNews.append("<TD height=22 width=90 align=left ><SPAN class=biaoti>");
	          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
	        }

	        strNews.append("</TD>");
	        strNews.append("</SPAN></TD>");
	        strNews.append("</TR>");
			}
		n++;
		}
			
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("显示最新新闻出错出错！");
		System.out.println(e);
	}
	//strNews.append("</TBODY>");
	strNews.append("</Table>");
	rs.close();
	conn.closeConnection();
	
	System.gc();
	return strNews.toString();
}





//获取新闻列表的方法---新添加的新闻有提示

public String showNewsandWord1(int ClassID, int rowNum, int maxChar, String className, boolean updateTime,String pagename) throws Exception {
		// TODO Auto-generated method stub
		StringBuffer strNews=new StringBuffer();
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		int n=0;
		String strSql="select * from  article where Status= 1 and Deleted=0 and ( ClassID="+ClassID+" or ClassID In (select ClassID From article_class where ParentID="+ClassID+")) order by ArticleID desc";
		strNews.append("<TABLE id=AutoNumber2 class="+className+" style='BORDER-COLLAPSE: collapse cellSpacing=0 cellPadding=0 width=100%' align=center background=Images/index_jgtg_hang_bg.gif border=0 valign=bottom>");
     	//strNews.append("<TBODY>");            
		try {
			conn=new DbConnection();
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(strSql);	
			
			Calendar cal=Calendar.getInstance();
			Date d1=cal.getTime();
			cal.add(Calendar.DATE, -1);
			Date d2=cal.getTime();
			cal.add(Calendar.DATE, -1);
			Date d3=cal.getTime();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");				
							
			
			while(rs.next()&&n<rowNum)
			{
				int ID=rs.getInt("ArticleID");
				String content =rs.getString("Content");		
				
				
				if(content.startsWith("http://")){
					strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
					strNews.append("<TD height=22   ><SPAN class=biaoti><FONT color=#000000>");
					String updatetimes=CharType.limitStr(rs.getString("updateTime").split(" ")[0],18);
									
					if(updatetimes.equals(sdf.format(d1)+"")||updatetimes.equals(sdf.format(d2)+"")||updatetimes.equals(sdf.format(d3)+"")){
										strNews.append("&nbsp;<img src=Inc/wordInc.png width='10px' height='10px'  boder=0>&nbsp;<a class=middle href='"+rs.getString("Content")+"' target=_blank>"
								+CharType.limitStr(rs.getString("Title"),maxChar)+"</a><img   src='Inc/NewFlag.gif'>");
						
					}else{
						strNews.append("&nbsp;<img src=Inc/wordInc.png width='10px' height='10px'  boder=0>&nbsp;<a class=middle href='"+rs.getString("Content")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
					}			
					
					strNews.append("</SPAN></TD>");					
				
					if (updateTime)
			        {
			          strNews.append("<TD height=22 width=90 align=left ><SPAN class=biaoti>");
			          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
			        }

			        strNews.append("</TD>");
			        strNews.append("</SPAN></TD>");
			        strNews.append("</TR>");	
					
				}else{				
				strNews.append("<TR background=images/index_jgtg_hang_bg.gif>");
				strNews.append("<TD height=22   ><SPAN class=biaoti><FONT color=#000000>");
				
				
				String updatetimes=CharType.limitStr(rs.getString("updateTime").split(" ")[0],18);
				
				if(updatetimes.equals(sdf.format(d1)+"")||updatetimes.equals(sdf.format(d2)+"")||updatetimes.equals(sdf.format(d3)+"")){
					strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='"+pagename+"?ClassID="
					+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"
					+CharType.limitStr(rs.getString("Title"),maxChar)+"</a><img   src='Inc/NewFlag.gif'>");
						
					
				}else{
					
					strNews.append("&nbsp;<img src=Images/ar_org.gif boder=0>&nbsp;<a class=middle href='"+pagename+"?ClassID="+rs.getInt("ClassID")+"&ID="+rs.getInt("ArticleID")+"' target=_blank>"+CharType.limitStr(rs.getString("Title"),maxChar)+"</a>");
						
					
				}
				
				
					strNews.append("</SPAN></TD>");
			
				if (updateTime)
		        {
		          strNews.append("<TD height=22 width=90 align=left ><SPAN class=biaoti>");
		          strNews.append(CharType.limitStr(rs.getString("updateTime").split(" ")[0],18));
		        }

		        strNews.append("</TD>");
		        strNews.append("</SPAN></TD>");
		        strNews.append("</TR>");
				}
			n++;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("显示最新新闻出错出错！");
			System.out.println(e);
		}
		//strNews.append("</TBODY>");
		strNews.append("</Table>");
		
		rs.close();
		conn.closeConnection();
		System.gc();
		return strNews.toString();
	}
public List<ArticleClass> getClassList(int ParentID) throws Exception {
	// TODO Auto-generated method stub
	
	Statement stmt=null;
	ResultSet rs=null;
	
	String strSql="select * from  article_class where  ParentID="+ParentID+" ";   
	List<ArticleClass>  list=new ArrayList<ArticleClass>();
	
	try {
		//conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(strSql);
		while(rs.next())
		{	
			ArticleClass ac=new ArticleClass();
			ac.setClassID(Integer.parseInt(rs.getString("ClassID")));
			ac.setClassName(rs.getString("ClassName"));
			list.add(ac);
			
		}
		}
		catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("显示文章分类出错！");
		System.out.println(e);
	}
	
	if(rs!=null){
		
		rs.close();	
	}
	
	
	conn.closeConnection();	
	return list;
}




	
}
