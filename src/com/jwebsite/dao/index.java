/**
 * 
 */
package com.jwebsite.dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;
import com.jwebsite.dao.AdminDao;
import com.jwebsite.pub.DbConnection;
import com.jwebsite.vo.Admin;
import com.jwebsite.vo.OnDuty;
/**
 * @author Administrator
 *
 */
public class index {

	/**
	 * 
	 */
	
	public index() {
		// TODO Auto-generated constructor stub
	}
	
	public static String getTitle(int id,String erjiname) throws SQLException
	{
		if(id==0)
		{
			return "";
		}
		String sql="select * from article_class where ParentID="+id+"";
		DbConnection conn=new DbConnection();
		Statement stmt=null;
		Statement stmt1=null;
		ResultSet rs=null;
		ResultSet rs1=null;
		conn=new DbConnection();
		
		stmt=conn.getConnection().createStatement();
		
		
		stmt1=conn.getConnection().createStatement();
		rs=stmt.executeQuery(sql);
		String strReturn="";
		//调整教务处一级菜单样式
		if(id==259){
			strReturn+="<div class=\"navv2\"><div class=\"navvinner2\"><ul class=\"navvlist2\"><li><a href=\"http://www.lzre.edu.cn\">学院首页</a></li>" ;
		}else{
			strReturn+="<div class=\"nav\"><div class=\"navinner\"><ul class=\"navlist\"><li><a href=\"http://www.lzre.edu.cn\">学院首页</a></li>" ;
		}
		int i=1;
		while(rs.next())
		{	
			if(i==1 && ( rs.getInt("ParentID")== 724 || rs.getInt("ParentID")== 240 || rs.getInt("ParentID")== 280 || rs.getInt("ParentID")== 282 || rs.getInt("ParentID")== 283 || rs.getInt("ParentID")== 284 || rs.getInt("ParentID")== 285 || rs.getInt("ParentID")== 287 || rs.getInt("ParentID")== 288 || rs.getInt("ParentID")== 678))
		{
			strReturn+="<li><a   href=index.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		
			
		}
		
		else if(i==1 && (rs.getInt("ParentID")==823))
		{
			strReturn+="<li><a   href=zsgzc.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==218))
		{
			strReturn+="<li><a   href=Dwgzb.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==273))
		{
			strReturn+="<li><a   href=Xsgzc.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==230))
		{
			strReturn+="<li><a   href=Rszzb.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==248))
		{
			strReturn+="<li><a   href=Xybgs.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==259))
		{
			strReturn+="<li><a   href=jwc.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==281))
		{
			strReturn+="<li><a   href=ygh.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==286))
		{
			strReturn+="<li><a   href=tsg.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==688))
		{
			strReturn+="<li><a   href=ztw.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==289 || rs.getInt("ParentID")==293))
		{
			strReturn+="<li><a   href=xyyxNew.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==292 || rs.getInt("ParentID")==293))
		{
			strReturn+="<li><a   href=xyyxNew.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==290))
		{
			strReturn+="<li><a   href=dzgcx.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==293))
		{
			strReturn+="<li><a   href=xyyxNew.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==688 || rs.getInt("ParentID")==938 || rs.getInt("ParentID")==938
				|| rs.getInt("ParentID")==938 || rs.getInt("ParentID")==938 || rs.getInt("ParentID")==938
				|| rs.getInt("ParentID")==938))
		{
			strReturn+="<li><a   href=start.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}
		else if(i==1 && (rs.getInt("ParentID")==711))
		{
			strReturn+="<li><a   href=jpkc.jsp?titleid="+rs.getInt("ParentID")+">本站首页</a></li>";
		}

		
		i++;	
			if(rs.getString("ClassName").indexOf("首页")>0){continue;}

			if(id==259&&rs.getString("ClassName").indexOf("教务动态")==0){continue;}

			if(id==259&&rs.getString("ClassName").indexOf("高职动态")==0){continue;}
			
			if(id==1050&&rs.getString("ClassName").indexOf("课程描述")==0){continue;}
			if(id==1050&&rs.getString("ClassName").indexOf("教学效果")==0){continue;}
			if(id==259&&rs.getString("ClassName").indexOf("通知公告")==0){continue;}
			//教学督导的师生互动栏目
			if(rs.getString("ClassName").indexOf("师生互动")==0){
				strReturn+="<li><a href='SendMessage.jsp' id=\"nav_"+i+"\" >网络评教</a></li> ";
				
				continue;}
		//	System.out.println(rs.getString("ClassName")+"---------============"+id);
			
			strReturn+="<li>";
			rs1=stmt1.executeQuery("select * from article_class where ParentID="+rs.getInt("ClassID")+"");
		
			
			if(rs1.next())
			{
				
				strReturn+="<a href='"+erjiname+"?ClassID="+rs.getInt("ClassID")+"' id=\"nav_"+i+"\" onmouseover=\"showMenu('nav_"+i+"','subnav"+i+"')\">"+rs.getString("ClassName").toString()+"</a>";
				strReturn+="<div class=\"subnav disable\" id=\"subnav"+i+"\">";
				strReturn+="<p class=\"pointer\">.</p>";
				strReturn+="<p><span>";
				//教务处教务管理系统
				
				if(id==259&&rs1.getString("ClassName").indexOf("教务管理系统")==0){
					//strReturn+="<li><a href='http://59.76.130.251/' id=\"nav_"+i+"\" >教务管理系统</a></li> ";
                   //strReturn+="<div class=\"subnav disable\" id=\"subnav3\"><p class=\"pointer\">.</p><p><span><a href=http://59.76.130.251/> &nbsp;教务管理系统</a>";
					strReturn+="<a href=\"http://59.76.130.251/\"> &nbsp;"+rs1.getString("ClassName").toString()+"</a>";
				}else if(id==230&&rs1.getString("ClassName").indexOf("职称管理")==0)
				{
				    strReturn+="<a href=\"http://www.baidu.com/\"> &nbsp;"+rs1.getString("ClassName").toString()+"</a>";
						
				}else{ 
					strReturn+="<a href="+erjiname+"?ClassID="+rs.getInt("ClassID")+"> &nbsp;"+rs1.getString("ClassName").toString()+"</a>";
						
					}
				rs1.first();
			}
			else
			{
				if(id==688&&rs.getString("ClassName").indexOf("申报材料")==0){
					strReturn+="<li><a href='http://www.lzre.gs.edu.cn/ggsb/index.asp' id=\"nav_"+i+"\" >"+rs.getString("ClassName").toString()+"</a></li> ";
					
					}else{	
				strReturn+="<a href='"+erjiname+"?ClassID="+rs.getInt("ClassID")+"' id=\"nav_"+i+"\" >"+rs.getString("ClassName").toString()+"</a> ";
					}
			}
			while(rs1.next())
			{
				strReturn+="<a href='"+erjiname+"?ClassID="+rs1.getInt("ClassID")+"'> | "+rs1.getString("ClassName").toString()+"</a>";
			}
			rs1.first();
			if(rs1.next())
			{
				strReturn+="</p></span>";
				strReturn+="</div> ";
				strReturn+="</li> ";
			}
			
			//strReturn+=" |  <a href="+erjiname+"?ClassID="+rs.getInt("ClassID")+"> &nbsp;"+rs.getString("ClassName").toString()+"</a> ";
		}
		strReturn+="</ul></div>  </div>";
		rs.close();
		rs1.close();
		conn.closeConnection();
		return strReturn;
	}
	
	public static String getTitleTwo(int id,String erjiname) throws SQLException
	{
		if(id==0)
		{
			return "";
		}
		String sql="select * from article_class where ParentID="+id+"";
		DbConnection conn=new DbConnection();
		Statement stmt=null;
		Statement stmt1=null;
		ResultSet rs=null;
		ResultSet rs1=null;
		conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		stmt1=conn.getConnection().createStatement();
		rs=stmt.executeQuery(sql);
		String strReturn="<div class=\"nav\"><div class=\"navinner\"><ul class=\"navlist\"><li><a href=\"#\">首页</a></li>";
		int i=1;
		while(rs.next())
		{
			if(rs.getString("ClassName").indexOf("首页")>0){continue;}
			strReturn+="<li>";
			rs1=stmt1.executeQuery("select * from article_class where ParentID="+rs.getInt("ClassID")+"");
			if(rs1.next())
			{
				strReturn+="<a href='"+erjiname+"?ClassID="+rs.getInt("ClassID")+"' id=\"nav_"+i+"\" onmouseover=\"showMenu('nav_"+i+"','subnav"+i+"')\">"+rs.getString("ClassName").toString()+"</a>";
				strReturn+="<div class=\"subnav disable\" id=\"subnav"+i+"\">";
				strReturn+="<p class=\"pointer\">.</p>";
				strReturn+="<p><span>";
				rs1.first();
			}
			else
			{
				strReturn+="<a href='"+erjiname+"?ClassID="+rs.getInt("ClassID")+"' id=\"nav_"+i+"\" >"+rs.getString("ClassName").toString()+"</a>";
				
			}
			
			
			while(rs1.next())
			{
				strReturn+="<a href='"+erjiname+"?ClassID="+rs1.getInt("ClassID")+"'>"+rs1.getString("ClassName").toString()+"</a> |";
			}
			rs1.first();
			if(rs1.next())
			{
				strReturn+="</p></span>";
				strReturn+="</div> ";
				strReturn+="</li> ";
			}
			i++;
			//strReturn+=" |  <a href="+erjiname+"?ClassID="+rs.getInt("ClassID")+"> &nbsp;"+rs.getString("ClassName").toString()+"</a> ";
		}
		strReturn+="</ul></div>  </div>";
		System.out.println(strReturn);
		rs.close();
		rs1.close();
		conn.closeConnection();
		
		return strReturn;
	}

	public static String getTitle1(int id) throws SQLException
	{
		if(id==0)
		{
			return "";
		}
		String sql="select ClassName from article_class where ClassID="+id+"";
		DbConnection conn=new DbConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		
		
		rs=stmt.executeQuery(sql);
		String strReturn="";
		while(rs.next())
		{
			strReturn+=rs.getString("ClassName");
		}
		rs.close();
		
		conn.closeConnection();
		return strReturn;
	}
	public static ResultSet getCJ(String key,String key2,String state) throws SQLException
	{
		
		String sql="select * from chengji where 1=1 ";
		if(!key.equals(""))
		{
			sql+=" and kaoNo="+key+" ";
			
		} 
		if(!key2.equals(""))
			{
				sql+=" and stuNo="+key2+" ";
			}
				
		if(!state.equals(""))
		{
			sql+=" and state="+state+" ";
			
		}
		sql+="order by id";
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		System.out.println(sql);
		rs=stmt.executeQuery(sql);
		return rs;
	}
	
	public static ResultSet getCJ2(String key,String key2,String state) throws SQLException
	{
		
		String sql="select * from jwc where 1=1 ";
		if(!key.equals(""))
		{
			sql+=" and kaoNo="+key+" ";
			
		} 
//		if(!key2.equals(""))
//			{
//				sql+=" and stuNo="+key2+" ";
//			}
				
		if(!state.equals(""))
		{
			sql+=" and state="+state+" ";
			
		}
		sql+="order by id";
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		System.out.println(sql);
		rs=stmt.executeQuery(sql);
		return rs;
	}
	
	
	/**
	 * 站内搜索
	 * @param id
	 * @param erjiname
	 * @return
	 * @throws SQLException
	 */
	public static ResultSet getTitle4(String name) throws SQLException
	{
	
		String sql="select * from article where Deleted=0  order by ArticleID desc ";
		if(name!=null&&!name.equals("")){
	  
			sql="select * from article where Deleted=0 and  Title like '%"+name+"%' or  Keyword like '%"+name+"%' order by ArticleID desc ";
				
			
		}

		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		System.out.println(sql);
		rs=stmt.executeQuery(sql);
		return rs;
	}
	
	/**
	 * 查询网站当前访问量
	 * @param name
	 * @param erjiname
	 * @return
	 * @throws SQLException
	 */
	public static String getHits(String name,String id) throws SQLException
	{
	
		String sql="select hits,labelName from label where labelDo ='hit' and labelName='"+name+"' and articleclassid="+id;
		
		System.out.println(sql);
		
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(sql);
		String hit="";
		while(rs.next()){
			hit=rs.getString("hits");
		}
		rs.close();
	
		conn.closeConnection();
		return hit;
	}
	/**
	 * 查询网站当前访问量
	 * @param name
	 * @param erjiname
	 * @return
	 * @throws SQLException
	 */
	public static String getSendMessage(String id) throws SQLException
	{
		DbConnection conn=new DbConnection();
		String sql="select * from sendmessage order by deptid ";
//		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
//		conn=new DbConnection();
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(sql);
		StringBuffer sm=new StringBuffer("<option value='-1' >请选择所属部门</option>");
		while(rs.next()){
		//	System.out.println(id+"====="+rs.getString("deptid"));
			if (id!=null&&id.equals(rs.getString("deptid"))) {
				sm.append("<option value='"+rs.getString("deptid")+"' selected >"+rs.getString("deptname")+"</option>");
				
			}else {
				sm.append("<option value='"+rs.getString("deptid")+"'   >"+rs.getString("deptname")+"</option>");
				
			}
			
		}
		rs.close();
		
		conn.closeConnection();
		return sm.toString();
	}
	/**
	 * 查询网站当前访问量
	 * @param name
	 * @param erjiname
	 * @return
	 * @throws SQLException
	 */
	public static String getMessage(String id) throws SQLException
	{
		DbConnection conn=new DbConnection();
		String sql="select * from sendmessage order by deptid ";

		Statement stmt=null;
		ResultSet rs=null;
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(sql);
		StringBuffer sm=new StringBuffer("<option value='-1' >请选择所属部门</option>");
		while(rs.next()){
			if (id!=null&&id.equals(rs.getString("deptid"))) {
				sm.append("<option value='"+rs.getString("deptid")+"' selected=selected >"+rs.getString("deptname")+"</option>");
				
			}else {
				sm.append("<option value='"+rs.getString("deptid")+"'   >"+rs.getString("deptname")+"</option>");
				
			}
			
		}
		rs.close();
		
		conn.closeConnection();
		return sm.toString();
	}
	
	/**
	 * 查询申报栏目的详情
	 * @param name
	 * @param erjiname
	 * @return
	 * @throws SQLException 
	 * @throws SQLException
	 */
	public static String getSendMessageInfo(String time,int tid) throws SQLException{
		String sql="select * from sendmessage  order by fenshu desc ";
		DbConnection conn=new DbConnection();
		Statement stmt=null;
		ResultSet rs=null;
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(sql);
		StringBuffer sm=new StringBuffer();

		String[][] arrStr=new String[100][2];
		 int[] arr=new int[100];
		 String[] s=null;
		 int cou=0;
		 String strfs="";
		 
		while(rs.next()){
			
		//sm.append(rs.getString("deptid")+",");
			String str="<tr>"+getArcitleNum(rs.getString("deptid"),time,tid)+" </tr>";

			
//			sm.append("<tr><td>"+rs.getString("deptname")+"</td>"+getArcitleNum(rs.getString("deptid"),time)+" </tr>");
			
			String str2="<tr><td>"+(cou+1)+"</td><td>"+rs.getString("deptname")+"</td>"+getArcitleNum(rs.getString("deptid"),time,tid)+" </tr>";

			//System.err.println(">>>>>>>>>"+str2);
			strfs +=str2;
			
			String[] ss=str.split("<tr><td>");
			for (int i = 0; i < ss.length; i++) {
					String[] s2=ss[1].split("<td>");
					for (int j = 0; j < s2.length; j++) {
						if(j==1){
							
							arr[cou]=Integer.parseInt(s2[0].split("</td>")[0]);
							arrStr[cou][0]=s2[0].split("</td>")[0];
							arrStr[cou][1]=str2;
						}
						
					}
			}
			cou++;
//		sm.append(getArcitleNum(rs.getString("deptid"))+""+rs.getString("deptname"));
		}
//		sm.append("0");
	
		Arrays.sort(arr);
		
		int sts=1;
		for(int i=99;i>0;i--){
			String t=""+arr[i];
			for(int j2=0;j2<100;j2++){

			if(!t.equals("0")&&t.equals(arrStr[j2][0])){
				
				String sumcou=  arrStr[j2][1];
				sumcou=sumcou.substring(sumcou.indexOf("</td>"));
				
				
				sumcou="<tr><td>"+sts+""+sumcou;
				//System.out.println(sumcou);
				sm.append(sumcou);
				sts++;
			}
			}
		}
		
		rs.close();
		
		conn.closeConnection();
		
		return strfs;
	}
		
	/**
	 * 查询申报栏目的详情----------区分部门和县区
	 * @param time
	 * @param tid
	 * @param type
	 * @return
	 * @throws SQLException
	 */
	public static String getSendMessageInfo(String time,int tid,int type ) throws SQLException{
		String sql="select * from sendmessage where deptqy like '%"+type+"%'  order by fenshu desc ";
		DbConnection conn=new DbConnection();
		Statement stmt=null;
		ResultSet rs=null;
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(sql);
		StringBuffer sm=new StringBuffer();

		String[][] arrStr=new String[100][2];
		 int[] arr=new int[100];
		 String[] s=null;
		 int cou=0;
		 String strfs="";
		 
		while(rs.next()){
			
			System.out.println("得到县区部门信息");
			
		//sm.append(rs.getString("deptid")+",");
			String str="<tr>"+getArcitleNum(rs.getString("deptid"),time,tid)+" </tr>";

			
//			sm.append("<tr><td>"+rs.getString("deptname")+"</td>"+getArcitleNum(rs.getString("deptid"),time)+" </tr>");
			
			String str2="<tr><td>"+(cou+1)+"</td><td>"+rs.getString("deptname")+"</td>"+getArcitleNum(rs.getString("deptid"),time,tid)+" </tr>";

			//System.err.println(">>>>>>>>>"+str2);
			strfs +=str2;
			
			String[] ss=str.split("<tr><td>");
			for (int i = 0; i < ss.length; i++) {
					String[] s2=ss[1].split("<td>");
					for (int j = 0; j < s2.length; j++) {
						if(j==1){
							
							arr[cou]=Integer.parseInt(s2[0].split("</td>")[0]);
							arrStr[cou][0]=s2[0].split("</td>")[0];
							arrStr[cou][1]=str2;
						}
						
					}
			}
			cou++;
//		sm.append(getArcitleNum(rs.getString("deptid"))+""+rs.getString("deptname"));
		}
//		sm.append("0");
	
		Arrays.sort(arr);
		
		int sts=1;
		for(int i=99;i>0;i--){
			String t=""+arr[i];
			for(int j2=0;j2<100;j2++){

			if(!t.equals("0")&&t.equals(arrStr[j2][0])){
				
				String sumcou=  arrStr[j2][1];
				sumcou=sumcou.substring(sumcou.indexOf("</td>"));
				
				
				sumcou="<tr><td>"+sts+""+sumcou;
				//System.out.println(sumcou);
				sm.append(sumcou);
				sts++;
			}
			}
		}
		
		rs.close();
		
		conn.closeConnection();
		
		return strfs;
	}
	
	
	
	
	/**
	 * 查询申报栏目的详情
	 * @param name
	 * @param erjiname
	 * @return
	 * @throws SQLException 
	 * @throws SQLException
	 */
	public static String getArcitleNum(String sm,String time,int tid) throws SQLException{
		//根据申报栏目查询管理员
//		String sql2="select * from admin where sendMessageid in ( "+sm+" )  order by ID ";
		
		String sql2="select * from admin where sendMessageid="+sm+" order by ID ";
		DbConnection conn=new DbConnection();
		Statement stmt2=null;
		ResultSet rs2=null;
		stmt2=conn.getConnection().createStatement();
		rs2=stmt2.executeQuery(sql2);
		StringBuffer admin=new StringBuffer();
		StringBuffer adminName=new StringBuffer();
		while(rs2.next()){
		admin.append(rs2.getString("id")+",");
		adminName.append("'"+rs2.getString("AdminName")+"',");
		}
		admin.append("0");
		adminName.append("'0'");
		
		
		//
		GregorianCalendar gc = new GregorianCalendar();
		String nowDateTime = Integer.toString(gc
				.get(GregorianCalendar.YEAR))
				+ "-"
				+ Integer.toString(gc.get(GregorianCalendar.MONTH) + 1);
		String nowDateYear = Integer.toString(gc
				.get(GregorianCalendar.YEAR));
		String arctileUpdateYear;
		String arctileUpdateMonth;
		String arctileClass=getParentID(tid,0);
		String arctileClass2=arctileClass.substring(0,arctileClass.length()-2);
		String sql3="select * from Article where inputer in ("+adminName+") and ClassID in ( "+arctileClass2+" ) order by ArticleID ";
		System.out.println(sql3);
		Statement stmt3=null;
		ResultSet rs3=null;
		stmt3=conn.getConnection().createStatement();
		rs3=stmt3.executeQuery(sql3);
		StringBuffer arctile=new StringBuffer();
		int cols=0;
		int throwCols=0;
		int noThrowCols=0;
		while(rs3.next()){
			arctile.append(rs3.getString("title")+",");
			
			String[] updatetime=rs3.getString("updateTime").split("-");
			arctileUpdateYear=updatetime[0];
			arctileUpdateMonth=updatetime[1];
			if(time.equals("Month")&&nowDateTime.equals(arctileUpdateYear+"-"+arctileUpdateMonth)){
				cols+=rs3.getInt("num");
				if(rs3.getInt("status")==1){
					throwCols++;
				}
				noThrowCols++;
			}else if(time.equals("Year")&&nowDateYear.equals(arctileUpdateYear)){
				cols+=rs3.getInt("num");
				if(rs3.getInt("status")==1){
					throwCols++;
				}
				noThrowCols++;
			}
			
		
		}
		arctile.append("0");
		rs2.close();
		rs3.close();
		conn.closeConnection();
	return "<td>"+throwCols+"</td>"+"<td>"+noThrowCols+"</td>";
	}

	static DbConnection conn=new DbConnection();
	/**
	 * 
	 * @param classID当前页面tid
	 * @param parentID所需要得到父类id
	 * @return
	 * @throws SQLException
	 */
	public static String getParentID(int classID,int parentID) throws SQLException
	{
		String sql="select * from article_class where classID="+classID;
		Statement stmt=null;
		ResultSet rs=null;
		String reStr="";
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			if(rs.getInt("ClassID")==parentID)
				reStr+=rs.getInt("ClassID")+",";
				reStr=getChilenID(rs.getInt("ClassID"),rs.getInt("ClassID"),reStr)+",";
				
		}
	
		return reStr;
	}
	/**
	 * 获取子类的父类
	 * @param classID
	 * @param backID应该返回的ID
	 * @return
	 * @throws SQLException
	 */
	public static String getChilenID(int classID,int ParentID,String reStr) throws SQLException
	{
		String sql="select * from article_class where ParentID="+classID;
		ResultSet rs=null;
		Statement stmt=null;
		stmt=conn.getConnection().createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			if(rs.getInt("ClassID")!=ParentID)
				reStr+=rs.getInt("ClassID")+",";
				
			reStr=getChilenID(rs.getInt("ClassID"),rs.getInt("ClassID"),reStr);
			
		}
		
		return reStr;
	}
	//p
	public static String ShowDcxx(String width,String heigth)throws SQLException{
		StringBuffer strb=new StringBuffer();
		String str="";
		String sql="select * from dcxx";
		ResultSet rs=null;
		Statement stmt=null;
		try {
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(sql);
			strb.append("<table width='"+width+"' height='"+heigth+"'>");	
			
			while (rs.next()) {
			strb.append("<tr>");	
			
			strb.append("<td>"+rs.getString("dcxx")+"</td>");	
			strb.append("<td>"+rs.getString("df")+"</td>");	
			strb.append("<td>"+rs.getString("ly")+"</td>");	
			strb.append("<td>"+rs.getString("sb")+"</td>");	
			strb.append("</tr>");	
				
			}
			strb.append("</table>");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return str+strb;
	}
	
	public static OnDuty showOnDuty()throws SQLException{
		
		Date d=new Date();		
		SimpleDateFormat sdf = new SimpleDateFormat("dd");
		
		OnDuty ODt=new OnDuty();
		String sql="select * from onduty where date ='"+sdf.format(d)+"';";
		ResultSet rs=null;
		Statement stmt=null;
		try {
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(sql);	
			
			while (rs.next()) {				
					
					ODt.setId(Integer.parseInt(rs.getString("Id")));
					ODt.setDate(rs.getString("date"));
					ODt.setDutyManager(rs.getString("dutyManager"));
					ODt.setDutyDept1(rs.getString("dutydept1"));
					ODt.setDutyDept2(rs.getString("dutydept2"));
					ODt.setDutyDept3(rs.getString("dutydept3"));
					ODt.setDutyDept4(rs.getString("dutydept4"));				
				};	
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return ODt;
	}
	
	
	
	public static void main(String[] args) {
		try {
			System.out.println(getParentID(1639,0));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

