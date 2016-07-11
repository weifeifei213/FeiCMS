<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="PubPackage.jsp"%>
<%
int adminID=0;
Admin admin=new Admin();
String purview_View="";
String purview_Input="";
String purview_Check="";
String purview_Manage="";
if(!(request.getParameter("AdminID")==null||"".equals(request.getParameter("AdminID"))))
{
 adminID=Integer.parseInt(request.getParameter("AdminID"));
 admin=DAOFactory.getAdminDaoInstance().showAdmin(adminID);
 purview_View=admin.getArrClass_View();
 purview_Input=admin.getArrClass_Input();
 purview_Check=admin.getArrClass_Check();
 purview_Manage=admin.getArrClass_Manage();

}

 %>
<html>
	<head>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<link href='CSS/Admin_Style.css' rel='stylesheet' type='text/css'>
		<title>设置栏目权限</title>
	</head>
	<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
		
			<table width='100%' border='0' cellspacing='1' cellpadding='2'
				class='border'>
				<tr align='center' class='title' height='22'>
					<td>
						<strong>栏目名称</strong>
					</td>
					<td width='30'>
						<strong>查看</strong>
					</td>
					<td width='30'>
						<strong>录入</strong>
					</td>
					<td width='30'>
						<strong>审核</strong>
					</td>
					<td width='30' height='22'>
						<strong>管理</strong>
					</td>
				</tr>
			<% 
			//显示文章分类
			DbConnection conn=null;
			ResultSet rs=null;
			String strNbsp="";
			String strSql="select ClassName,ClassID,ClassDir from article_class where Depth=0";
			try{
			conn=new DbConnection();
			rs=conn.executeQuerySql(strSql);
			while(rs.next()){
			%>
				
				<tr class='tdbg'>
					<td>
						<img src='Images/Folder/tree_folder4.gif' width='15' height='15'
							valign='abvmiddle'>
						<b><%=rs.getString("ClassName") %></td>
					<td width='30' align='center'>
						<input name='Purview_View' type='checkbox' id='Purview_View'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_View.indexOf(rs.getInt("ClassID"))>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Input' type='checkbox' id='Purview_Input'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Input.indexOf(rs.getInt("ClassID"))>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Check' type='checkbox' id='Purview_Check'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Check.indexOf(rs.getInt("ClassID"))>=0){out.print("checked");} %>>
					</td>
					<td width='30' align='center'>
						<input name='Purview_Manage' type='checkbox' id='Purview_Manage'
							value='<%=rs.getInt("ClassID")%>' <%if(purview_Manage.indexOf(rs.getInt("ClassID"))>=0){out.print("checked");} %>>
					</td>
				</tr>
			
				<%
			out.println(DAOFactory.getArticleClassDaoInstance().queryChildClass(rs.getInt("ClassID"),strNbsp,purview_View,purview_Input,purview_Check,purview_Manage));
			}			 
			}
			catch(Exception ex)
			{
			out.println("<tr class=tdbg><td colspan=3 align=center>"+ex+"</td></tr>");
			}
			rs.close();
			conn.closeConnection();
			%>
				</table>
			</body>
			</html>