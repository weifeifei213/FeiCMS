package com.jwebsite.daoimpl;

import java.sql.*;
import java.util.*;
import com.jwebsite.dao.*;
import com.jwebsite.pub.*;
import com.jwebsite.vo.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ArticleClassDaoImpl implements ArticleClassDao {
	// 删除分类
	public void delClass(int classID) throws Exception{
		DbConnection conn=new DbConnection();
		Statement stmt=null;
	    String strSql="delete from site_class where ClassID="+classID+"";
	    try {
			
			stmt=conn.getConnection().createStatement();
			stmt.execute(strSql);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("删除文章分类发生错误！");
			System.out.println(e);
		}
	 //   conn.closeConnection();
		
	}
	// 查询一条
	public ResultSet queryByID(int classID) throws Exception
	{
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
	    String strSql="select ParentID,ClassName,ClassDir,Readme from site_class where ClassID="+classID+"";
	    try{
	    	conn=new DbConnection();
	    	stmt=conn.getConnection().createStatement();
	    	rs=stmt.executeQuery(strSql);
	    	
	    }
		catch(Exception ex)
		{
			System.out.println("查询分类发生错误！");
			System.out.println(ex);
			
		}
		return rs;
		
	}
//	 查询一条
	public String  queryClassNameByID(int classID) throws Exception
	{
		DbConnection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String className="";
	    String strSql="select ClassName from site_class where ClassID="+classID+"";
	    try{
	    	 conn=new DbConnection();
	    	stmt=conn.getConnection().createStatement();
	    	rs=stmt.executeQuery(strSql);
	    	if(rs.next())
	    	{
	    		className=rs.getString("ClassName");
	    		
	    	}
	    	
	    }
		catch(Exception ex)
		{
			System.out.println("查询分类发生错误！");
			System.out.println(ex);
			
		}
		rs.close();
		conn.closeConnection();
		return className;
		
	}
	//更新记录
	public void updateClass(ArticleClass articleClass) throws Exception
	{
		DbConnection conn=null;
		PreparedStatement pstmt=null;
	    String strSql="update site_class set ClassName=?,ParentID=?,ClassDir=?,Readme=?  where ClassID=?";
	    try {
	    	conn=new DbConnection();
			pstmt=conn.getConnection().prepareStatement(strSql);
			pstmt.setString(1, articleClass.getClassName());
			pstmt.setInt(2, articleClass.getParentID());
			pstmt.setString(3, articleClass.getClassDir());
			pstmt.setString(4, articleClass.getReadme());
			pstmt.setInt(5,articleClass.getClassID());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("更新文章分类发生错误！");
			System.out.println(e);
		}
	    conn.closeConnection();
		
	}
	// 添加分类
	public void insertClass(ArticleClass articleClass) throws Exception {
		// TODO Auto-generated method stub
		DbConnection conn = null;
		PreparedStatement pstmt = null;
		String strSql = "insert into site_class (ParentID,ClassName,Depth,ClassDir,Readme) values (?,?,?,?,?)";
		try {
			conn = new DbConnection();
			pstmt = conn.getConnection().prepareStatement(strSql);
			pstmt.setInt(1, articleClass.getClassID());
			pstmt.setString(2, articleClass.getClassName());
			pstmt.setInt(3, articleClass.getDepth());
			pstmt.setString(3, articleClass.getClassDir());
			pstmt.setString(4, articleClass.getReadme());
			pstmt.executeUpdate();
			pstmt.close();
            conn.closeConnection();
		} catch (Exception ex) {
			System.out.println("添加文章分类出错" + strSql + ex.getMessage());

		}

	}

	// 显示顶级类
	public String showAllTopClass() throws Exception {
		DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer showClass = new StringBuffer();
		String strSql = "select ClassName,ClassID from site_class where Depth=0";
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {			
					showClass.append("<a href=Admin_Article_List.jsp?Action=Search&ClassID="+rs.getString("ClassID")+">"+rs.getString("ClassName")+"</a>&nbsp;|&nbsp;");
				
			}

		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + strSql + ex.getMessage());

		}
		rs.close();
		conn.closeConnection();
		return showClass.toString();

	}
	//显示顶级类 指定页面
	public String showAllTopClassByPage(String pageurl) throws Exception {
			DbConnection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			StringBuffer showClass = new StringBuffer();
			String strSql = "select ClassName,ClassID from site_class where Depth=0";
			try {
				conn = new DbConnection();
				stmt = conn.getConnection().createStatement();
				rs = stmt.executeQuery(strSql);
				while (rs.next()) {			
						showClass.append("<a href="+pageurl+"?Action=Search&ClassID="+rs.getString("ClassID")+">"+rs.getString("ClassName")+"</a>&nbsp;|&nbsp;");
					
				}

			} catch (Exception ex) {
				System.out.println("检索文章分类出错" + strSql + ex.getMessage());

			}
			rs.close();
			conn.closeConnection();
			return showClass.toString();

		}

	//显示栏目
	public String queryAllTop(int parentID, int classID) throws Exception {
		DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer showClass = new StringBuffer();
		String strNbsp = "";
		
		String strSql = "select ClassName,ClassID from site_class where ParentID="
				+ parentID + " ";
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				if (classID == rs.getInt("ClassID")) {
					showClass.append("<option value=" + rs.getInt("ClassID")
							+ " selected>" + rs.getString("ClassName")
							+ "</option>");
				} else {
					showClass.append("<option value=" + rs.getInt("ClassID")
							+ " >" + rs.getString("ClassName") + "</option>");
				}
				showClass.append(queryAllChild(rs.getInt("ClassID"), classID,
						strNbsp));
			}

		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + strSql + ex.getMessage());

		}
		rs.close();
		conn.closeConnection();
		return showClass.toString();

	}

	public String queryAllChild(int parentID, int classID, String strNbsp)
			throws Exception {
		DbConnection conn = null;
		Statement stmt = null;
		StringBuffer showChildClass = new StringBuffer();
		ResultSet rsChild = null;
		strNbsp = strNbsp + "&nbsp;&nbsp;";

		int i = 1;
		String strSql = "select ClassName,ClassID from site_class where ParentID="
				+ parentID + " ";
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rsChild = stmt.executeQuery(strSql);
			// System.out.println(strNbsp);
			while (rsChild.next()) {

				if (classID == rsChild.getInt("ClassID")) {
					showChildClass.append("<option value="
							+ rsChild.getInt("ClassID") + " selected>"
							+ strNbsp + "└" + rsChild.getString("ClassName")
							+ "</option>");
				} else {
					showChildClass.append("<option value="
							+ rsChild.getInt("ClassID") + " >" + strNbsp + "└"
							+ rsChild.getString("ClassName") + "</option>");
				}

				showChildClass.append(queryAllChild(rsChild.getInt("ClassID"),
						classID, strNbsp));

			}

		} catch (Exception ex) {

			System.out.println("检索子类出错" + strSql + ex);
		}
		rsChild.close();
        conn.closeConnection();
		return showChildClass.toString();
	}

	
	//显示栏目
	public String queryAllTop(int parentID, int classID,int adminid) throws Exception {
		DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer showClass = new StringBuffer();
		String strNbsp = "";
		Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(adminid);
		String[] inserts=admin.getArrClass_Input().split(",");
		
		String strSql = "select ClassName,ClassID from site_class where ParentID="
				+ parentID + " ";
		if(inserts.length>0&&admin.getPurview()!=1)
		{
		strSql+=" and ( 1=2 ";
			
		strSql+=" or ( 1=2 ";
			for(int i=0;i<inserts.length;i++)
			{
				strSql+=" or ClassID="+inserts[i];
			}
			strSql+=")";
		}	
		System.out.println("  查询文章栏目   "+strSql);		
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				if (classID == rs.getInt("ClassID")) {
					showClass.append("<option value=" + rs.getInt("ClassID")
							+ " selected>" + rs.getString("ClassName")
							+ "</option>");
				} else {
					showClass.append("<option value=" + rs.getInt("ClassID")
							+ " >" + rs.getString("ClassName") + "</option>");
				}
				showClass.append(queryAllChild(rs.getInt("ClassID"), classID,
						strNbsp,adminid));
			}

		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + strSql + ex.getMessage());

		}
		rs.close();
		conn.closeConnection();
		System.out.println(strSql);
		return showClass.toString();

	}

	public String queryAllChild(int parentID, int classID, String strNbsp,int adminid)
			throws Exception {
		DbConnection conn = null;
		Statement stmt = null;
		StringBuffer showChildClass = new StringBuffer();
		ResultSet rsChild = null;
		strNbsp = strNbsp + "&nbsp;&nbsp;";
		Admin admin=DAOFactory.getAdminDaoInstance().showAdmin(adminid);
		String[] inserts=admin.getArrClass_Input().split(",");
		int i = 1;
		String strSql = "select ClassName,ClassID from site_class where ParentID="
				+ parentID + " ";
		
		
		
		if(inserts.length>0&&admin.getPurview()!=1)
		{
			strSql+=" and ( 1=2 ";
			
			//strSql+=" or ( 1=2 ";
			
			for(int a=0;a<inserts.length;a++)
			{
				strSql+=" or ClassID="+inserts[a];
			}
			strSql+=")";
		}
		
		System.out.println("查询子栏目："+strSql);
		
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rsChild = stmt.executeQuery(strSql);
			// System.out.println(strNbsp);
			while (rsChild.next()) {

				if (classID == rsChild.getInt("ClassID")) {
					showChildClass.append("<option value="
							+ rsChild.getInt("ClassID") + " selected>"
							+ strNbsp + "└" + rsChild.getString("ClassName")
							+ "</option>");
				} else {
					showChildClass.append("<option value="
							+ rsChild.getInt("ClassID") + " >" + strNbsp + "└"
							+ rsChild.getString("ClassName") + "</option>");
				}

				showChildClass.append(queryAllChild(rsChild.getInt("ClassID"),
						classID, strNbsp,adminid));

			}

		} catch (Exception ex) {

			System.out.println("检索子类出错" + strSql + ex);
		}
		rsChild.close();
        conn.closeConnection();
		return showChildClass.toString();
	}
	
	
	public String showAllChild(int parentID, String strNbsp)
			throws Exception {
		DbConnection conn=new DbConnection();
		Statement stmt = null;
		StringBuffer showChildClass = new StringBuffer();
		ResultSet rsChild = null;
		strNbsp = strNbsp + "&nbsp;&nbsp;&nbsp;";
		String strSql = "select ClassName,ClassID,ClassDir from site_class where ParentID="+ parentID + " ";
		try {
	
			stmt = conn.getConnection().createStatement();
			rsChild = stmt.executeQuery(strSql);
			// System.out.println(strNbsp);
			while (rsChild.next()) {
		    showChildClass.append("<tr class=tdbg onMouseOut=this.className='tdbg' onmouseover=this.className='tdbgmouseover'>");
		    showChildClass.append("<td width=30 align=center>"+rsChild.getString("ClassID")+"</td>");
		    showChildClass.append("<td>"+strNbsp+"<img src=Images/Folder/tree_folder3.gif width=15 height=15 valign=abvmiddle>");
		    showChildClass.append("<a href=Admin_Class_Modfy.jsp?ClassID="+rsChild.getInt("ClassID")+">"+rsChild.getString("ClassName")+"</a>&nbsp;&nbsp;["+rsChild.getString("ClassDir")+"]</td>");
		    showChildClass.append("<td align=left width=380>&nbsp;&nbsp;<a href=Admin_Class_Add.jsp?ClassID="+rsChild.getInt("ClassID")+">添加子栏目</a>&nbsp;|&nbsp;&nbsp;");
		    showChildClass.append("<a href=Admin_Class_ModfySave.jsp?Action=Clear&ClassID="+rsChild.getInt("ClassID")+" onClick='return ConfirmDel3()';>清空</a>&nbsp;|&nbsp;&nbsp;");
			showChildClass.append("<a href=Admin_Class_ModfySave.jsp?Action=Del&ClassID="+rsChild.getInt("ClassID")+" onClick='return ConfirmDel2()';>删除</a></td></tr>");		
            showChildClass.append(showAllChild(rsChild.getInt("ClassID"), strNbsp));
			}

		} catch (Exception ex) {

			System.out.println("检索子类出错" + strSql + ex);
		}
		rsChild.close();
        conn.closeConnection();
		return showChildClass.toString();
	}
	public String queryChildClass(int parentID, String strNbsp,String purview_View,String purview_Input,String purview_Check,String purview_Manage) throws Exception
	{
		
		DbConnection conn=new DbConnection();
		Statement stmt = null;
		StringBuffer showChildClass = new StringBuffer();
		ResultSet rsChild = null;
		strNbsp = strNbsp + "&nbsp;&nbsp;";
		String strSql = "select ClassName,ClassID,ClassDir from site_class where ParentID="+ parentID + " ";
		try {
		
			stmt = conn.getConnection().createStatement();
			rsChild = stmt.executeQuery(strSql);
			// System.out.println(strNbsp);
			while (rsChild.next()) {
		    showChildClass.append("<tr class='tdbg'>");
		    showChildClass.append("<td>"+strNbsp+"<img src='Images/Folder/tree_folder4.gif' width='15' height='15' valign='abvmiddle'>"+rsChild.getString("ClassName")+"</td>");
		    showChildClass.append("<td width='30' align='center'><input name='Purview_View' type='checkbox' id='Purview_View' value='"+rsChild.getInt("ClassID")+"' ");
		    if(purview_View.indexOf(Integer.toString(rsChild.getInt("ClassID")))>=0)
		    {
		    	showChildClass.append(" checked");
		    	
		    }
		    showChildClass.append("></td>");		    
		    showChildClass.append("<td width='30' align='center'><input name='Purview_Input' type='checkbox' id='Purview_Input' value='"+rsChild.getInt("ClassID")+"' ");
		    if(purview_Input.indexOf(Integer.toString(rsChild.getInt("ClassID")))>=0)
		    {
		    	showChildClass.append(" checked");
		    	
		    }
		    showChildClass.append("></td>");
		    showChildClass.append("<td width='30' align='center'><input name='Purview_Check' type='checkbox' id='Purview_Check' value='"+rsChild.getInt("ClassID")+"' ");
		    if(purview_Check.indexOf(Integer.toString(rsChild.getInt("ClassID")))>=0)
		    {
		    	showChildClass.append(" checked");
		    	
		    }
		    showChildClass.append("></td>");
		    showChildClass.append("<td width='30' align='center'><input name='Purview_Manage' type='checkbox' id='Purview_Manage' value='"+rsChild.getInt("ClassID")+"' ");
		    if(purview_Manage.indexOf(Integer.toString(rsChild.getInt("ClassID")))>=0)
		    {
		    	showChildClass.append(" checked");
		    	
		    }
		    showChildClass.append("></td>");
			showChildClass.append("</tr>");		
            showChildClass.append(queryChildClass(rsChild.getInt("ClassID"), strNbsp,purview_View,purview_Input,purview_Check,purview_Manage));
			}

		} catch (Exception ex) {

			System.out.println("检索子类出错" + strSql + ex);
		}
		rsChild.close();
        conn.closeConnection();
		return showChildClass.toString();
		
		
	}
	public int getParentID(int classID) throws Exception
	{
		
		DbConnection conn=new DbConnection();
		Statement stmt=null;
		ResultSet rs=null;
		int parentID=0;
	    String strSql="select ParentID from site_class where ClassID="+classID+"";
	    try{
	    	 
	    	stmt=conn.getConnection().createStatement();
	    	rs=stmt.executeQuery(strSql);
	    	if(rs.next())
	    	{
	    		parentID=rs.getInt("ParentID");
	    		
	    	}
	    	
	    }
		catch(Exception ex)
		{
			System.out.println("查询分类发生错误！");
			System.out.println(ex);
			
		}
		rs.close();
		conn.closeConnection();		
		return parentID;
		
		
	}
	/**
	 * 显示1级栏目
	 */
	public String queryOneTop(int parentID, int classID) throws Exception {
		DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer showClass = new StringBuffer();
		String strNbsp = "";
		
		String strSql = "select ClassName,ClassID from site_class  ";
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				if (classID == rs.getInt("ClassID")) {
					showClass.append("<option value=" + rs.getInt("ClassID")
							+ " selected readonly='readonly'>" + rs.getString("ClassName")
							+ "</option>");
				} else {
					showClass.append("<option value=" + rs.getInt("ClassID")
							+ " >" + rs.getString("ClassName") + "</option>");
				}
				
			}

		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + strSql + ex.getMessage());

		}

		System.out.print(showClass+"================"+strSql);
		rs.close();
		conn.closeConnection();
		return showClass.toString();

	}
	/**
	 * 显示1级栏目权限不同显示的不同
	 */
	public String queryOneTop(String parentID, int classID) throws Exception {
		DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer showClass = new StringBuffer();
		String strNbsp = "";
		
		String strSql = "select ClassName,ClassID from site_class where  Depth=0 and ClassID in ("
				+parentID+ " )";
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);
			System.out.println(strSql);
				while (rs.next()) {
				
				System.out.println(classID);
				if (classID == rs.getInt("ClassID")) {
					showClass.append("<option value='" + rs.getInt("ClassID")
							+ "'   selected >" + rs.getString("ClassName")
							+ "</option>");
				} else {
					showClass.append("<option value=" + rs.getInt("ClassID")
							+ " >" + rs.getString("ClassName") + "</option>");
				}
				
			}

		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + strSql + ex.getMessage());

		}

		System.out.print(showClass+"================"+strSql);
		rs.close();
		conn.closeConnection();
		return showClass.toString();
	}/**
	 * 显示所有级栏目权限不同显示的不同
	 */
	public String queryOneTop(String parentID, int classID,boolean deptno ) throws Exception {
		DbConnection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer showClass = new StringBuffer();
		String strNbsp = "";
		
		String strSql = "select ClassName,ClassID from site_class where ClassID in ("
				+parentID+ " ) or ClassID="+classID;
		
		System.out.println(strSql);
		try {
			conn = new DbConnection();
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				if (classID == rs.getInt("ClassID")) {
					showClass.append("<option value=" + rs.getInt("ClassID")
							+ " selected readonly='readonly'>" + rs.getString("ClassName")
							+ "</option>");
				} else {
					showClass.append("<option value=" + rs.getInt("ClassID")
							+ " >" + rs.getString("ClassName") + "</option>");
				}
				
			}

		} catch (Exception ex) {
			System.out.println("检索文章分类出错" + strSql + ex.getMessage());

		}

		rs.close();
		conn.closeConnection();
		return showClass.toString();
	}
}
